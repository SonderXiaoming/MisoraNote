import 'package:drift/drift.dart';

class UnitProfile extends Table {
  @override
  String get tableName => 'unit_profile';
  @override
  Set<Column> get primaryKey => {unitId};

  IntColumn get unitId => integer().named('unit_id')();
  TextColumn get unitName => text().named('unit_name')();
  TextColumn get age => text().named('age').nullable()();
  TextColumn get guild => text().named('guild').nullable()();
  TextColumn get race => text().named("race").nullable()();
  TextColumn get height => text().named("height").nullable()();
  TextColumn get weight => text().named("weight").nullable()();
  TextColumn get birthMonth => text().named("birth_month").nullable()();
  TextColumn get birthDay => text().named("birth_day").nullable()();
  TextColumn get bloodType => text().named("blood_type").nullable()();
  TextColumn get favorite => text().named("favorite").nullable()();
  TextColumn get voice => text().named("voice").nullable()();
  IntColumn get voiceId => integer().named("voice_id").nullable()();
  TextColumn get catchCopy => text().named("catch_copy").nullable()();
  TextColumn get selfText => text().named("self_text").nullable()();
  TextColumn get guildId => text().named("guild_id").nullable()();
}

class RedeemUnit extends Table {
  @override
  String get tableName => 'redeem_unit';

  IntColumn get id => integer().named('id').autoIncrement()();
  IntColumn get unitId => integer().named('unit_id')();
  IntColumn get slotId => integer().named('slot_id')();
  IntColumn get conditionCategory => integer().named('condition_category')();
  IntColumn get conditionId => integer().named('condition_id')();
  TextColumn get consumeNum => text().named('consume_num')();
}

class UnitData extends Table {
  @override
  String get tableName => "unit_data";
  @override
  Set<Column> get primaryKey => {unitId};

  IntColumn get unitId => integer().named("unit_id")();
  TextColumn get unitName => text().named("unit_name")();
  TextColumn get kana => text().named("kana").nullable()();
  IntColumn get prefabId => integer().named("prefab_id").nullable()();
  IntColumn get prefabIdBattle =>
      integer().named("prefab_id_battle").nullable()();
  IntColumn get isLimited => integer().named("is_limited").nullable()();
  IntColumn get rarity => integer().named("rarity").nullable()();
  IntColumn get motionType => integer().named("motion_type").nullable()();
  IntColumn get seType => integer().named("se_type").nullable()();
  IntColumn get moveSpeed => integer().named("move_speed").nullable()();
  IntColumn get searchAreaWidth =>
      integer().named("search_area_width").nullable()();
  IntColumn get atkType => integer().named("atk_type").nullable()();
  RealColumn get normalAtkCastTime =>
      real().named("normal_atk_cast_time").nullable()();
  IntColumn get cutin1 => integer().named("cutin_1").nullable()();
  IntColumn get cutin2 => integer().named("cutin_2").nullable()();
  IntColumn get cutin1Star6 => integer().named("cutin1_star6").nullable()();
  IntColumn get cutin2Star6 => integer().named("cutin2_star6").nullable()();
  IntColumn get guildId => integer().named("guild_id").nullable()();
  IntColumn get exskillDisplay =>
      integer().named("exskill_display").nullable()();
  TextColumn get comment => text().named("comment").nullable()();
  IntColumn get onlyDispOwned =>
      integer().named("only_disp_owned").nullable()();
  TextColumn get startTime => text().named("start_time").nullable()();
  TextColumn get endTime => text().named("end_time").nullable()();
  IntColumn get originalUnitId =>
      integer().named("original_unit_id").nullable()();
}

class UniqueEquipmentEnhanceData extends Table {
  @override
  String get tableName => "unique_equipment_enhance_data";
  @override
  Set<Column> get primaryKey => {equipSlot, enhanceLevel};
  IntColumn get equipSlot => integer().named("equip_slot")();
  IntColumn get enhanceLevel => integer().named("enhance_level")();
  IntColumn get neededPoint => integer().named("needed_point").nullable()();
  IntColumn get totalPoint => integer().named("total_point").nullable()();
  IntColumn get neededMana => integer().named("needed_mana").nullable()();
  IntColumn get rank => integer().named("rank").nullable()();
}

class ActualUnitBackground extends Table {
  @override
  String get tableName => "actual_unit_background";
  @override
  Set<Column> get primaryKey => {unitId};
  IntColumn get unitId => integer().named("unit_id")();
  TextColumn get unitName => text().named("unit_name").nullable()();
  IntColumn get bgId => integer().named("bg_id").nullable()();
  IntColumn get faceType => integer().named("face_type").nullable()();
}

class Rarity6QuestData extends Table {
  @override
  String get tableName => 'rarity_6_quest_data';
  @override
  Set<Column> get primaryKey => {unitId};

  IntColumn get rarity6QuestId => integer().named('rarity_6_quest_id')();
  IntColumn get unitId => integer().named('unit_id')();
  TextColumn get questName => text().named('quest_name')();
  IntColumn get limitTime => integer().named('limit_time')();
  IntColumn get recommendedLevel => integer().named('recommended_level')();
  IntColumn get rewardGroupId => integer().named('reward_group_id')();
  IntColumn get treasureType => integer().named('treasure_type')();

  IntColumn get rewardImage1 => integer().named('reward_image_1')();
  IntColumn get rewardCount1 => integer().named('reward_count_1')();
  IntColumn get rewardImage2 => integer().named('reward_image_2')();
  IntColumn get rewardCount2 => integer().named('reward_count_2')();
  IntColumn get rewardImage3 => integer().named('reward_image_3')();
  IntColumn get rewardCount3 => integer().named('reward_count_3')();
  IntColumn get rewardImage4 => integer().named('reward_image_4')();
  IntColumn get rewardCount4 => integer().named('reward_count_4')();
  IntColumn get rewardImage5 => integer().named('reward_image_5')();
  IntColumn get rewardCount5 => integer().named('reward_count_5')();

  IntColumn get background => integer().named('background')();
  IntColumn get bgPosition => integer().named('bg_position')();
  IntColumn get waveGroupId => integer().named('wave_group_id')();

  IntColumn get enemyPositionX1 => integer().named('enemy_position_x_1')();
  IntColumn get enemyLocalPositionY1 =>
      integer().named('enemy_local_position_y_1')();
  RealColumn get enemySize1 => real().named('enemy_size_1')();

  IntColumn get enemyPositionX2 => integer().named('enemy_position_x_2')();
  IntColumn get enemyLocalPositionY2 =>
      integer().named('enemy_local_position_y_2')();
  RealColumn get enemySize2 => real().named('enemy_size_2')();

  IntColumn get enemyPositionX3 => integer().named('enemy_position_x_3')();
  IntColumn get enemyLocalPositionY3 =>
      integer().named('enemy_local_position_y_3')();
  RealColumn get enemySize3 => real().named('enemy_size_3')();

  IntColumn get enemyPositionX4 => integer().named('enemy_position_x_4')();
  IntColumn get enemyLocalPositionY4 =>
      integer().named('enemy_local_position_y_4')();
  RealColumn get enemySize4 => real().named('enemy_size_4')();

  IntColumn get enemyPositionX5 => integer().named('enemy_position_x_5')();
  IntColumn get enemyLocalPositionY5 =>
      integer().named('enemy_local_position_y_5')();
  RealColumn get enemySize5 => real().named('enemy_size_5')();

  TextColumn get waveBgm => text().named('wave_bgm')();
}

class SkillData extends Table {
  @override
  String get tableName => 'skill_data';
  @override
  Set<Column> get primaryKey => {skillId};

  IntColumn get skillId => integer().named('skill_id')();
  TextColumn get name => text().named('name')();
  IntColumn get skillType => integer().named('skill_type')();
  IntColumn get skillAreaWidth => integer().named('skill_area_width')();
  RealColumn get skillCastTime => real().named('skill_cast_time')();
  RealColumn get bossUbCoolTime =>
      real().named('boss_ub_cool_time').nullable()();
  IntColumn get action1 => integer().named('action_1')();
  IntColumn get action2 => integer().named('action_2')();
  IntColumn get action3 => integer().named('action_3')();
  IntColumn get action4 => integer().named('action_4')();
  IntColumn get action5 => integer().named('action_5')();
  IntColumn get action6 => integer().named('action_6')();
  IntColumn get action7 => integer().named('action_7')();
  IntColumn get action8 => integer().named('action_8')();
  IntColumn get action9 => integer().named('action_9')();
  IntColumn get action10 => integer().named('action_10')();

  IntColumn get actionDepend1 => integer().named('depend_action_1')();
  IntColumn get actionDepend2 => integer().named('depend_action_2')();
  IntColumn get actionDepend3 => integer().named('depend_action_3')();
  IntColumn get actionDepend4 => integer().named('depend_action_4')();
  IntColumn get actionDepend5 => integer().named('depend_action_5')();
  IntColumn get actionDepend6 => integer().named('depend_action_6')();
  IntColumn get actionDepend7 => integer().named('depend_action_7')();
  IntColumn get actionDepend8 => integer().named('depend_action_8')();
  IntColumn get actionDepend9 => integer().named('depend_action_9')();
  IntColumn get actionDepend10 => integer().named('depend_action_10')();

  TextColumn get description => text().named('description').nullable()();
  IntColumn get iconType => integer().named('icon_type').nullable()();
}

class UnitSkillData extends Table {
  @override
  String get tableName => "unit_skill_data";
  @override
  Set<Column> get primaryKey => {unitId};
  IntColumn get unitId => integer().named("unit_id")();

  IntColumn get unionBurst => integer().named("union_burst")();
  IntColumn get spUnionBurst => integer().named("sp_union_burst")();
  IntColumn get unionBurstEvolution =>
      integer().named("union_burst_evolution").nullable()();
  // 主技能 (Main Skills)
  IntColumn get mainSkill1 => integer().named("main_skill_1")();
  IntColumn get mainSkill2 => integer().named("main_skill_2")();
  IntColumn get mainSkill3 => integer().named("main_skill_3")();
  IntColumn get mainSkill4 => integer().named("main_skill_4")();
  IntColumn get mainSkill5 => integer().named("main_skill_5")();
  IntColumn get mainSkill6 => integer().named("main_skill_6")();
  IntColumn get mainSkill7 => integer().named("main_skill_7")();
  IntColumn get mainSkill8 => integer().named("main_skill_8")();
  IntColumn get mainSkill9 => integer().named("main_skill_9")();
  IntColumn get mainSkill10 => integer().named("main_skill_10")();
  // 主技能进化 (Main Skill Evolutions)
  IntColumn get mainSkillEvolution1 =>
      integer().named("main_skill_evolution_1").nullable()();
  IntColumn get mainSkillEvolution2 =>
      integer().named("main_skill_evolution_2").nullable()();
  // EX 技能 (EX Skills)
  IntColumn get exSkill1 => integer().named("ex_skill_1")();
  IntColumn get exSkill2 => integer().named("ex_skill_2")();
  IntColumn get exSkill3 => integer().named("ex_skill_3")();
  IntColumn get exSkill4 => integer().named("ex_skill_4")();
  IntColumn get exSkill5 => integer().named("ex_skill_5")();
  // EX 技能进化 (EX Skill Evolutions)
  IntColumn get exSkillEvolution1 =>
      integer().named("ex_skill_evolution_1").nullable()();
  IntColumn get exSkillEvolution2 =>
      integer().named("ex_skill_evolution_2").nullable()();
  IntColumn get exSkillEvolution3 =>
      integer().named("ex_skill_evolution_3").nullable()();
  IntColumn get exSkillEvolution4 =>
      integer().named("ex_skill_evolution_4").nullable()();
  IntColumn get exSkillEvolution5 =>
      integer().named("ex_skill_evolution_5").nullable()();
  // SP 技能 (Special Skills)
  IntColumn get spSkill1 => integer().named("sp_skill_1")();
  IntColumn get spSkill2 => integer().named("sp_skill_2")();
  IntColumn get spSkill3 => integer().named("sp_skill_3")();
  IntColumn get spSkill4 => integer().named("sp_skill_4")();
  IntColumn get spSkill5 => integer().named("sp_skill_5")();
  // SP 技能进化 (Special Skill Evolutions)
  IntColumn get spSkillEvolution1 =>
      integer().named("sp_skill_evolution_1").nullable()();
  IntColumn get spSkillEvolution2 =>
      integer().named("sp_skill_evolution_2").nullable()();
}

class SkillAction extends Table {
  @override
  String get tableName => "skill_action";
  @override
  Set<Column> get primaryKey => {actionId};

  IntColumn get actionId => integer().named("action_id")();
  IntColumn get classId => integer().named("class_id")();
  IntColumn get actionType => integer().named("action_type")();
  IntColumn get actionDetail1 => integer().named("action_detail_1")();
  IntColumn get actionDetail2 => integer().named("action_detail_2")();
  IntColumn get actionDetail3 => integer().named("action_detail_3")();

  RealColumn get actionValue1 => real().named("action_value_1")();
  RealColumn get actionValue2 => real().named("action_value_2")();
  RealColumn get actionValue3 => real().named("action_value_3")();
  RealColumn get actionValue4 => real().named("action_value_4")();
  RealColumn get actionValue5 => real().named("action_value_5")();
  RealColumn get actionValue6 => real().named("action_value_6")();
  RealColumn get actionValue7 => real().named("action_value_7")();

  IntColumn get targetAssignment => integer().named("target_assignment")();
  IntColumn get targetArea => integer().named("target_area")();
  IntColumn get targetRange => integer().named("target_range")();
  IntColumn get targetType => integer().named("target_type")();
  IntColumn get targetNumber => integer().named("target_number")();
  IntColumn get targetCount => integer().named("target_count")();

  TextColumn get description => text().named("description").nullable()();
  TextColumn get levelUpDisp => text().named("level_up_disp").nullable()();
}

class AilmentData extends Table {
  @override
  String get tableName => "ailment_data";
  @override
  Set<Column> get primaryKey => {ailmentId};

  IntColumn get ailmentId => integer().named("ailment_id")();
  IntColumn get ailmentAction => integer().named("ailment_action")();
  IntColumn get ailmentDetail1 => integer().named("ailment_detail_1")();
  TextColumn get ailmentName => text().named("ailment_name").nullable()();
}

class UnitAttackPattern extends Table {
  @override
  String get tableName => "unit_attack_pattern";
  @override
  Set<Column> get primaryKey => {patternId};

  IntColumn get patternId => integer().named("pattern_id")();
  IntColumn get unitId => integer().named("unit_id")();
  IntColumn get loopStart => integer().named("loop_start").nullable()();
  IntColumn get loopEnd => integer().named("loop_end").nullable()();

  IntColumn get atkPattern1 => integer().named("atk_pattern_1").nullable()();
  IntColumn get atkPattern2 => integer().named("atk_pattern_2").nullable()();
  IntColumn get atkPattern3 => integer().named("atk_pattern_3").nullable()();
  IntColumn get atkPattern4 => integer().named("atk_pattern_4").nullable()();
  IntColumn get atkPattern5 => integer().named("atk_pattern_5").nullable()();
  IntColumn get atkPattern6 => integer().named("atk_pattern_6").nullable()();
  IntColumn get atkPattern7 => integer().named("atk_pattern_7").nullable()();
  IntColumn get atkPattern8 => integer().named("atk_pattern_8").nullable()();
  IntColumn get atkPattern9 => integer().named("atk_pattern_9").nullable()();
  IntColumn get atkPattern10 => integer().named("atk_pattern_10").nullable()();
  IntColumn get atkPattern11 => integer().named("atk_pattern_11").nullable()();
  IntColumn get atkPattern12 => integer().named("atk_pattern_12").nullable()();
  IntColumn get atkPattern13 => integer().named("atk_pattern_13").nullable()();
  IntColumn get atkPattern14 => integer().named("atk_pattern_14").nullable()();
  IntColumn get atkPattern15 => integer().named("atk_pattern_15").nullable()();
  IntColumn get atkPattern16 => integer().named("atk_pattern_16").nullable()();
  IntColumn get atkPattern17 => integer().named("atk_pattern_17").nullable()();
  IntColumn get atkPattern18 => integer().named("atk_pattern_18").nullable()();
  IntColumn get atkPattern19 => integer().named("atk_pattern_19").nullable()();
  IntColumn get atkPattern20 => integer().named("atk_pattern_20").nullable()();
}

class SpSkillLabelData extends Table {
  @override
  String get tableName => "sp_skill_label";
  @override
  Set<Column> get primaryKey => {unitId};

  IntColumn get unitId => integer().named("unit_id")();
  TextColumn get normalLabelText =>
      text().named("normal_label_text").nullable()();
  TextColumn get spLabelText => text().named("sp_label_text").nullable()();
}

class UnitSkillDataRF extends Table {
  @override
  String get tableName => "unit_skill_data_rf";
  @override
  Set<Column> get primaryKey => {id};

  IntColumn get id => integer().named("id")();
  IntColumn get skillId => integer().named("skill_id")();
  IntColumn get rfSkillId => integer().named("rf_skill_id")();
  IntColumn get minLv => integer().named("min_lv")();
  IntColumn get maxLv => integer().named("max_lv")();
}

class UnitUniqueEquipment extends Table {
  @override
  String get tableName => "unit_unique_equipment";
  @override
  Set<Column> get primaryKey => {unitId, equipSlot};

  IntColumn get unitId => integer().named("unit_id")();
  IntColumn get equipSlot => integer().named("equip_slot")();
  IntColumn get equipId => integer().named("equip_id")();
}

class UnitUniqueEquip extends Table {
  @override
  String get tableName => "unit_unique_equip";
  @override
  Set<Column> get primaryKey => {unitId, equipSlot};

  IntColumn get unitId => integer().named("unit_id")();
  IntColumn get equipSlot => integer().named("equip_slot")();
  IntColumn get equipId => integer().named("equip_id")();
}

class UniqueEquipEnhanceRate extends Table {
  @override
  String get tableName => "unique_equip_enhance_rate";
  @override
  Set<Column> get primaryKey => {id};

  IntColumn get id => integer().named("id")();
  IntColumn get equipmentId => integer().named("equipment_id")();
  IntColumn get minLv => integer().named("min_lv")();
  IntColumn get maxLv => integer().named("max_lv")();
  RealColumn get hp => real().named("hp")();
  RealColumn get atk => real().named("atk")();
  RealColumn get magicStr => real().named("magic_str")();
  RealColumn get def_ => real().named("def")();
  RealColumn get magicDef => real().named("magic_def")();
  RealColumn get physicalCritical => real().named("physical_critical")();
  RealColumn get magicCritical => real().named("magic_critical")();
  RealColumn get waveHpRecovery => real().named("wave_hp_recovery")();
  RealColumn get waveEnergyRecovery => real().named("wave_energy_recovery")();
  RealColumn get dodge => real().named("dodge")();
  RealColumn get physicalPenetrate => real().named("physical_penetrate")();
  RealColumn get magicPenetrate => real().named("magic_penetrate")();
  RealColumn get lifeSteal => real().named("life_steal")();
  RealColumn get hpRecoveryRate => real().named("hp_recovery_rate")();
  RealColumn get energyRecoveryRate => real().named("energy_recovery_rate")();
  RealColumn get energyReduceRate => real().named("energy_reduce_rate")();
  RealColumn get accuracy => real().named("accuracy")();
}

class UniqueEquipmentEnhanceRate extends Table {
  @override
  String get tableName => "unique_equipment_enhance_rate";
  @override
  Set<Column> get primaryKey => {equipmentId};

  IntColumn get equipmentId => integer().named("equipment_id")();
  TextColumn get equipmentName => text().named("equipment_name").nullable()();
  TextColumn get description => text().named("description").nullable()();
  IntColumn get promotionLevel =>
      integer().named("promotion_level").nullable()();
  RealColumn get hp => real().named("hp").nullable()();
  RealColumn get atk => real().named("atk").nullable()();
  RealColumn get magicStr => real().named("magic_str").nullable()();
  RealColumn get def_ => real().named("def").nullable()();
  RealColumn get magicDef => real().named("magic_def").nullable()();
  RealColumn get physicalCritical =>
      real().named("physical_critical").nullable()();
  RealColumn get magicCritical => real().named("magic_critical").nullable()();
  RealColumn get waveHpRecovery =>
      real().named("wave_hp_recovery").nullable()();
  RealColumn get waveEnergyRecovery =>
      real().named("wave_energy_recovery").nullable()();
  RealColumn get dodge => real().named("dodge").nullable()();
  RealColumn get physicalPenetrate =>
      real().named("physical_penetrate").nullable()();
  RealColumn get magicPenetrate => real().named("magic_penetrate").nullable()();
  RealColumn get lifeSteal => real().named("life_steal").nullable()();
  RealColumn get hpRecoveryRate =>
      real().named("hp_recovery_rate").nullable()();
  RealColumn get energyRecoveryRate =>
      real().named("energy_recovery_rate").nullable()();
  RealColumn get energyReduceRate =>
      real().named("energy_reduce_rate").nullable()();
  RealColumn get accuracy => real().named("accuracy").nullable()();
}

class UniqueEquipmentData extends Table {
  @override
  String get tableName => "unique_equipment_data";
  @override
  Set<Column> get primaryKey => {equipmentId};

  IntColumn get equipmentId => integer().named("equipment_id")();
  TextColumn get equipmentName => text().named("equipment_name").nullable()();
  TextColumn get description => text().named("description").nullable()();
  IntColumn get promotionLevel =>
      integer().named("promotion_level").nullable()();
  IntColumn get craftFlg => integer().named("craft_flg").nullable()();
  IntColumn get equipmentEnhancePoint =>
      integer().named("equipment_enhance_point").nullable()();
  IntColumn get salePrice => integer().named("sale_price").nullable()();
  IntColumn get requireLevel => integer().named("require_level").nullable()();
  RealColumn get hp => real().named("hp").nullable()();
  RealColumn get atk => real().named("atk").nullable()();
  RealColumn get magicStr => real().named("magic_str").nullable()();
  RealColumn get def_ => real().named("def").nullable()();
  RealColumn get magicDef => real().named("magic_def").nullable()();
  RealColumn get physicalCritical =>
      real().named("physical_critical").nullable()();
  RealColumn get magicCritical => real().named("magic_critical").nullable()();
  RealColumn get waveHpRecovery =>
      real().named("wave_hp_recovery").nullable()();
  RealColumn get waveEnergyRecovery =>
      real().named("wave_energy_recovery").nullable()();
  RealColumn get dodge => real().named("dodge").nullable()();
  RealColumn get physicalPenetrate =>
      real().named("physical_penetrate").nullable()();
  RealColumn get magicPenetrate => real().named("magic_penetrate").nullable()();
  RealColumn get lifeSteal => real().named("life_steal").nullable()();
  RealColumn get hpRecoveryRate =>
      real().named("hp_recovery_rate").nullable()();
  RealColumn get energyRecoveryRate =>
      real().named("energy_recovery_rate").nullable()();
  RealColumn get energyReduceRate =>
      real().named("energy_reduce_rate").nullable()();
  IntColumn get enableDonation =>
      integer().named("enable_donation").nullable()();
  RealColumn get accuracy => real().named("accuracy").nullable()();
}

class UnlockUnitCondition extends Table {
  @override
  String get tableName => "unlock_unit_condition";
  @override
  Set<Column> get primaryKey => {unitId};

  IntColumn get unitId => integer()(); // 主键
  TextColumn get unitName => text()();
  IntColumn get classId => integer()();
  IntColumn get preUnitId => integer()();

  IntColumn get conditionType_1 => integer()();
  IntColumn get conditionTypeDetail_1 => integer()();
  IntColumn get conditionId_1 => integer()();
  IntColumn get count_1 => integer()();

  IntColumn get conditionType_2 => integer()();
  IntColumn get conditionTypeDetail_2 => integer()();
  IntColumn get conditionId_2 => integer()();
  IntColumn get count_2 => integer()();

  IntColumn get conditionType_3 => integer()();
  IntColumn get conditionTypeDetail_3 => integer()();
  IntColumn get conditionId_3 => integer()();
  IntColumn get count_3 => integer()();

  IntColumn get conditionType_4 => integer()();
  IntColumn get conditionTypeDetail_4 => integer()();
  IntColumn get conditionId_4 => integer()();
  IntColumn get count_4 => integer()();

  IntColumn get conditionType_5 => integer()();
  IntColumn get conditionTypeDetail_5 => integer()();
  IntColumn get conditionId_5 => integer()();
  IntColumn get count_5 => integer()();

  IntColumn get releaseEffectType => integer().nullable()();
}
