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
