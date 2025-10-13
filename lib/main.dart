// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/storage/prefs.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 FilePath（必须在使用 FilePath 之前调用）
  await FilePath.init();

  await Hive.initFlutter();
  // 可在此注册 HiveAdapter、打开 Box、加载配置等
  Area initialArea;
  try {
    initialArea = await Prefs.databaseArea();
  } catch (_) {
    initialArea = Area.cn;
  }
  runApp(
    ProviderScope(
      overrides: [areaProvider.overrideWith(() => AreaNotifier(initialArea))],
      child: App(),
    ),
  );
}
