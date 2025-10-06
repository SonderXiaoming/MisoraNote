import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

@DriftDatabase(tables: [])
class _TempDb extends GeneratedDatabase {
  _TempDb(QueryExecutor e) : super(e);
  @override
  int get schemaVersion => 1;
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables => const [];
}

/// 查询某个表的 CREATE TABLE 语句
Future<String?> _getCreateTable(_TempDb db, String tableName) async {
  final rows = await db
      .customSelect(
        "SELECT sql FROM sqlite_master WHERE type='table' AND name = ?",
        variables: [Variable<String>(tableName)],
        readsFrom: {},
      )
      .get();
  if (rows.isEmpty) return null;
  return rows.first.read<String>('sql');
}

/// 查询表的所有列（按 cid 顺序）
Future<List<String>> _getTableColumns(_TempDb db, String tableName) async {
  final rows = await db
      .customSelect("PRAGMA table_info(`$tableName`)", readsFrom: {})
      .get();
  // row: cid | name | type | notnull | dflt_value | pk
  return rows.map((r) => r.read<String>('name')).toList(growable: false);
}

/// 执行事务，返回是否成功
Future<bool> _execTransaction(_TempDb db, List<String> commands) async {
  try {
    await db.transaction(() async {
      for (final cmd in commands) {
        await db.customStatement(cmd);
      }
    });
    return true;
  } catch (e) {
    print('Transaction failed: $e');
    return false;
  }
}

/// 根据 Python 逻辑实现 unhash：为每张表执行：
/// 1) 根据源表 CREATE 生成目标表 CREATE
/// 2) INSERT INTO 目标表 SELECT * FROM 源表
/// 3) DROP 源表
Future<void> unhashDatabase(String dbPath) async {
  try {
    // 读取 rainbow.json
    final jsonString = await rootBundle.loadString('resources/db/rainbow.json');
    final Map<String, dynamic> jsonObject = json.decode(jsonString);

    print('Start Unhashing DB.');

    final db = _TempDb(NativeDatabase(File(dbPath)));
    try {
      // 遍历 rainbow.json 中的每个表
      for (final entry in jsonObject.entries) {
        final String hashedTableName = entry.key;
        final dynamic colsDict = entry.value;

        if (colsDict is! Map<String, dynamic>) {
          continue;
        }

        // 获取目标表名
        final String? intactTableName = colsDict['--table_name'];
        if (intactTableName == null || intactTableName.isEmpty) {
          continue;
        }

        // 获取 CREATE TABLE 语句
        final String? createTableStatement = await _getCreateTable(
          db,
          hashedTableName,
        );
        final String? createDecTableStatement = await _getCreateTable(
          db,
          intactTableName,
        );

        // 如果源表不存在
        if (createTableStatement == null) {
          if (createDecTableStatement == null) {
            print("CreateTableStatement for '$intactTableName' not found.");
          }
          continue;
        }

        // 构建列映射
        final List<String> hashedCols = [];
        final List<String> intactCols = [];

        // 处理映射的列
        for (final colEntry in colsDict.entries) {
          final String hashedColName = colEntry.key;
          final dynamic intactColName = colEntry.value;

          if (hashedColName != '--table_name' && intactColName is String) {
            hashedCols.add(hashedColName);
            intactCols.add(intactColName);
          }
        }

        // 替换表名和列名
        String newCreateStatement = createTableStatement.replaceAll(
          hashedTableName,
          intactTableName,
        );

        for (int i = 0; i < hashedCols.length; i++) {
          newCreateStatement = newCreateStatement.replaceAll(
            hashedCols[i],
            intactCols[i],
          );
        }

        // 添加未映射的列（保持原名）
        final List<String> allHashedCols = await _getTableColumns(
          db,
          hashedTableName,
        );
        for (final hashedColName in allHashedCols) {
          if (!hashedCols.contains(hashedColName)) {
            hashedCols.add(hashedColName);
            intactCols.add(hashedColName);
          }
        }

        // 构建 SQL 语句
        final String insertStatement =
            'INSERT INTO `$intactTableName` (`${intactCols.join('`, `')}`) '
            'SELECT `${hashedCols.join('`, `')}` FROM `$hashedTableName`';
        final String dropTableStatement = 'DROP TABLE `$hashedTableName`';

        final List<String> transactionCmd = [
          newCreateStatement,
          insertStatement,
          dropTableStatement,
        ];

        // 执行事务
        final bool success = await _execTransaction(db, transactionCmd);
        if (!success) {
          print(
            "Failed when executing a transaction for '$intactTableName' "
            "($hashedTableName). Transaction: $transactionCmd",
          );
          continue;
        }
      }

      print('Unhashing complete.');
    } finally {
      await db.close();
    }
  } catch (e) {
    print('Rainbow table not found, unhashing skipped. Error: $e');
  }
}
