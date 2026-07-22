import 'package:flutter/material.dart';
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

final uniqueEquipListProvider =
    FutureProvider.family<
      List<UniqueEquipListItem>,
      ({String search, int slot, int unitId})
    >((ref, filter) {
      final db = ref.watch(dbProvider);
      if (!db.dbFile.existsSync()) {
        throw StateError('数据库文件不存在，请先在首页下载数据库');
      }
      return db.getUniqueEquipList(
        search: filter.search,
        slot: filter.slot,
        unitId: filter.unitId,
      );
    });

final deepZoneQuestProvider = FutureProvider.family<List<DeepZoneQuest>, int>((
  ref,
  talentId,
) {
  final db = ref.watch(dbProvider);
  if (!db.dbFile.existsSync()) {
    throw StateError('数据库文件不存在，请先在首页下载数据库');
  }
  return db.getDeepZoneQuests(talentId);
});

final bondUnitSearchProvider = FutureProvider.family<List<UnitSummary>, String>(
  (ref, search) {
    final db = ref.watch(dbProvider);
    if (!db.dbFile.existsSync()) {
      throw StateError('数据库文件不存在，请先在首页下载数据库');
    }
    return db.searchBondUnits(search);
  },
);

final characterBondStoriesProvider =
    FutureProvider.family<List<CharacterBondStory>, int>((ref, unitId) {
      final db = ref.watch(dbProvider);
      if (!db.dbFile.existsSync()) {
        throw StateError('数据库文件不存在，请先在首页下载数据库');
      }
      return db.getCharacterBondStories(unitId);
    });

final scheduleOverviewProvider = FutureProvider<ScheduleOverview>((ref) async {
  final db = ref.watch(dbProvider);
  final area = ref.watch(areaProvider);
  if (!db.dbFile.existsSync()) return const ScheduleOverview.empty();

  final events = await db.getScheduleEvents(
    utcOffsetHours: area == Area.jp ? 9 : 8,
  );
  return ScheduleOverview.fromEvents(events);
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
        enemyParameter: parameter.enemyParameter,
        atkType: parameter.atkType,
        normalAttackCastTime: parameter.normalAttackCastTime,
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

final clanBattleListProvider =
    FutureProvider.family<List<ClanBattleData>, int?>((ref, clanBattleId) {
      final db = ref.watch(dbProvider);
      return db.getClanBattles(clanBattleId: clanBattleId);
    });

final clanBattlePhasesProvider =
    FutureProvider.family<List<ClanBattlePhaseData>, int>((ref, clanBattleId) {
      final db = ref.watch(dbProvider);
      return db.getClanBattlePhases(clanBattleId);
    });

final enemySearchProvider =
    FutureProvider.family<
      List<EnemySearchResult>,
      ({String search, EnemyType type, bool searchById, bool ascending})
    >((ref, filter) {
      final db = ref.watch(dbProvider);
      if (!db.dbFile.existsSync()) {
        throw StateError('数据库文件不存在，请先在首页下载数据库');
      }
      return db.searchEnemyParameters(
        search: filter.search,
        type: filter.type,
        searchById: filter.searchById,
        ascending: filter.ascending,
      );
    });

final packageInfoProvider = FutureProvider<PackageInfo>((ref) async {
  return await PackageInfo.fromPlatform();
});

/// 敌人参数获取策略
typedef _EnemyParameterFetcher =
    Future<AllUnitParameter?> Function(AppDb db, int enemyId);

AllUnitParameter? _allUnitParameterFromSekaiRow(Map<String, Object?>? row) {
  if (row == null) return null;
  int intValue(String key) => (row[key] as num?)?.toInt() ?? 0;
  double doubleValue(String key) => (row[key] as num?)?.toDouble() ?? 0;

  return AllUnitParameter(
    enemyId: intValue('sekai_enemy_id'),
    unitId: intValue('unit_id'),
    name: row['name'] as String? ?? '',
    level: intValue('level'),
    rarity: intValue('rarity'),
    promotionLevel: intValue('promotion_level'),
    hp: intValue('hp'),
    atk: intValue('atk'),
    magicStr: intValue('magic_str'),
    def_: doubleValue('def'),
    magicDef: intValue('magic_def'),
    physicalCritical: intValue('physical_critical'),
    magicCritical: intValue('magic_critical'),
    waveHpRecovery: intValue('wave_hp_recovery'),
    waveEnergyRecovery: intValue('wave_energy_recovery'),
    dodge: intValue('dodge'),
    physicalPenetrate: intValue('physical_penetrate'),
    magicPenetrate: intValue('magic_penetrate'),
    lifeSteal: intValue('life_steal'),
    hpRecoveryRate: intValue('hp_recovery_rate'),
    energyRecoveryRate: intValue('energy_recovery_rate'),
    energyReduceRate: intValue('energy_reduce_rate'),
    unionBurstLevel: intValue('union_burst_level'),
    mainSkillLv1: intValue('main_skill_lv_1'),
    mainSkillLv2: intValue('main_skill_lv_2'),
    mainSkillLv3: intValue('main_skill_lv_3'),
    mainSkillLv4: intValue('main_skill_lv_4'),
    mainSkillLv5: intValue('main_skill_lv_5'),
    mainSkillLv6: intValue('main_skill_lv_6'),
    mainSkillLv7: intValue('main_skill_lv_7'),
    mainSkillLv8: intValue('main_skill_lv_8'),
    mainSkillLv9: intValue('main_skill_lv_9'),
    mainSkillLv10: intValue('main_skill_lv_10'),
    exSkillLv1: intValue('ex_skill_lv_1'),
    exSkillLv2: intValue('ex_skill_lv_2'),
    exSkillLv3: intValue('ex_skill_lv_3'),
    exSkillLv4: intValue('ex_skill_lv_4'),
    exSkillLv5: intValue('ex_skill_lv_5'),
    resistStatusId: intValue('resist_status_id'),
    resistVariationId: intValue('resist_variation_id'),
    accuracy: intValue('accuracy'),
    breakDurability: intValue('break_durability'),
    uniqueEquipmentFlag1: intValue('unique_equipment_flag_1'),
    virtualHp: intValue('virtual_hp'),
    enemyColor: intValue('enemy_color'),
  );
}

/// 敌人类型与获取策略的映射
final Map<EnemyType, _EnemyParameterFetcher> _enemyParameterStrategies = {
  EnemyType.normal: (db, id) async =>
      AllUnitParameter.fromEnemyParameter(await db.getEnemyParameter(id)),
  EnemyType.event: (db, id) async => AllUnitParameter.fromEventEnemyParameter(
    await db.getEventEnemyParameter(id),
  ),
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
  EnemyType.seven: (db, id) async => AllUnitParameter.fromSevenEnemyParameter(
    await db.getSevenEnemyParameter(id),
  ),
  EnemyType.sekai: (db, id) async =>
      _allUnitParameterFromSekaiRow(await db.getSekaiEnemyParameter(id)),
  EnemyType.clan: (db, id) async =>
      _enemyParameterStrategies[EnemyType.normal]!(db, id),
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
      for (final entry in _enemyParameterStrategies.entries.where(
        (entry) => entry.key != EnemyType.clan,
      )) {
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
class LanguageNotifier extends AsyncNotifier<Language> {
  @override
  Future<Language> build() async {
    return await Prefs.language();
  }

  Future<void> set(Language languageCode) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Prefs.setLanguage(languageCode);
      return languageCode;
    });
  }
}

class ThemeModeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    final storedMode = await Prefs.themeMode();
    if (storedMode < 0 || storedMode >= ThemeMode.values.length) {
      return ThemeMode.system;
    }
    return ThemeMode.values[storedMode];
  }

  Future<void> set(ThemeMode mode) async {
    state = AsyncValue.data(mode);
    await Prefs.setThemeMode(mode.index);
  }
}

class ThemeSeedColorNotifier extends AsyncNotifier<int> {
  @override
  Future<int> build() => Prefs.themeSeedColor();

  Future<void> set(int colorValue) async {
    state = AsyncValue.data(colorValue);
    await Prefs.setThemeSeedColor(colorValue);
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
final languageProvider = AsyncNotifierProvider<LanguageNotifier, Language>(() {
  return LanguageNotifier();
});

final themeModeProvider = AsyncNotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

final themeSeedColorProvider =
    AsyncNotifierProvider<ThemeSeedColorNotifier, int>(
      ThemeSeedColorNotifier.new,
    );

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

final resetPrefsProvider = Provider<Future<void>>((ref) async {
  await Prefs.resetToDefaults();
  ref.invalidate(themeModeProvider);
  ref.invalidate(themeSeedColorProvider);
  ref.invalidate(languageProvider);
  ref.invalidate(databaseAreaProvider);
  ref.invalidate(databaseAutoUpdateProvider);
  ref.invalidate(useOldVersionProvider);
  ref.invalidate(appAutoUpdateProvider);
});
