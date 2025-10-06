import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';

class AllUnitData {
  final int unitId;
  final String unitName;
  final String? kana;
  final int? prefabId;
  final int? prefabIdBattle;
  final int? isLimited;
  final int? rarity;
  final int? motionType;
  final int? seType;
  final int? moveSpeed;
  final int? searchAreaWidth;
  final int? atkType;
  final double? normalAtkCastTime;
  final int? cutin1;
  final int? cutin2;
  final int cutin1Star6;
  final int? cutin2Star6;
  final int? guildId;
  final int? exskillDisplay;
  final String? comment;
  final int? onlyDispOwned;
  final String? startTime;
  final String? endTime;
  final int? originalUnitId;

  final int cutin;
  final int cutinStar6;
  final int visualChangeFlag;
  const AllUnitData({
    required this.unitId,
    required this.unitName,
    this.kana,
    this.prefabId,
    this.prefabIdBattle,
    this.isLimited,
    this.rarity,
    this.motionType,
    this.seType,
    this.moveSpeed,
    this.searchAreaWidth,
    this.atkType,
    this.normalAtkCastTime,
    this.cutin1,
    this.cutin2,
    this.cutin1Star6 = 0,
    this.cutin2Star6,
    this.guildId,
    this.exskillDisplay,
    this.comment,
    this.onlyDispOwned,
    this.startTime,
    this.endTime,
    this.originalUnitId,
    this.cutin = 0,
    this.cutinStar6 = 0,
    this.visualChangeFlag = 0,
  });

  static AllUnitData fromUnitEnemyData(UnitEnemyDataData data) {
    return AllUnitData(
      unitId: data.unitId,
      unitName: data.unitName,
      kana: "",
      prefabId: data.prefabId,
      prefabIdBattle: 0,
      isLimited: 0,
      rarity: 0,
      motionType: data.motionType,
      seType: data.seType,
      moveSpeed: data.moveSpeed,
      searchAreaWidth: data.searchAreaWidth,
      atkType: data.atkType,
      normalAtkCastTime: data.normalAtkCastTime,
      cutin1: data.cutin,
      cutin2: data.cutin,
      cutin1Star6: data.cutinStar6,
      cutin2Star6: data.cutinStar6,
      guildId: 0,
      exskillDisplay: 0,
      comment: data.comment,
      onlyDispOwned: 0,
      startTime: null,
      endTime: null,
      originalUnitId: null,
      cutin: data.cutin,
      cutinStar6: data.cutinStar6,
      visualChangeFlag: data.visualChangeFlag,
    );
  }

  static AllUnitData fromUnitData(UnitDataData data) {
    return AllUnitData(
      unitId: data.unitId,
      unitName: data.unitName,
      rarity: data.rarity,
      searchAreaWidth: data.searchAreaWidth,
      atkType: data.atkType,
      normalAtkCastTime: data.normalAtkCastTime,
      cutin1: data.cutin1,
      cutin2: data.cutin2,
      cutin1Star6: data.cutin1Star6 ?? 0,
      cutin2Star6: data.cutin2Star6,
      kana: data.kana,
      prefabId: data.prefabId,
      prefabIdBattle: data.prefabIdBattle,
      isLimited: data.isLimited,
      motionType: data.motionType,
      seType: data.seType,
      moveSpeed: data.moveSpeed,
      guildId: data.guildId,
      exskillDisplay: data.exskillDisplay,
      comment: data.comment,
      onlyDispOwned: data.onlyDispOwned,
      startTime: data.startTime,
      endTime: data.endTime,
      originalUnitId: data.originalUnitId,
      cutin: data.cutin1 ?? 0,
      cutinStar6: data.cutin1Star6 ?? 0,
      visualChangeFlag: 0,
    );
  }
}
