import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/general.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/skill/skill_info.dart';
import 'package:misora_note/features/component/skill/skill_type.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:misora_note/core/storage/prefs.dart';

class AreaNotifier extends Notifier<Area> {
  AreaNotifier([this._seed]);
  final Area? _seed;

  @override
  Area build() {
    // 用 main() 注入的初始值；没有就默认 CN
    return _seed ?? Area.cn;
  }

  Future<void> set(Area a) async {
    if (a == state) return;
    state = a;
    await Prefs.setDatabaseArea(a);
  }
}

final areaProvider = NotifierProvider<AreaNotifier, Area>(AreaNotifier.new);

final dbProvider = Provider<AppDb>((ref) {
  final area = ref.watch(areaProvider);
  final db = AppDb(FilePath.db(area));

  ref.onDispose(() {
    try {
      db.close();
    } catch (_) {}
  });

  return db;
});

final dominantColorProvider =
    FutureProvider.family<(Color?, Color?), CachedImage>((ref, image) async {
      return await image.getDominantColor();
    });

final unitInfoProvider = FutureProvider.family<UnitInfo?, int>((
  ref,
  unitId,
) async {
  final db = ref.watch(dbProvider);
  return db.getUnitInfo(unitId);
});

final unitDataProvider = FutureProvider.family<UnitDataData, int>((
  ref,
  unitId,
) async {
  final db = ref.watch(dbProvider);
  return db.getUnitData(unitId);
});

final enemyDataProvider = FutureProvider.family<UnitEnemyDataData?, int>((
  ref,
  unitId,
) async {
  final db = ref.watch(dbProvider);
  return db.getEnemyData(unitId);
});

final enemyTalentWeaknessProvider =
    FutureProvider.family<EnemyWeaknessInfo?, int>((ref, enemyId) async {
      final db = ref.watch(dbProvider);
      return db.getEnemyTalentWeakness(enemyId);
    });

final unitUniqueEquipProvider =
    FutureProvider.family<UniqueEquipInfo?, UnitUniqueEquipParameter>((
      ref,
      parameter,
    ) async {
      final db = ref.watch(dbProvider);
      return db.getUniqueEquipInfo(
        parameter.unitId,
        slot: parameter.solt,
        lv: parameter.lv,
      );
    });

final unitSkillListProvider =
    FutureProvider.family<UnitSkillList, UnitSkillListParameter>((
      ref,
      parameter,
    ) async {
      final db = ref.watch(dbProvider);
      return getUnitSkillList(
        db,
        parameter.unitId,
        levelMap: parameter.levelMap,
      );
    });

final unitAttackPatternProvider =
    FutureProvider.family<List<UnitAttackPatternData>, int>((
      ref,
      unitId,
    ) async {
      final db = ref.watch(dbProvider);
      return db.getAttackPattern(unitId);
    });

final packageInfoProvider = FutureProvider<PackageInfo>((ref) async {
  return await PackageInfo.fromPlatform();
});

/// 敌人参数获取策略
typedef _EnemyParameterFetcher =
    Future<AllUnitParameter?> Function(AppDb db, int enemyId);

/// 敌人类型与获取策略的映射
final _enemyParameterStrategies = <EnemyType, _EnemyParameterFetcher>{
  EnemyType.normal: (db, id) async =>
      AllUnitParameter.fromEnemyParameter(await db.getEnemyParameter(id)),
  EnemyType.event: (db, id) async {
    var result = AllUnitParameter.fromEventEnemyParameter(
      await db.getEventEnemyParameter(id),
    );
    if (result == null) {
      try {
        result = AllUnitParameter.fromSevenEnemyParameter(
          await db.getSevenEnemyParameter(id),
        );
      } catch (_) {}
    }
    return result;
  },
  EnemyType.talentQuest: (db, id) async =>
      AllUnitParameter.fromTalentQuestEnemyParameter(
        await db.getTalentQuestEnemyParameter(id),
      ),
  EnemyType.shiori: (db, id) async => AllUnitParameter.fromShioriEnemyParameter(
    await db.getShioriEnemyParameter(id),
  ),
  EnemyType.sre: (db, id) async =>
      AllUnitParameter.fromSreEnemyParameter(await db.getSreEnemyParameter(id)),
  EnemyType.tower: (db, id) async => AllUnitParameter.fromTowerEnemyParameter(
    await db.getTowerEnemyParameter(id),
  ),
};

final enemyParameterProvider =
    FutureProvider.family<AllUnitParameter?, EnemyParameterProviderParameter>((
      ref,
      parameter,
    ) async {
      final db = ref.watch(dbProvider);
      final enemyType = parameter.enemyType ?? EnemyType.normal;

      // 处理特定类型
      if (enemyType != EnemyType.all) {
        final fetcher = _enemyParameterStrategies[enemyType];
        if (fetcher != null) {
          final result = await fetcher(db, parameter.enemyId);
          return result;
        }
        return null;
      }

      // 处理 all 类型：按顺序尝试所有策略
      for (final entry in _enemyParameterStrategies.entries) {
        try {
          final result = await entry.value(db, parameter.enemyId);
          if (result != null) {
            return result;
          }
        } catch (_) {
          // 继续尝试下一个策略
          continue;
        }
      }

      return null;
    });

// 语言设置 Notifier
class LanguageNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    return await Prefs.language();
  }

  Future<void> set(String languageCode) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Prefs.setLanguage(languageCode);
      return languageCode;
    });
  }
}

// 数据库区域设置 Notifier
class DatabaseAreaNotifier extends AsyncNotifier<Area> {
  @override
  Future<Area> build() async {
    return await Prefs.databaseArea();
  }

  Future<void> set(Area area) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Prefs.setDatabaseArea(area);
      // 同时更新 areaProvider 以触发 dbProvider 刷新
      ref.read(areaProvider.notifier).set(area);
      return area;
    });
  }
}

class DatabaseAutoUpdateNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    // 用 main() 注入的初始值；没有就默认 false
    return await Prefs.needAutoUpdate();
  }

  Future<void> set(bool v) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Prefs.setAutoUpdate(v);
      return v;
    });
  }
}

class UseOldVersionNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    // 用 main() 注入的初始值；没有就默认 false
    return await Prefs.useOldVersion();
  }

  Future<void> set(bool v) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Prefs.setUseOldVersion(v);
      return v;
    });
  }
}

class CurrentDbVersionNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    final currentArea = ref.watch(areaProvider);
    return await Prefs.dbVersion(currentArea);
  }

  Future<void> set(String? version) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentArea = ref.read(areaProvider);
      if (version != null) {
        await Prefs.setDbVersion(currentArea, version);
      }
      return version;
    });
  }
}

class AppAutoUpdateNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    // 用 main() 注入的初始值；没有就默认 false
    return await Prefs.appAutoUpdate();
  }

  Future<void> set(bool v) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Prefs.setAppAutoUpdate(v);
      return v;
    });
  }
}

// 用户偏好设置 Provider
final languageProvider = AsyncNotifierProvider<LanguageNotifier, String>(() {
  return LanguageNotifier();
});

final databaseAreaProvider = AsyncNotifierProvider<DatabaseAreaNotifier, Area>(
  () {
    return DatabaseAreaNotifier();
  },
);

final databaseAutoUpdateProvider =
    AsyncNotifierProvider<DatabaseAutoUpdateNotifier, bool>(() {
      return DatabaseAutoUpdateNotifier();
    });

final useOldVersionProvider =
    AsyncNotifierProvider<UseOldVersionNotifier, bool>(() {
      return UseOldVersionNotifier();
    });

final currentDbVersionProvider =
    AsyncNotifierProvider<CurrentDbVersionNotifier, String?>(() {
      return CurrentDbVersionNotifier();
    });

final appAutoUpdateProvider =
    AsyncNotifierProvider<AppAutoUpdateNotifier, bool>(() {
      return AppAutoUpdateNotifier();
    });

final clearAllPrefsProvider = Provider<Future<void>>((ref) async {
  await Prefs.clear();
  ref.invalidate(languageProvider);
  ref.invalidate(databaseAreaProvider);
  ref.invalidate(databaseAutoUpdateProvider);
});
