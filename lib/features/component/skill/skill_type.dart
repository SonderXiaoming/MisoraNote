import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/l10n/app_localizations.dart';

enum SkillActionType {
  unknown(0),

  /// 1：造成伤害
  damage(1),

  /// 2：位移
  move(2),

  /// 3：改变对方位置
  changeEnemyPosition(3),

  /// 4：回复 HP
  heal(4),

  /// 5：回复 HP
  cure(5),

  /// 6：护盾
  barrier(6),

  /// 7：指定攻击对象
  chooseEnemy(7),

  /// 8：行动速度变更
  changeActionSpeed(8),

  /// 9：持续伤害
  dot(9),

  /// 10：buff/debuff
  aura(10),

  /// 11：魅惑/混乱
  charm(11),

  /// 12：黑暗
  blind(12),

  /// 13：沉默
  silence(13),

  /// 14：行动模式变更
  changeMode(14),

  /// 15：召唤
  summon(15),

  /// 16：TP 相关
  changeTp(16),

  /// 17：触发条件
  trigger(17),

  /// 18：蓄力
  charge(18),

  /// 19：伤害充能
  damageCharge(19),

  /// 20：挑衅
  taunt(20),

  /// 21：回避
  invincible(21),

  /// 22：循环变更
  changePattern(22),

  /// 23：判定对象状态
  ifStatus(23),

  /// 24：复活
  revival(24),

  /// 25：连续攻击
  continuousAttack(25),

  /// 26：系数提升
  additive(26),

  /// 27：倍率
  multiple(27),

  /// 28：特殊条件
  ifSpStatus(28),

  /// 29：无法使用 UB
  noUb(29),

  /// 30：立即死亡
  killMe(30),

  /// 31：连续攻击附近
  continuousAttackNearby(31),

  /// 32：HP吸收
  lifeSteal(32),

  /// 33：反伤
  strikeBack(33),

  /// 34：伤害递增
  accumulativeDamage(34),

  /// 102：伤害递增v2
  accumulativeDamageV2(102),

  /// 35：特殊标记
  seal(35),

  /// 101：特殊标记v2
  sealV2(101),

  /// 36：攻击领域展开
  attackField(36),

  /// 37：治疗领域展开
  healField(37),

  /// 38：buff/debuff领域展开
  auraField(38),

  /// 39：持续伤害领域展开
  dotField(39),

  /// 40：范围行动速度变更
  changeActionSpeedField(40),

  /// 41：改变 UB 时间
  changeUbTime(41),

  /// 42：触发
  loopTrigger(42),

  /// 43：拥有标记时触发
  ifTargeted(43),

  /// 44：每场战斗开始时
  waveStart(44),

  /// 45：已使用技能数相关
  skillCount(45),

  /// 46：比例伤害
  rateDamage(46),

  /// 47：上限伤害
  upperLimitAttack(47),

  /// 48：持续治疗
  hot(48),

  /// 49：移除增益
  dispel(49),

  /// 50：持续动作
  channel(50),

  /// 51：分裂
  division(51),

  /// 52：改变单位距离
  changeWidth(52),

  /// 53：特殊状态：领域存在时；如：情姐
  ifHasField(53),

  /// 54：潜伏
  stealth(54),

  /// 55：部位移动
  movePart(55),

  /// 56：千里眼
  countBlind(56),

  /// 57：延迟攻击 如：万圣炸弹人的 UB
  countDown(57),

  /// 58：解除领域 如：晶姐 UB
  stopField(58),

  /// 59：回复妨碍
  inhibitHealAction(59),

  /// 60：标记赋予
  attackSeal(60),

  /// 61：恐慌
  fear(61),

  /// 62：畏惧
  awe(62),

  /// 63: 循环动作
  loop(63),

  /// 69：变身
  reindeer(69),

  /// 70：HP 变化
  hpChange(70),

  /// 71：免死
  exemptionDeath(71),

  /// 72：伤害减免
  damageReduce(72),

  /// 73：伤害护盾
  logBarrier(73),

  /// 74：系数除以
  divide(74),

  /// 75：依据攻击次数增伤
  hitCount(75),

  /// 76：HP 回复量变化
  healDown(76),

  /// 77：被动叠加标记
  ifBuffSeal(77),

  /// 78：被击伤害上升
  dmgTakenUp(78),

  /// 79：行动时，造成伤害
  actionDot(79),

  /// 81：无效目标
  noTarget(81),

  /// 83：可叠加行动速度变更
  superimposeChangeActionSpeed(83),

  /// 90：EX被动
  ex(90),

  /// 901：ex装备被动
  exEquip(901),
  exEquipHalf(902),

  /// 92：改变 TP 获取倍率
  changeTpRatio(92),

  /// 93：无视挑衅
  ignoreTaunt(93),

  /// 94：技能特效
  specialEffect(94),

  /// 95：隐匿
  hide(95),

  /// 96：范围tp回复
  tpField(96),

  /// 97：受击tp回复
  tpHit(97),

  /// 98：改变 TP 减少时倍率
  tpHitReduce(98),

  /// 99：范围加速
  speedField(99),

  /// 100：免疫无法行动的异常状态
  ignoreSpeedDown(100),

  /// 103：复制攻击力
  copyAtk(103),

  /// 105：环境效果
  environment(105),

  /// 106：守护
  guard(106),

  /// 107：暴击率合计
  sumCritical(107),

  /// 110：持续伤害易伤
  dotUp(110),

  //fixme 111 技能描述
  /// 111：
  triggerV2(111),

  /// 114：特殊标记计数？
  sealCount(114),

  /// 115：debuff？
  auraV2(115),

  /// 116：执着状态
  persistent(116),

  /// 121：幻化状态
  magicChange(121),

  /// 123：减伤状态
  magicChangeReduceDamage(123),

  /// 124：护盾（转移伤害）
  transferDamage(124),

  /// 125：无法选中
  cannotSelected(125),

  /// 128：持续伤害增强
  buffDot(128),

  /// 129：伤害转化
  damageToDot(129),

  /// 130：调和
  changeDefMax(130);

  final int value;
  const SkillActionType(this.value);

  static final Map<int, SkillActionType> _typeMap = {
    for (var e in SkillActionType.values) e.value: e,
  };

  String getName(AppLocalizations t) {
    switch (this) {
      case SkillActionType.unknown:
        return t.unknown;
      case SkillActionType.damage:
        return t.skill_type_1;
      case SkillActionType.move:
        return t.skill_type_2;
      case SkillActionType.changeEnemyPosition:
        return t.none;
      case SkillActionType.heal:
        return t.skill_type_4_5;
      case SkillActionType.cure:
        return t.skill_type_4_5;
      case SkillActionType.barrier:
        return t.skill_type_6;
      case SkillActionType.chooseEnemy:
        return t.none;
      case SkillActionType.changeActionSpeed:
        return t.none;
      case SkillActionType.dot:
        return t.none;
      case SkillActionType.aura:
        return t.none;
      case SkillActionType.charm:
        return t.none;
      case SkillActionType.blind:
        return t.skill_type_12;
      case SkillActionType.silence:
        return t.skill_type_13;
      case SkillActionType.changeMode:
        return t.skill_type_14;
      case SkillActionType.summon:
        return t.skill_type_15;
      case SkillActionType.changeTp:
        return t.skill_type_16_92;
      case SkillActionType.trigger:
        return t.skill_type_17;
      case SkillActionType.charge:
        return t.skill_type_18_19;
      case SkillActionType.damageCharge:
        return t.skill_type_18_19;
      case SkillActionType.taunt:
        return t.skill_type_20;
      case SkillActionType.invincible:
        return t.skill_type_21;
      case SkillActionType.changePattern:
        return t.skill_type_22;
      case SkillActionType.ifStatus:
        return t.none;
      case SkillActionType.revival:
        return t.skill_type_24;
      case SkillActionType.continuousAttack:
        return t.none;
      case SkillActionType.additive:
        return t.none;
      case SkillActionType.multiple:
        return t.none;
      case SkillActionType.ifSpStatus:
        return t.none;
      case SkillActionType.noUb:
        return t.none;
      case SkillActionType.killMe:
        return t.skill_type_30;
      case SkillActionType.continuousAttackNearby:
        return t.none;
      case SkillActionType.lifeSteal:
        return t.skill_type_32;
      case SkillActionType.strikeBack:
        return t.skill_type_33;
      case SkillActionType.accumulativeDamage:
        return t.skill_type_34;
      case SkillActionType.accumulativeDamageV2:
        return t.skill_type_34;
      case SkillActionType.seal:
        return t.skill_type_35_43_60_77;
      case SkillActionType.sealV2:
        return t.skill_type_35_43_60_77;
      case SkillActionType.attackField:
        return t.skill_type_36_37_38_39_40;
      case SkillActionType.healField:
        return t.skill_type_36_37_38_39_40;
      case SkillActionType.auraField:
        return t.skill_type_36_37_38_39_40;
      case SkillActionType.dotField:
        return t.skill_type_36_37_38_39_40;
      case SkillActionType.changeActionSpeedField:
        return t.skill_type_36_37_38_39_40;
      case SkillActionType.changeUbTime:
        return t.none;
      case SkillActionType.loopTrigger:
        return t.skill_type_42;
      case SkillActionType.ifTargeted:
        return t.skill_type_35_43_60_77;
      case SkillActionType.waveStart:
        return t.skill_type_44;
      case SkillActionType.skillCount:
        return t.none;
      case SkillActionType.rateDamage:
        return t.skill_type_46;
      case SkillActionType.upperLimitAttack:
        return t.none;
      case SkillActionType.hot:
        return t.skill_type_48;
      case SkillActionType.dispel:
        return t.skill_type_49;
      case SkillActionType.channel:
        return t.skill_type_50;
      case SkillActionType.division:
        return t.none;
      case SkillActionType.changeWidth:
        return t.none;
      case SkillActionType.ifHasField:
        return t.none;
      case SkillActionType.stealth:
        return t.skill_type_54;
      case SkillActionType.movePart:
        return t.none;
      case SkillActionType.countBlind:
        return t.skill_type_56;
      case SkillActionType.countDown:
        return t.skill_type_57;
      case SkillActionType.stopField:
        return t.skill_type_58;
      case SkillActionType.inhibitHealAction:
        return t.skill_type_59;
      case SkillActionType.attackSeal:
        return t.skill_type_35_43_60_77;
      case SkillActionType.fear:
        return t.skill_type_61;
      case SkillActionType.awe:
        return t.skill_type_62;
      case SkillActionType.loop:
        return t.skill_type_63;
      case SkillActionType.reindeer:
        return t.skill_type_69;
      case SkillActionType.hpChange:
        return t.skill_type_70;
      case SkillActionType.exemptionDeath:
        return t.skill_type_71;
      case SkillActionType.damageReduce:
        return t.skill_type_72;
      case SkillActionType.logBarrier:
        return t.skill_type_73;
      case SkillActionType.divide:
        return t.none;
      case SkillActionType.hitCount:
        return t.skill_type_75;
      case SkillActionType.healDown:
        return t.skill_type_76;
      case SkillActionType.ifBuffSeal:
        return t.skill_type_35_43_60_77;
      case SkillActionType.dmgTakenUp:
        return t.skill_type_78;
      case SkillActionType.actionDot:
        return t.skill_type_79;
      case SkillActionType.noTarget:
        return t.skill_type_81;
      case SkillActionType.superimposeChangeActionSpeed:
        return t.none;
      case SkillActionType.ex:
        return t.skill_type_90;
      case SkillActionType.exEquip:
        return t.skill_type_901_902;
      case SkillActionType.exEquipHalf:
        return t.skill_type_901_902;
      case SkillActionType.changeTpRatio:
        return t.skill_type_16_92;
      case SkillActionType.ignoreTaunt:
        return t.none;
      case SkillActionType.specialEffect:
        return t.none;
      case SkillActionType.hide:
        return t.skill_type_95;
      case SkillActionType.tpField:
        return t.none;
      case SkillActionType.tpHit:
        return t.none;
      case SkillActionType.tpHitReduce:
        return t.none;
      case SkillActionType.speedField:
        return t.none;
      case SkillActionType.ignoreSpeedDown:
        return t.skill_type_100;
      case SkillActionType.copyAtk:
        return t.none;
      case SkillActionType.environment:
        return t.skill_type_105;
      case SkillActionType.guard:
        return t.skill_type_106;
      case SkillActionType.sumCritical:
        return t.none;
      case SkillActionType.dotUp:
        return t.skill_type_110;
      case SkillActionType.triggerV2:
        return t.skill_type_17;
      case SkillActionType.sealCount:
        return t.none;
      case SkillActionType.auraV2:
        return t.none;
      case SkillActionType.persistent:
        return t.skill_action_type_116;
      case SkillActionType.magicChange:
        return t.skill_action_type_121;
      case SkillActionType.magicChangeReduceDamage:
        return t.skill_action_type_123;
      case SkillActionType.transferDamage:
        return t.skill_action_type_124;
      case SkillActionType.cannotSelected:
        return t.skill_action_type_125;
      case SkillActionType.buffDot:
        return t.skill_action_type_128;
      case SkillActionType.damageToDot:
        return t.skill_action_type_129;
      case SkillActionType.changeDefMax:
        return t.skill_action_type_130;
    }
  }

  /// 根据数值获取枚举
  static SkillActionType getByType(int value) {
    return _typeMap[value] ?? SkillActionType.unknown;
  }
}

enum DotType {
  dot0,
  dot1,
  dot2,
  dot3,
  dot4,
  dot5,
  dot7,
  dot8,
  dot9,
  dot11,
  unknown;

  static DotType get(int key) {
    return DotType.values.firstWhere(
      (e) => e.name == 'dot$key',
      orElse: () => DotType.unknown,
    );
  }

  String getName(AppLocalizations t) {
    switch (this) {
      case DotType.dot0:
        return t.skill_dot_0;
      case DotType.dot1:
        return t.skill_dot_1_7;
      case DotType.dot2:
        return t.skill_dot_2;
      case DotType.dot3:
        return t.skill_dot_3_8;
      case DotType.dot4:
        return t.skill_dot_4;
      case DotType.dot5:
        return t.skill_dot_5;
      case DotType.dot7:
        return t.skill_dot_1_7;
      case DotType.dot8:
        return t.skill_dot_3_8;
      case DotType.dot9:
        return t.skill_dot_9;
      case DotType.dot11:
        return t.skill_dot_11;
      case DotType.unknown:
        return t.unknown;
    }
  }
}

enum BuffType {
  unknown(-1),
  atk(1),
  def(2),
  magicStr(3),
  magicDef(4),
  dodge(5),
  physicalCritical(6),
  magicCritical(7),
  energyRecoveryRate(8),
  lifeSteal(9),
  speed(10),
  physicalCriticalDamage(11),
  magicCriticalDamage(12),
  accuracy(13),
  criticalDamageTake(14),
  damageTake(15),
  physicalDamageTake(16),
  magicDamageTake(17),
  physicalDamage(18),
  magicDamage(19),
  maxHp(100);

  final int value;
  const BuffType(this.value);

  static final Map<int, BuffType> _typeMap = {
    for (var e in BuffType.values) e.value: e,
  };

  static BuffType getByType(int value) {
    return _typeMap[value] ?? BuffType.unknown;
  }

  String getName(AppLocalizations t) {
    switch (this) {
      case BuffType.unknown:
        return t.unknown;
      case BuffType.atk:
        return t.attr_atk;
      case BuffType.def:
        return t.attr_def;
      case BuffType.magicStr:
        return t.attr_magic_str;
      case BuffType.magicDef:
        return t.attr_magic_def;
      case BuffType.dodge:
        return t.attr_dodge;
      case BuffType.physicalCritical:
        return t.attr_physical_critical;
      case BuffType.magicCritical:
        return t.attr_magic_critical;
      case BuffType.energyRecoveryRate:
        return t.attr_energy_recovery_rate;
      case BuffType.lifeSteal:
        return t.attr_life_steal;
      case BuffType.speed:
        return t.skill_speed;
      case BuffType.physicalCriticalDamage:
        return t.skill_physical_critical_damage;
      case BuffType.magicCriticalDamage:
        return t.skill_magic_critical_damage;
      case BuffType.accuracy:
        return t.attr_accuracy;
      case BuffType.criticalDamageTake:
        return t.skill_critical_damage_take;
      case BuffType.damageTake:
        return t.skill_damage_take;
      case BuffType.physicalDamageTake:
        return t.skill_physical_damage_take;
      case BuffType.magicDamageTake:
        return t.skill_magic_damage_take;
      case BuffType.physicalDamage:
        return t.skill_physical_damage;
      case BuffType.magicDamage:
        return t.skill_magic_damage;
      case BuffType.maxHp:
        return t.skill_hp_max;
    }
  }
}

enum SkillTextType {
  normal,
  ub,
  ubPlus,
  skill1,
  skill1Plus,
  skill2,
  skill2Plus,
  skill3,
  skill4,
  skill5,
  skill6,
  skill7,
  skill8,
  skill9,
  skill10,
  exSkill,
  exSkillPlus,
  exSkill2,
  exSkill2Plus,
  exSkill3,
  exSkill3Plus,
  exSkill4,
  exSkill4Plus,
  exSkill5,
  exSkill5Plus,
  spUb,
  spSkill1,
  spSkill1Plus,
  spSkill2,
  spSkill2Plus,
  spSkill3,
  spSkill4,
  spSkill5;

  int get color {
    switch (this) {
      case SkillTextType.ub:
      case SkillTextType.ubPlus:
      case SkillTextType.spUb:
        return CustomColors.colorGold;
      case SkillTextType.skill1:
      case SkillTextType.skill1Plus:
      case SkillTextType.spSkill1:
      case SkillTextType.spSkill1Plus:
        return CustomColors.colorPurple;
      case SkillTextType.skill2:
      case SkillTextType.skill2Plus:
      case SkillTextType.spSkill2:
      case SkillTextType.spSkill2Plus:
        return CustomColors.colorRed;
      case SkillTextType.exSkill:
      case SkillTextType.exSkillPlus:
      case SkillTextType.spSkill3:
        return CustomColors.colorOrange;
      default:
        return CustomColors.colorBlack;
    }
  }

  String getName(AppLocalizations t) {
    switch (this) {
      case SkillTextType.normal:
        return t.normal_attack;
      case SkillTextType.ub:
        return t.union_burst;
      case SkillTextType.ubPlus:
        return "${t.union_burst}+";
      case SkillTextType.skill1:
        return t.skill_index(1);
      case SkillTextType.skill1Plus:
        return "${t.skill_index(1)}+";
      case SkillTextType.skill2:
        return t.skill_index(2);
      case SkillTextType.skill2Plus:
        return "${t.skill_index(2)}+";
      case SkillTextType.skill3:
        return t.skill_index(3);
      case SkillTextType.skill4:
        return t.skill_index(4);
      case SkillTextType.skill5:
        return t.skill_index(5);
      case SkillTextType.skill6:
        return t.skill_index(6);
      case SkillTextType.skill7:
        return t.skill_index(7);
      case SkillTextType.skill8:
        return t.skill_index(8);
      case SkillTextType.skill9:
        return t.skill_index(9);
      case SkillTextType.skill10:
        return t.skill_index(10);
      case SkillTextType.exSkill:
        return t.ex_skill_index("");
      case SkillTextType.exSkillPlus:
        return t.ex_skill_index("+");
      case SkillTextType.exSkill2:
        return t.ex_skill_index("2");
      case SkillTextType.exSkill2Plus:
        return t.ex_skill_index("2+");
      case SkillTextType.exSkill3:
        return t.ex_skill_index("3");
      case SkillTextType.exSkill3Plus:
        return t.ex_skill_index("3+");
      case SkillTextType.exSkill4:
        return t.ex_skill_index("4");
      case SkillTextType.exSkill4Plus:
        return t.ex_skill_index("4+");
      case SkillTextType.exSkill5:
        return t.ex_skill_index("5");
      case SkillTextType.exSkill5Plus:
        return t.ex_skill_index("5+");
      case SkillTextType.spUb:
        return "SP${t.union_burst}";
      case SkillTextType.spSkill1:
        return "SP${t.skill_index(1)}";
      case SkillTextType.spSkill1Plus:
        return "SP${t.skill_index(1)}+";
      case SkillTextType.spSkill2:
        return "SP${t.skill_index(2)}";
      case SkillTextType.spSkill2Plus:
        return "SP${t.skill_index(2)}+";
      case SkillTextType.spSkill3:
        return "SP${t.skill_index(3)}";
      case SkillTextType.spSkill4:
        return "SP${t.skill_index(4)}";
      case SkillTextType.spSkill5:
        return "SP${t.skill_index(5)}";
    }
  }
}

class SkillFinalData {
  final int id;
  final SkillTextType type;
  final SkillDataData data;
  final List<SkillActionInfo> actions;
  int level;

  SkillFinalData({
    required this.id,
    required this.type,
    required this.data,
    required this.actions,
    required this.level,
  });
}

class UnitSkillList {
  final normal = <SkillFinalData>[];
  final sp = <SkillFinalData>[];

  UnitSkillList get pureSkill {
    final result = UnitSkillList();
    result.normal.addAll(
      normal.where(
        (e) => [
          SkillTextType.skill1,
          SkillTextType.skill2,
          SkillTextType.skill3,
          SkillTextType.skill4,
          SkillTextType.skill5,
          SkillTextType.skill6,
          SkillTextType.skill7,
          SkillTextType.skill8,
          SkillTextType.skill9,
          SkillTextType.skill10,
        ].contains(e.type),
      ),
    );
    result.sp.addAll(
      sp.where(
        (e) => [
          SkillTextType.spSkill1,
          SkillTextType.spSkill2,
          SkillTextType.spSkill3,
          SkillTextType.spSkill4,
          SkillTextType.spSkill5,
        ].contains(e.type),
      ),
    );
    return result;
  }
}

class PCRLevelLimit {
  //属性变化等级，300级后，回避等属性转换为其他属性
  static const int otherLimitLevel = 300;
  //tp属性变化等级，260级后，tp回复将转化为攻击力
  static const int tpLimitLevel = 260;
}

class SkillTag {
  static const tagColorMap = {
    "<": 0xFFa24072,
    "[": 0xFF7aa57b,
    "『": 0xFFa24072,
    "{": 0xFFb476cd,
  };

  static const Map<String, String> tagPairs = {
    "<": ">",
    "[": "]",
    "『": "』",
    "{": "}",
  };

  static int tagColor(String tag) =>
      SkillTag.tagColorMap[tag] ?? CustomColors.colorBlack;

  static String getPair(String tag) => SkillTag.tagPairs[tag] ?? "";
}
