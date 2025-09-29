import 'dart:math';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/features/component/skill/skill_type.dart';

class ActionHandler {
  late AppLocalizations t;
  late int level;
  late int atk;
  late SkillActionInfo action;
  late SkillDataData skillData;
  late String tag;
  bool isOtherRfSkill = false; // 是否为回避等技能
  bool isOtherLimitAction = false; // 是否为等级限制技能
  ActionHandler(AppLocalizations? l10n) {
    t = l10n!;
  }

  String getAtkType() {
    switch (action.actionDetail1) {
      case 1:
        return t.physical;
      case 2:
        return t.magic;
      case 3:
        return t.skill_must_hit_physical;
      case 4:
        return t.skill_must_hit_magic;
      case 5:
        return t.skill_sum_atk_physical;
      case 6:
        return t.skill_sum_atk_magic;
      default:
        return t.unknown;
    }
  }

  String getTargetAssignment() {
    if (action.targetType == 7) {
      return t.none;
    }
    switch (action.targetAssignment) {
      case 0:
        return t.skill_target_assignment_0;
      case 1:
        return t.skill_target_assignment_1;
      case 2:
        return t.skill_target_assignment_2;
      case 3:
        return t.skill_target_assignment_3;
      default:
        return t.none;
    }
  }

  String getTargetNumber() {
    String order = t.none;
    if (action.targetAssignment == 1) {
      if (1 <= action.targetNumber && action.targetNumber <= 10) {
        order = t.skill_target_order_num("${action.targetNumber + 1}");
      }
    } else if (action.targetNumber == 1) {
      order = t.skill_target_order_1;
    } else if (1 < action.targetNumber && action.targetNumber <= 10) {
      order = t.skill_target_order_num(action.targetNumber.toString());
    }

    return order.isNotEmpty ? "『$order』" : t.none;
  }

  String getTargetCount() {
    switch (action.targetCount) {
      case 0:
        return t.none;
      case 1:
        return action.targetAssignment == 1 ? t.skill_target_single : t.none;
      case 99:
        return t.skill_target_all;
      default:
        return t.skill_target_count(action.targetCount);
    }
  }

  String getTargetRange() {
    if (1 <= action.targetRange && action.targetRange < 2160) {
      return "『${t.skill_range(action.targetRange)}』";
    }
    return t.none;
  }

  Map<int, int> getSkillDependMap() {
    return {
      skillData.action1: skillData.actionDepend1,
      skillData.action2: skillData.actionDepend2,
      skillData.action3: skillData.actionDepend3,
      skillData.action4: skillData.actionDepend4,
      skillData.action5: skillData.actionDepend5,
      skillData.action6: skillData.actionDepend6,
      skillData.action7: skillData.actionDepend7,
      skillData.action8: skillData.actionDepend8,
      skillData.action9: skillData.actionDepend9,
      skillData.action10: skillData.actionDepend10,
    };
  }

  String getTarget() {
    final dependMap = getSkillDependMap();
    final dependId = dependMap[action.actionId] ?? 0;
    final depend =
        (dependId != 0 ? t.skill_depend_action(dependId % 100) : t.none);
    if (action.targetCount == 99 &&
        action.targetRange == 2160 &&
        action.actionValue6 == 1 &&
        action.actionValue7 == 0 &&
        action.actionDetail2 == 1) {
      // fixme 敌方友方均生效，判断逻辑
      final rangeText = t.skill_target_assignment_3;
      return depend + rangeText;
    } else {
      final rangeText =
          (getTargetNumber() + getTargetRange() + getTargetAssignment());
      final targetType = getTargetType();
      return depend +
          (targetType.isNotEmpty ? "『$targetType』" : t.none) +
          rangeText +
          getTargetCount();
    }
  }

  String getTargetType() {
    if ([0, 1, 3, 40, 41].contains(action.targetType)) {
      return t.none;
    } else if ([2, 8].contains(action.targetType)) {
      return t.skill_target_2_8;
    } else if (action.targetType == 4) {
      return t.skill_target_4;
    } else if ([5, 25].contains(action.targetType)) {
      return t.skill_target_5_25;
    } else if ([6, 26].contains(action.targetType)) {
      return t.skill_target_6_26;
    } else if (action.targetType == 7) {
      return t.skill_target_7;
    } else if (action.targetType == 9) {
      return t.skill_target_9;
    } else if (action.targetType == 10) {
      return t.skill_target_10;
    } else if (action.targetType == 11) {
      return t.skill_target_11;
    } else if ([12, 27, 37].contains(action.targetType)) {
      return t.skill_target_12_27_37;
    } else if ([13, 19, 28].contains(action.targetType)) {
      return t.skill_target_13_19_28;
    } else if ([14, 29].contains(action.targetType)) {
      return t.skill_target_14_29;
    } else if ([15, 30].contains(action.targetType)) {
      return t.skill_target_15_30;
    } else if ([16, 31].contains(action.targetType)) {
      return t.skill_target_16_31;
    } else if ([17, 32].contains(action.targetType)) {
      return t.skill_target_17_32;
    } else if (action.targetType == 18) {
      return t.skill_target_18;
    } else if (action.targetType == 20) {
      return t.skill_target_20;
    } else if (action.targetType == 21) {
      return t.skill_target_21;
    } else if (action.targetType == 22) {
      return t.skill_target_22;
    } else if (action.targetType == 23) {
      return t.skill_target_23;
    } else if (action.targetType == 24) {
      return t.skill_target_24;
    } else if (action.targetType == 33) {
      return t.skill_target_33;
    } else if (action.targetType == 34) {
      return t.skill_target_34;
    } else if (action.targetType == 35) {
      return t.skill_target_35;
    } else if (action.targetType == 36) {
      return t.skill_target_36;
    } else if (action.targetType == 38) {
      return t.skill_target_38;
    } else if (action.targetType == 39) {
      return t.skill_target_39;
    } else if (action.targetType == 42) {
      return t.skill_target_42;
    } else if (action.targetType == 43) {
      return t.skill_target_43;
    } else if (action.targetType == 44) {
      return t.skill_target_44;
    } else if (action.targetType == 45) {
      return t.skill_target_45;
    } else if (action.targetType == 46) {
      return t.skill_target_46;
    } else if (action.targetType == 50) {
      return t.skill_target_50;
    } else if (13195 <= action.targetType && action.targetType <= 14000) {
      return t.skill_target_13xxx;
    } else if ([14001, 15001].contains(action.targetType)) {
      return t.skill_target_fire;
    } else if ([14002, 15002].contains(action.targetType)) {
      return t.skill_target_water;
    } else if ([14003, 15003].contains(action.targetType)) {
      return t.skill_target_wind;
    } else if ([14004, 15004].contains(action.targetType)) {
      return t.skill_target_light;
    } else if ([15005, 14005].contains(action.targetType)) {
      return t.skill_target_dark;
    } else {
      return t.unknown;
    }
  }

  String getValueText(
    int index,
    double v1,
    double v2, {
    double v3 = 0.0,
    double v4 = 0.0,
    String percent = "",
    bool hideIndex = false,
    int? maxValue,
  }) {
    String lebelText = t.skill_level_text;
    String atkText = t.skill_atk_text;
    String value = "";
    if (v3 == 0.0) {
      if (v1 == 0.0 && v2 != 0.0) {
        value =
            "[${(v2 * level).toInt()}$percent] <{${index + 1}}$v2 * $lebelText>";
      } else if (v1 != 0.0 && v2 == 0.0) {
        value = "{$index}[$v1$percent]";
      } else if (v1 != 0.0) {
        value =
            "[${(v1 + v2 * level).toInt()}$percent] <{$index}$v1 + {${index + 1}}$v2 * $lebelText>";
      } else {
        value = "{$index}[0]$percent";
      }
    } else if (v4 != 0.0) {
      value =
          "[${(v1 + v2 * level + (v3 + v4 * level) * atk).toInt()}$percent] <{$index}$v1 + {${index + 1}}$v2 * $lebelText + ﹙{${index + 2}}$v3 + {${index + 3}}$v4 * $lebelText﹚ * $atkText>";
    } else if (v1 == 0.0 && v2 != 0.0) {
      value =
          "[${(v2 + v3 * atk).toInt()}$percent] <{${index + 1}}$v2 + {${index + 2}}$v3 * $atkText>";
    } else if (v1 == 0.0) {
      value = "[${(v3 * atk).toInt()}$percent] <{${index + 2}}$v3 * $atkText>";
    } else if (v2 != 0.0) {
      value =
          "[${(v1 + v2 * level + v3 * atk).toInt()}$percent] <{$index}$v1 + {${index + 1}}$v2 * $lebelText + {${index + 2}}$v3 * $atkText>";
    } else {
      value = "{$index}[0]$percent";
    }

    if (maxValue != null) {
      value = value.replaceAll(
        RegExp(r"\[.*?\]"),
        "[${maxValue.toInt()}$percent]",
      );
    }
    if (hideIndex) {
      value = value.replaceAll(RegExp(r"\{.*?\}"), "");
    }
    if (level == 0) {
      value = value.replaceAll(RegExp(r"\[.*?\] <"), " <");
    }
    return value;
  }

  String getTimeText(
    int index,
    double v1, {
    double v2 = 0.0,
    bool hideIndex = false,
  }) {
    return t.skill_effect_time(
      getValueText(index, v1, v2, hideIndex: hideIndex),
    );
  }

  String getBarrierType(int v1) {
    // 作用
    String f;
    if ([1, 2, 5].contains(v1)) {
      f = t.skill_shield_no_effect;
    } else {
      f = t.skill_shield_defense;
    }

    // 类型
    String type;
    if ([1, 3].contains(v1)) {
      type = t.physical;
    } else if ([2, 4].contains(v1)) {
      type = t.magic;
    } else {
      type = t.skill_all;
    }

    return v1 <= 6 ? t.skill_shield(f, type) : t.unknown;
  }

  String getPercent() {
    if (action.actionType == SkillActionType.aura.value ||
        action.actionType == SkillActionType.healDown.value) {
      if (action.actionValue1 == 2 ||
          [11, 12, 14, 16, 17, 18, 19].contains(action.actionDetail1 ~/ 10)) {
        return "%";
      } else {
        return "";
      }
    } else if (action.actionType == SkillActionType.healField.value ||
        action.actionType == SkillActionType.auraField.value) {
      return action.actionDetail2 == 2 ? "%" : "";
    } else if (action.actionType == SkillActionType.damageReduce.value) {
      return "%";
    } else if (action.actionType == SkillActionType.actionDot.value) {
      return action.actionDetail1 == 10 ? "%" : "";
    } else if (action.actionType == SkillActionType.dot.value) {
      return action.actionDetail1 == 11 ? "%" : "";
    } else {
      return "";
    }
  }

  void initOtherLimit() {
    if (level > PCRLevelLimit.otherLimitLevel && isOtherRfSkill) {
      isOtherLimitAction = true;
    }
  }

  String getAura(int v, String valueText) {
    // 作用
    final actionType = v == 1
        ? t.skill_hp_max
        : {
              1: t.attr_atk,
              2: t.attr_def,
              3: t.attr_magic_str,
              4: t.attr_magic_def,
              5: t.attr_dodge,
              6: t.attr_physical_critical,
              7: t.attr_magic_critical,
              8: t.attr_energy_recovery_rate,
              9: t.attr_life_steal,
              10: t.skill_speed,
              11: t.skill_physical_critical_damage,
              12: t.skill_magic_critical_damage,
              13: t.attr_accuracy,
              14: t.skill_critical_damage_take,
              16: t.skill_physical_damage_take,
              17: t.skill_magic_damage_take,
              18: t.skill_physical_damage,
              19: t.skill_magic_damage,
            }[v % 1000 ~/ 10] ??
            t.unknown;
    String type = "";
    if ([14, 16, 17].contains(v ~/ 10)) {
      type = "${v % 10 == 0 ? t.skill_reduce : t.skill_increase} $valueText";
    } else {
      type = "${v % 10 == 0 ? t.skill_increase : t.skill_reduce} $valueText";
    }
    if (v > 1000) {
      type += t.skill_fixed;
    }
    return actionType + type;
  }

  String getStatus() {
    return {
          100: t.skill_status_100,
          101: t.skill_status_101,
          200: t.skill_status_200,
          300: t.skill_status_300,
          400: t.skill_status_400,
          500: t.skill_status_500,
          501: t.skill_status_501,
          502: t.skill_status_502,
          503: t.skill_status_503,
          504: t.skill_status_504,
          511: t.skill_status_511,
          512: t.skill_status_512,
          710: t.skill_status_710,
          900: t.skill_status_900,
          1400: t.skill_status_1400,
          1600: t.skill_status_1600,
          1601: t.skill_status_1601,
          1700: {
                21: t.skill_status_1700_21,
                41: t.skill_status_1700_41
              }[action.actionValue3] ??
              t.unknown,
          721: t.skill_status_721,
          6107: t.skill_status_6107,
          1513: t.skill_ailment_13,
          1800: t.skill_status_1800,
          1900: t.skill_status_1900,
          3137: t.skill_status_3137,
          3162: t.skill_status_3162,
          3175: t.skill_status_3175,
          3207: t.skill_status_3207,
          6160: t.skill_status_6160,
          4001: t.skill_target_fire,
          4002: t.skill_target_water,
          4003: t.skill_target_wind,
          4004: t.skill_target_light,
          4005: t.skill_target_dark,
        }[action.actionDetail1] ??
        t.unknown;
  }

  String formatDesc(
    SkillActionInfo action,
    SkillDataData skillData,
    int level,
    int atk,
  ) {
    this.level = level;
    this.atk = atk;
    this.action = action;
    this.skillData = skillData;
    tag = "";
    final skillType = SkillActionType.getByType(action.actionType);
    switch (skillType) {
      case SkillActionType.damage:
        return damage();
      case SkillActionType.move:
        return move();
      case SkillActionType.changeEnemyPosition:
        return changePosition();
      case SkillActionType.heal:
        return heal();
      case SkillActionType.barrier:
        return barrier();
      case SkillActionType.chooseEnemy:
        return chooseEnemy();
      case SkillActionType.changeActionSpeed:
      case SkillActionType.superimposeChangeActionSpeed:
      case SkillActionType.speedField:
        return speed();
      case SkillActionType.dot:
        return dot();
      case SkillActionType.aura:
      case SkillActionType.auraV2:
        return aura();
      case SkillActionType.charm:
      case SkillActionType.blind:
      case SkillActionType.silence:
        return charm();
      case SkillActionType.changeMode:
        return changeMode();
      case SkillActionType.summon:
        return summon();
      case SkillActionType.changeTp:
        return tp();
      case SkillActionType.trigger:
        return trigger();
      case SkillActionType.triggerV2:
        return triggerV2();
      case SkillActionType.charge:
      case SkillActionType.damageCharge:
        return charge();
      case SkillActionType.taunt:
        return taunt();
      case SkillActionType.invincible:
        return invincible();
      case SkillActionType.changePattern:
        return changePattern();
      case SkillActionType.ifStatus:
        return ifStatus();
      case SkillActionType.revival:
        return revival();
      case SkillActionType.additive:
      case SkillActionType.multiple:
      case SkillActionType.divide:
        return coefficient();
      case SkillActionType.ifSpStatus:
        return ifSpStatus();
      case SkillActionType.noUb:
        return noUb();
      case SkillActionType.killMe:
        return killMe();
      case SkillActionType.lifeSteal:
        return lifeSteal();
      case SkillActionType.strikeBack:
        return strikeBack();
      case SkillActionType.accumulativeDamage:
      case SkillActionType.accumulativeDamageV2:
        return accumulativeDamage();
      case SkillActionType.seal:
        return seal();
      case SkillActionType.sealV2:
        return sealV2();
      case SkillActionType.attackField:
        return attackField();
      case SkillActionType.healField:
        return healField();
      case SkillActionType.auraField:
        return auraField();
      case SkillActionType.dotField:
        return dotField();
      case SkillActionType.loopTrigger:
        return loopTrigger();
      case SkillActionType.waveStart:
        return waveStart();
      case SkillActionType.skillCount:
        return skillCount();
      case SkillActionType.rateDamage:
        return rateDamage();
      case SkillActionType.upperLimitAttack:
        return limitAttack();
      case SkillActionType.hot:
        return hot();
      case SkillActionType.dispel:
        return dispel();
      case SkillActionType.channel:
        return channel();
      case SkillActionType.changeWidth:
        return changeWidth();
      case SkillActionType.ifHasField:
        return ifHasField();
      case SkillActionType.stealth:
        return stealth();
      case SkillActionType.movePart:
        return movePart();
      case SkillActionType.countBlind:
        return countBlind();
      case SkillActionType.countDown:
        return countDown();
      case SkillActionType.stopField:
        return stopField();
      case SkillActionType.inhibitHealAction:
        return inhibitHeal();
      case SkillActionType.attackSeal:
        return attackSeal();
      case SkillActionType.fear:
        return fear();
      case SkillActionType.awe:
        return awe();
      case SkillActionType.loop:
        return loop();
      case SkillActionType.reindeer:
        return reindeer();
      case SkillActionType.exemptionDeath:
        return exemptionDeath();
      case SkillActionType.damageReduce:
        return damageReduce();
      case SkillActionType.logBarrier:
        return logBarrier();
      case SkillActionType.hitCount:
        return hitCount();
      case SkillActionType.healDown:
        return healDown();
      case SkillActionType.ifBuffSeal:
        return ifBuffSeal();
      case SkillActionType.dmgTakenUp:
        return damageTacenUp();
      case SkillActionType.actionDot:
        return actionDot();
      case SkillActionType.noTarget:
        return noTarget();
      case SkillActionType.ex:
        return ex();
      case SkillActionType.exEquip:
        return exEquipFull();
      case SkillActionType.exEquipHalf:
        return exEquipHalf();
      case SkillActionType.changeTpRatio:
        return changeTpRatio();
      case SkillActionType.ignoreTaunt:
        return ignoreTaunt();
      case SkillActionType.specialEffect:
        return specialEffect();
      case SkillActionType.hide:
        return hide();
      case SkillActionType.tpField:
        return tpField();
      case SkillActionType.tpHit:
        return tpHit();
      case SkillActionType.tpHitReduce:
        return tpHitReduce();
      case SkillActionType.ignoreSpeedDown:
        return ignoreSpeedDown();
      case SkillActionType.copyAtk:
        return copyAtk();
      case SkillActionType.environment:
        return environment();
      case SkillActionType.guard:
        return guard();
      case SkillActionType.sumCritical:
        return sumCritical();
      case SkillActionType.dotUp:
        return dotUp();
      case SkillActionType.sealCount:
        return sealCount();
      case SkillActionType.persistent:
        return persistent();
      case SkillActionType.magicChange:
        return magicChange();
      case SkillActionType.magicChangeReduceDamage:
        return magicChangeReduceDamage();
      case SkillActionType.transferDamage:
        return transferDamage();
      case SkillActionType.cannotSelected:
        return cannotSelected();
      case SkillActionType.buffDot:
        return buffDot();
      case SkillActionType.damageToDot:
        return damage2dot();
      case SkillActionType.changeDefMax:
        return changeDefMax();
      case SkillActionType.unknown:
        return t.unknown;
      case SkillActionType.cure:
        // TODO: Handle this case.
        throw UnimplementedError();
      case SkillActionType.continuousAttack:
        // TODO: Handle this case.
        throw UnimplementedError();
      case SkillActionType.continuousAttackNearby:
        // TODO: Handle this case.
        throw UnimplementedError();
      case SkillActionType.changeActionSpeedField:
        // TODO: Handle this case.
        throw UnimplementedError();
      case SkillActionType.changeUbTime:
        // TODO: Handle this case.
        throw UnimplementedError();
      case SkillActionType.ifTargeted:
        // TODO: Handle this case.
        throw UnimplementedError();
      case SkillActionType.division:
        // TODO: Handle this case.
        throw UnimplementedError();
      case SkillActionType.hpChange:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  String damage() {
    final atkType = getAtkType();
    final adaptive =
        action.actionDetail2 == 1 ? t.skill_adaptive_lower_defense : "";
    final mustCritical = action.actionValue5 == 1 ? t.skill_must_critical : "";
    final ignoreDef = (action.actionValue7 > 0 ||
            [106501108, 106501109].contains(action.actionId))
        ? t.skill_ignore_def(action.actionValue7.toStringAsFixed(0))
        : "";
    String multiple = "";
    String multipleDamage = "";
    String value = "";
    if (action.actionValue6 > 0) {
      if (action.actionValue6 > 1) {
        multiple = "[${action.actionValue6 * 2}]";
      } else {
        multiple = "[2]";
      }
      multipleDamage = t.skill_critical_damage_multiple(multiple);
    }

    value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      v3: action.actionValue3,
      v4: action.actionValue4,
    );

    return t.skill_action_type_desc_1(
      getTarget(),
      value,
      atkType,
      adaptive,
      multipleDamage,
      mustCritical,
      ignoreDef,
    );
  }

  String move() {
    final directionText =
        (action.actionValue1 > 0 ? t.skill_forward : t.skill_backward);
    final positionText =
        (action.actionValue1 > 0 ? t.skill_ahead : t.skill_rear);

    final moveText = t.skill_move(
      getTarget(),
      positionText,
      action.actionValue1.abs().toInt(),
    );
    final returnText = t.skill_return;
    final speedText = t.skill_move_speed(action.actionValue2.toInt());

    return ({
          1: moveText + returnText,
          2: directionText + moveText + returnText,
          3: moveText,
          4: directionText + moveText,
          5: moveText + speedText,
          6: directionText + moveText + speedText,
          7: directionText + moveText,
        }[action.actionDetail1]) ??
        t.unknown;
  }

  String changePosition() {
    switch (action.actionDetail1) {
      case 1:
      case 9:
        return t.skill_action_type_desc_3_up(
          t.skill_hit_up,
          getTarget(),
          action.actionValue1.abs().toInt(),
        );
      case 3:
      case 6:
        return t.skill_action_type_desc_3_move(
          action.actionValue1 > 0 ? t.skill_push : t.skill_pull,
          getTarget(),
          action.actionValue1.abs().toInt(),
        );
      case 8:
        return t.skill_action_type_desc_3_pull(
          getTarget(),
          t.skill_pull,
          action.actionValue1.toInt(),
        );
      default:
        return t.unknown;
    }
  }

  String heal() {
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      v3: action.actionValue3,
      v4: action.actionValue4,
    );
    return t.skill_action_type_desc_4(getTarget(), value);
  }

  String barrier() {
    final value = getValueText(1, action.actionValue1, action.actionValue2);
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    final type = getBarrierType(action.actionDetail1);
    if (type != t.unknown) {
      return t.skill_action_type_desc_6(getTarget(), type, value, time);
    } else {
      return type;
    }
  }

  String chooseEnemy() {
    return t.skill_action_type_desc_7(getTarget());
  }

  String speed() {
    tag = ({
          1: t.skill_ailment_1,
          2: t.skill_ailment_2,
          3: t.skill_ailment_3,
          4: t.skill_ailment_4,
          5: t.skill_ailment_5,
          6: t.skill_ailment_6,
          7: t.skill_ailment_7_12_14,
          12: t.skill_ailment_7_12_14,
          14: t.skill_ailment_7_12_14,
          8: t.skill_ailment_8,
          9: t.skill_ailment_9,
          10: t.skill_ailment_10,
          11: t.skill_ailment_11,
          13: t.skill_ailment_13,
        }[action.actionDetail1] ??
        t.unknown);
    final value = getValueText(1, action.actionValue1, action.actionValue2);
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    String descText = "";
    if (action.actionType ==
        SkillActionType.superimposeChangeActionSpeed.value) {
      tag += t.skill_ailment_extra;
    } else if (action.actionType == SkillActionType.speedField.value) {
      tag += t.skill_ailment_field;
    }
    if ([1, 2].contains(action.actionDetail1)) {
      if (action.actionType ==
          SkillActionType.superimposeChangeActionSpeed.value) {
        final type =
            action.actionDetail1 == 1 ? t.skill_reduce : t.skill_increase;
        descText = t.skill_action_speed_change(type, value);
      } else {
        descText = t.skill_action_speed_multiple(value);
      }
      if (action.actionType == SkillActionType.speedField.value) {
        return t.skill_action_type_desc_field(
          descText,
          action.actionValue5.toInt(),
          time,
        );
      } else {
        return "$tag${getTarget()}，$descText$time";
      }
    } else {
      final count = action.actionDetail2 == 1 ? t.skill_action_hit_remove : "";

      return t.skill_action_type_desc_8(getTarget(), tag, time, count);
    }
  }

  String dot() {
    tag = ({
          0: t.skill_dot_0,
          1: t.skill_dot_1_7,
          7: t.skill_dot_1_7,
          2: t.skill_dot_2,
          3: t.skill_dot_3_8,
          8: t.skill_dot_3_8,
          4: t.skill_dot_4,
          5: t.skill_dot_5,
          11: t.skill_dot_11,
        }[action.actionDetail1] ??
        t.unknown);
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      percent: getPercent(),
    );
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    final dotIncrease = action.actionDetail1 == 5
        ? t.skill_action_dot_increase(action.actionValue5.toInt())
        : "";
    return t.skill_action_type_desc_9(
      getTarget(),
      tag,
      value,
      dotIncrease,
      time,
    );
  }

  String aura() {
    tag = action.actionDetail1 % 10 == 0 ? t.skill_buff : t.skill_debuff;
    if (action.actionDetail1 % 1000 ~/ 10 == 5) {
      // 回避等技能限制
      initOtherLimit();
    }

    final value = getValueText(
      2,
      action.actionValue2,
      action.actionValue3,
      percent: getPercent(),
    );
    final aura = getAura(action.actionDetail1, value);
    final time = getTimeText(4, action.actionValue4, v2: action.actionValue5);
    if (action.actionDetail2 == 2) {
      return t.skill_action_type_desc_10_break(getTarget(), aura);
    } else {
      return "${getTarget()}$aura$time";
    }
  }

  // 11：魅惑/混乱12：黑暗 13：沉默
  String charm() {
    final chance = getValueText(
      3,
      action.actionValue3,
      (action.actionValue3 == 100 ? 0.0 : 1.0),
      v3: 0.0,
      percent: "%",
    );
    final time = getTimeText(1, action.actionValue1, v2: action.actionValue2);
    if (action.actionType == SkillActionType.charm.value) {
      tag = {0: t.skill_charm_0, 1: t.skill_charm_1}[action.actionDetail1] ??
          t.unknown;
    } else if (action.actionType == SkillActionType.silence.value) {
      tag = t.skill_type_13;
    }
    String result = t.skill_action_type_desc_12_13(
      chance,
      getTarget(),
      tag,
      time,
    );
    if (action.actionType == SkillActionType.blind.value) {
      result += t.skill_action_atk_miss(100 - action.actionDetail1);
    }
    return result;
  }

  String changeMode() {
    return {
          1: t.skill_action_change_mode(
            action.actionValue5 == 1
                ? t.skill_action_change_to_flight_status
                : t.none,
            getTimeText(1, action.actionValue1),
          ),
          2: t.skill_action_type_desc_14_2(action.actionValue1.toInt()),
          3: t.skill_action_type_desc_14_3,
        }[action.actionDetail1] ??
        t.unknown;
  }

  String summon() {
    final desc = t.skill_action_summon_unit;
    if (action.actionValue7 > 0) {
      return t.skill_action_type_desc_15(
        getTarget(),
        t.skill_ahead,
        action.actionValue7.toInt(),
        desc,
      );
    } else if (action.actionValue7 < 0) {
      return t.skill_action_type_desc_15(
        getTarget(),
        t.skill_rear,
        action.actionValue7.abs().toInt(),
        desc,
      );
    } else {
      return t.skill_action_summon_target(getTarget(), desc);
    }
  }

  String tp() {
    final value = getValueText(1, action.actionValue1, action.actionValue2);
    tag = t.skill_action_tp_recovery;
    if (action.actionDetail1 == 4) {
      tag = t.skill_action_tp_reduce;
    }
    return "${getTarget()}$tag $value";
  }

  String trigger() {
    final desc = {
          2: t.skill_action_type_desc_17_2(action.actionValue1.toInt()),
          3: t.skill_action_type_desc_17_3(action.actionValue3.toInt()),
          4: t.skill_action_type_desc_17_4(action.actionValue1.toInt()),
          5: t.skill_action_type_desc_17_5(action.actionValue1.toInt()),
          7: t.skill_action_type_desc_17_7(action.actionValue3.toInt()),
          8: t.skill_action_type_desc_17_8(action.actionValue1.toInt()),
          9: t.skill_action_type_desc_17_9(
            action.actionValue1.toInt(),
            getTimeText(3, action.actionValue3, hideIndex: true),
          ),
          10: t.skill_action_type_desc_17_10(action.actionValue1.toInt()),
          11: t.skill_action_type_desc_17_11,
          13: t.skill_action_type_desc_17_13(action.actionValue3.toInt()),
          14: t.skill_action_type_desc_17_17(action.actionValue1.toInt()),
        }[action.actionDetail1] ??
        t.unknown;
    return t.skill_action_condition(desc);
  }

  String loopTrigger() {
    if (action.actionDetail1 == 2) {
      final value = getValueText(
        1,
        action.actionValue1,
        action.actionValue2,
        percent: "%",
      );
      return t.skill_action_type_desc_42_2(
        action.actionValue4.toInt(),
        value,
        action.actionDetail2 % 100,
      );
    } else if (action.actionDetail1 == 14) {
      final value = getValueText(
        1,
        action.actionValue1,
        action.actionValue2,
        percent: "%",
      );
      String actionText = t.skill_action_d(action.actionDetail2 % 100);
      if (action.actionDetail3 != 0) {
        actionText += "、${t.skill_action_d(action.actionDetail3 % 100)}";
      }
      return t.skill_action_type_desc_42_14(
        action.actionValue4.toInt(),
        value,
        actionText,
      );
    } else {
      return t.unknown;
    }
  }

  String triggerV2() {
    final effect = {
          1: t.skill_action_type_desc_77_1 + t.skill_buff,
          2: t.skill_action_type_desc_77_1 + t.skill_action_type_desc_111_2,
        }[action.actionDetail1] ??
        t.unknown;
    return t.skill_action_type_desc_111(
      getTarget(),
      effect,
      action.actionDetail2 % 100,
    );
  }

  String charge() {
    // 18：蓄力、19：伤害充能
    final desc = t.skill_action_type_desc_18_19(action.actionValue3.toString());
    String extraDesc = "";
    if (action.actionValue1 != 0.0 || action.actionValue2 != 0.0) {
      final value = getValueText(1, action.actionValue1, action.actionValue2);
      extraDesc = t.skill_action_type_desc_18_19_detail(
        action.actionDetail2 % 100,
        value,
      );
    }
    return desc + extraDesc;
  }

  String taunt() {
    // 20：挑衅
    // 回避等技能限制
    initOtherLimit();
    final time = getTimeText(1, action.actionValue1, v2: action.actionValue2);
    return t.skill_action_type_desc_20(getTarget(), action.ailmentName, time);
  }

  String invincible() {
    // 回避等技能限制
    initOtherLimit();
    tag = {
          1: t.skill_action_type_desc_21_1,
          2: t.skill_action_type_desc_21_2,
          3: t.skill_action_type_desc_21_3,
          6: t.skill_action_type_desc_21_6,
          8: t.skill_action_type_desc_21_8,
        }[action.actionDetail1] ??
        t.unknown;
    if (action.actionValue1 <= 0) {
      return tag;
    }
    final time = getTimeText(1, action.actionValue1, v2: action.actionValue2);
    return "$tag$time";
  }

  String changePattern() {
    if (action.actionDetail1 == 1) {
      return t.skill_action_loop_change(
        action.actionValue1 > 0 ? getTimeText(1, action.actionValue1) : "",
      );
    } else if (action.actionDetail1 == 2) {
      return t.skill_action_skill_anim_change(
        getTimeText(1, action.actionValue1),
      );
    } else {
      return t.unknown;
    }
  }

  String ifStatus() {
    final status = getStatus();
    String trueClause = t.unknown;
    String falseClause = t.unknown;
    // ---------- 设置 true_clause ----------
    if (action.actionDetail2 != 0) {
      if (status != t.unknown) {
        // 原代码: getString(R.string.skill_action_if_status, getTarget(), status, self.action.action_detail_2 % 100)
        trueClause = t.skill_action_if_status(
          getTarget(),
          status,
          action.actionDetail2 % 100,
        );
      } else {
        // 根据 self.action.action_detail_1 不同范围进行判断
        if ((600 <= action.actionDetail1 && action.actionDetail1 <= 699) ||
            action.actionDetail1 == 710 ||
            action.actionDetail1 == 6145) {
          // getString(R.string.skill_action_if_mark, getTarget(), self.action.action_detail_2 % 100)
          trueClause = t.skill_action_if_mark(
            getTarget(),
            action.actionDetail2 % 100,
          );
        } else if (action.actionDetail1 == 6194) {
          // getString(R.string.skill_action_if_mark_count, getTarget(), self.action.action_value_3.toInt(), self.action.action_detail_2 % 100)
          trueClause = t.skill_action_if_mark_count(
            getTarget(),
            action.actionValue3.toInt(),
            action.actionDetail2 % 100,
          );
        } else if (action.actionDetail1 == 700) {
          // getString(R.string.skill_action_if_alone, getTarget(), self.action.action_detail_2 % 100)
          trueClause = t.skill_action_if_alone(
            getTarget(),
            action.actionDetail2 % 100,
          );
        } else if (901 <= action.actionDetail1 && action.actionDetail1 <= 999) {
          // getString(R.string.skill_action_if_hp_below, getTarget(), self.action
          trueClause = t.skill_action_if_hp_below(
            getTarget(),
            action.actionDetail1 - 900,
            action.actionDetail2 % 100,
          );
        } else if (action.actionDetail1 == 2000 ||
            action.actionDetail1 == 1300) {
          // getString(R.string.skill_action_if_unit_atk_type, getTarget(), getString(R.string.skill_status_physical_atk), self.action.action_detail_2 % 100)
          // 这里模拟 getString(R.string.skill_status_physical_atk) => "physical_atk"
          trueClause = t.skill_action_if_unit_atk_type(
            getTarget(),
            t.skill_status_physical_atk,
            action.actionDetail2 % 100,
          );
        } else if (action.actionDetail1 == 2001) {
          // getString(R.string.skill_action_if_unit_atk_type, getTarget(), getString(R.string.skill_status_magic_atk), self.action.action_detail_2 % 100)
          trueClause = t.skill_action_if_unit_atk_type(
            getTarget(),
            t.skill_status_magic_atk,
            action.actionDetail2 % 100,
          );
        } else {
          trueClause = t.unknown;
        }
      }
    }

    // ---------- 设置 false_clause ----------
    if (action.actionDetail3 != 0) {
      if (status != t.unknown) {
        // getString(R.string.skill_action_if_status_not, getTarget(), status, self.action.action_detail_3 % 100)
        falseClause = t.skill_action_if_status_not(
          getTarget(),
          status,
          action.actionDetail3 % 100,
        );
      } else {
        if ((600 <= action.actionDetail1 && action.actionDetail1 <= 699) ||
            action.actionDetail1 == 710 ||
            action.actionDetail1 == 6145) {
          // getString(R.string.skill_action_if_mark_not, getTarget(), self.action.action_detail_3 % 100)
          falseClause = t.skill_action_if_mark_not(
            getTarget(),
            action.actionDetail3 % 100,
          );
        } else if (action.actionDetail1 == 6194) {
          // getString(R.string.skill_action_if_mark_count_not, getTarget(), self.action.action_value_3.toInt(), self.action.action_detail_3 % 100)
          falseClause = t.skill_action_if_mark_count_not(
            getTarget(),
            action.actionValue3.toInt(),
            action.actionDetail3 % 100,
          );
        } else if (action.actionDetail1 == 700) {
          // getString(R.string.skill_action_if_alone_not, getTarget(), self.action.action
          falseClause = t.skill_action_if_alone_not(
            getTarget(),
            action.actionDetail3 % 100,
          );
        } else if (901 <= action.actionDetail1 && action.actionDetail1 <= 999) {
          // getString(R.string.skill_action_if_hp_above, getTarget(), self.action
          falseClause = t.skill_action_if_hp_above(
            getTarget(),
            action.actionDetail1 - 900,
            action.actionDetail3 % 100,
          );
        } else if (action.actionDetail1 == 2000 ||
            action.actionDetail1 == 1300) {
          // 原代码中的“else分支”与 truth 分支相反；对 atk_type 逻辑做相反处理
          falseClause = t.skill_action_if_unit_atk_type(
            getTarget(),
            t.skill_status_magic_atk,
            action.actionDetail3 % 100,
          );
        } else if (action.actionDetail1 == 2001) {
          falseClause = t.skill_action_if_unit_atk_type(
            getTarget(),
            t.skill_status_physical_atk,
            action.actionDetail3 % 100,
          );
        } else {
          falseClause = t.unknown;
        }
      }
    }
    // ---------- 最终返回结果 ----------
    // 原 Kotlin: if (self.action.action_detail_1 in 0..99) { ... } else { ... }
    if (0 <= action.actionDetail1 && action.actionDetail1 <= 99) {
      // 满足 0..99 时，走 “随机” 分支
      if (action.actionDetail2 != 0 && action.actionDetail3 != 0) {
        // getString(R.string.skill_action_random_1, self.action.action_detail_1, self.action.action_detail_2 % 100, self.action.action_detail_3 % 100)
        return t.skill_action_random_1(
          action.actionDetail1,
          action.actionDetail2 % 100,
          action.actionDetail3 % 100,
        );
      } else if (action.actionDetail2 != 0) {
        // getString(R.string.skill_action_random_2, self.action.action_detail_1, self.action.action_detail_2 % 100)
        return t.skill_action_random_2(
          action.actionDetail1,
          action.actionDetail2 % 100,
        );
      } else if (action.actionDetail3 != 0) {
        // getString(R.string.skill_action_random_2, 100 - self.action.action_detail_1, self.action.action_detail_3 % 100)
        return t.skill_action_random_2(
          100 - action.actionDetail1,
          action.actionDetail3 % 100,
        );
      } else {
        return t.unknown;
      }
    } else if (trueClause != t.unknown && falseClause != t.unknown) {
      // getString(R.string.skill_action_condition, "${trueClause}；${falseClause}")
      // 注意原 Kotlin 用的是 “；” 分隔，这里也用同样符号
      return t.skill_action_condition("$trueClause；$falseClause");
    } else if (trueClause != t.unknown) {
      // getString(R.string.skill_action_condition, trueClause)
      return t.skill_action_condition(trueClause);
    } else if (falseClause != t.unknown) {
      // getString(R.string.skill_action_condition, falseClause)
      return t.skill_action_condition(falseClause);
    } else {
      return t.unknown;
    }
  }

  String revival() {
    return t.skill_action_type_desc_24(
      getTarget(),
      (action.actionValue2 * 100).toInt(),
    );
  }

  String coefficient() {
    // ------------ 1) 计算 attrType ------------
    final attrType = {
          7: t.skill_physical_str,
          8: t.skill_magic_str,
          9: t.skill_physical_def,
          10: t.skill_magic_def,
        }[action.actionValue1.toInt()] ??
        t.unknown;
    // ------------ 2) 计算 changeType ------------
    final sat = SkillActionType.getByType(action.actionType);
    String changeType;
    switch (sat) {
      case SkillActionType.additive:
        changeType = t.skill_action_type_desc_additive;
      case SkillActionType.multiple:
        changeType = t.skill_action_type_desc_multiple;
      case SkillActionType.divide:
        changeType = t.skill_action_type_desc_divide;
      default:
        changeType = t.unknown;
    }

    //------------ 3) 构造 commonDesc 字符串 ------------
    final value = getValueText(
      2,
      action.actionValue2,
      action.actionValue3,
      hideIndex: true,
    );
    final commonDesc = t.skill_action_change_coe(
      (action.actionDetail1 % 100).toInt(),
      action.actionDetail2.toInt(),
      changeType,
      value,
    );
    // ------------ 4) 根据 self.action.action_value_1 不同取 extraDesc ------------
    final av1 = action.actionValue1.toInt();
    String extraDesc = t.unknown;
    if (av1 == 2) {
      String mValue;
      if (action.actionDetail3 == 0) {
        mValue = "[${action.actionValue2}]";
      } else if (action.actionDetail2 == 0) {
        mValue = "[${action.actionValue3}]";
      } else {
        mValue =
            "[${action.actionValue2 + 2 * action.actionValue3 * level}] <${action.actionValue2} + ${2 * action.actionValue3} * ${t.skill_level}>";
      }
      final mDesc = t.skill_action_change_coe(
        (action.actionDetail1 % 100).toInt(),
        action.actionDetail2.toInt(),
        changeType,
        mValue,
      );
      extraDesc = t.skill_action_change_coe_2(mDesc);
    } else if (av1 == 0) {
      extraDesc = t.skill_action_change_coe_0(commonDesc);
    } else if (av1 == 1) {
      extraDesc = t.skill_action_change_coe_1(commonDesc);
    } else if (av1 == 4) {
      final targetStr = getTarget();
      final targetType = targetStr.isNotEmpty ? targetStr : t.skill_target_none;
      extraDesc = t.skill_action_change_coe_4(commonDesc, targetType);
    } else if (av1 == 5) {
      extraDesc = t.skill_action_change_coe_5(commonDesc);
    } else if (av1 == 6) {
      extraDesc = t.skill_action_change_coe_6(commonDesc);
    } else if (7 <= av1 && av1 <= 10) {
      // getString(R.string.skill_action_change_coe_7_10, commonDesc, getTarget(), attrType)
      extraDesc = t.skill_action_change_coe_7_10(
        commonDesc,
        getTarget(),
        attrType,
      );
    } else if (av1 == 12) {
      extraDesc = t.skill_action_change_coe_12(commonDesc, getTarget());
    } else if (av1 == 13) {
      extraDesc = t.skill_action_change_coe_13(commonDesc);
    } else if (av1 == 15) {
      extraDesc = t.skill_action_change_coe_15(commonDesc, getTarget());
    } else if (av1 == 16) {
      extraDesc = t.skill_action_change_coe_16(commonDesc, getTarget());
    } else if (av1 == 102) {
      extraDesc = t.skill_action_change_coe_102(commonDesc);
    } else if (20 <= av1 && av1 < 30) {
      extraDesc = t.skill_action_change_coe_skill_count(commonDesc);
    } else if ((200 <= av1 && av1 < 300) || (2112 <= av1 && av1 < 3000)) {
      extraDesc = t.skill_action_change_coe_mark_count(commonDesc);
    } else {
      extraDesc = t.unknown;
    }
    // ------------ 5) 计算 limitDesc 并返回最终结果 ------------
    if (action.actionValue4.toInt() == 0) {
      return extraDesc;
    }
    final limitValue = getValueText(
      4,
      action.actionValue4,
      action.actionValue5,
      hideIndex: true,
    );
    final limitDesc = t.skill_action_limit(limitValue);
    // extraDesc + limit
    return extraDesc == t.unknown ? t.unknown : extraDesc + limitDesc;
  }

  String ifSpStatus() {
    final status = getStatus();
    String trueClause = t.unknown;
    String falseClause = t.unknown;
    // ---------- 设置 true_clause ----------
    if (action.actionDetail2 != 0 || action.actionDetail3 == 0) {
      // 对应 Kotlin：if (self.action.action_detail_2 != 0 || self.action.action_detail_3 == 0) {...}
      if (0 <= action.actionDetail1 && action.actionDetail1 <= 99) {
        // skill_action_sp_if_rate
        trueClause = t.skill_action_sp_if_rate(
          action.actionDetail1,
          action.actionDetail2 % 100,
        );
      } else if (action.actionDetail1 == 599) {
        // skill_action_sp_if_dot
        trueClause = t.skill_action_sp_if_dot(
          getTarget(),
          action.actionDetail2 % 100,
        );
      } else if ((600 <= action.actionDetail1 && action.actionDetail1 <= 699) ||
          (6000 <= action.actionDetail1 && action.actionDetail1 <= 6999)) {
        // skill_action_sp_if_mark_count
        final cnt = max(action.actionValue3.toInt(), 1);
        trueClause = t.skill_action_sp_if_mark_count(
          getTarget(),
          cnt,
          action.actionDetail2 % 100,
        );
      } else if (action.actionDetail1 == 700) {
        // skill_action_if_alone
        trueClause = t.skill_action_if_alone(
          getTarget(),
          action.actionDetail2 % 100,
        );
      } else if (701 <= action.actionDetail1 && action.actionDetail1 <= 709) {
        // skill_action_sp_if_unit_count
        trueClause = t.skill_action_sp_if_unit_count(
          getTarget(),
          action.actionDetail1 - 700,
          action.actionDetail2 % 100,
        );
      } else if (action.actionDetail1 == 720) {
        // skill_action_sp_if_unit_exist
        trueClause = t.skill_action_sp_if_unit_exist(
          getTarget(),
          action.actionDetail2 % 100,
        );
      } else if (901 <= action.actionDetail1 && action.actionDetail1 <= 999) {
        // skill_action_if_hp_below
        trueClause = t.skill_action_if_hp_below(
          getTarget(),
          action.actionDetail1 - 900,
          action.actionDetail2 % 100,
        );
      } else if (action.actionDetail1 == 1000) {
        // skill_action_sp_if_kill
        trueClause = t.skill_action_sp_if_kill(action.actionDetail2 % 100);
      } else if (action.actionDetail1 == 1001) {
        // skill_action_sp_if_critical
        trueClause = t.skill_action_sp_if_critical(action.actionDetail2 % 100);
      } else if (1200 <= action.actionDetail1 && action.actionDetail1 <= 1299) {
        // skill_action_sp_if_skill_count
        trueClause = t.skill_action_sp_if_skill_count(
          getTarget(),
          action.actionDetail1 % 10,
          action.actionDetail2 % 100,
        );
      } else if (action.actionDetail1 == 2000 || action.actionDetail1 == 1300) {
        // skill_action_if_unit_atk_type ... physical
        trueClause = t.skill_action_if_unit_atk_type(
          getTarget(),
          t.skill_status_physical_atk,
          action.actionDetail2 % 100,
        );
      } else if (action.actionDetail1 == 2001) {
        // skill_action_if_unit_atk_type ... magic
        trueClause = t.skill_action_if_unit_atk_type(
          getTarget(),
          t.skill_status_magic_atk,
          action.actionDetail2 % 100,
        );
      } else {
        // skill_action_if_status
        trueClause = t.skill_action_if_status(
          getTarget(),
          status,
          action.actionDetail2 % 100,
        );
      }
    }
    // ---------- 设置 false_clause ----------
    // 对应 Kotlin：if (self.action.action_detail_3 != 0) {...}
    if (action.actionDetail3 != 0) {
      if (0 <= action.actionDetail1 && action.actionDetail1 <= 99) {
        falseClause = t.skill_action_sp_if_rate(
          100 - action.actionDetail1,
          action.actionDetail3 % 100,
        );
      } else if (action.actionDetail1 == 599) {
        falseClause = t.skill_action_sp_if_dot_not(
          getTarget(),
          action.actionDetail3 % 100,
        );
      } else if ((600 <= action.actionDetail1 && action.actionDetail1 <= 699) ||
          (6000 <= action.actionDetail1 && action.actionDetail1 <= 6999)) {
        final cnt = max(action.actionValue3.toInt(), 1);
        falseClause = t.skill_action_sp_if_mark_count_not(
          getTarget(),
          cnt,
          action.actionDetail3 % 100,
        );
      } else if (action.actionDetail1 == 700) {
        falseClause = t.skill_action_if_alone_not(
          getTarget(),
          action.actionDetail3 % 100,
        );
      } else if (701 <= action.actionDetail1 && action.actionDetail1 <= 709) {
        falseClause = t.skill_action_sp_if_unit_count_not(
          getTarget(),
          action.actionDetail1 - 700,
          action.actionDetail3 % 100,
        );
      } else if (action.actionDetail1 == 720) {
        falseClause = t.skill_action_sp_if_unit_exist_not(
          getTarget(),
          action.actionDetail3 % 100,
        );
      } else if (901 <= action.actionDetail1 && action.actionDetail1 <= 999) {
        falseClause = t.skill_action_if_hp_above(
          getTarget(),
          action.actionDetail1 - 900,
          action.actionDetail3 % 100,
        );
      } else if (action.actionDetail1 == 1000) {
        falseClause = t.skill_action_sp_if_kill_not(action.actionDetail3 % 100);
      } else if (action.actionDetail1 == 1001) {
        falseClause = t.skill_action_sp_if_critical_not(
          action.actionDetail3 % 100,
        );
      } else if (1200 <= action.actionDetail1 && action.actionDetail1 <= 1299) {
        falseClause = t.skill_action_sp_if_skill_count_not(
          getTarget(),
          action.actionDetail1 % 10,
          action.actionDetail3 % 100,
        );
      } else if (action.actionDetail1 == 2000 || action.actionDetail1 == 1300) {
        falseClause = t.skill_action_if_unit_atk_type(
          getTarget(),
          t.skill_status_magic_atk,
          action.actionDetail3 % 100,
        );
      } else if (action.actionDetail1 == 2001) {
        falseClause = t.skill_action_if_unit_atk_type(
          getTarget(),
          t.skill_status_physical_atk,
          action.actionDetail3 % 100,
        );
      } else {
        falseClause = t.skill_action_if_status_not(
          getTarget(),
          status,
          action.actionDetail3 % 100,
        );
      }
    }
    // ---------- 最终返回结果 ----------
    // 对应 Kotlin：if (self.action.action_detail_1 in 0..99) { ... } else { ... }
    if (trueClause != t.unknown && falseClause != t.unknown) {
      // "trueClause；falseClause"
      return t.skill_action_condition("$trueClause；$falseClause");
    } else if (trueClause != t.unknown) {
      return t.skill_action_condition(trueClause);
    } else if (falseClause != t.unknown) {
      return t.skill_action_condition(falseClause);
    } else {
      return t.unknown;
    }
  }

  String noUb() {
    return t.skill_action_type_desc_29;
  }

  String killMe() {
    return t.skill_action_type_desc_30(getTarget());
  }

  String lifeSteal() {
    // 回避等技能限制
    initOtherLimit();
    final value = getValueText(1, action.actionValue1, action.actionValue2);
    return t.skill_action_type_desc_32(
      getTarget(),
      action.actionValue3.toInt(),
      action.ailmentName,
      value,
    );
  }

  String strikeBack() {
    final value = getValueText(1, action.actionValue1, action.actionValue2);
    final type = getBarrierType(action.actionDetail1);
    final shieldText = t.skill_action_type_desc_6(getTarget(), type, "", "");
    final backType = {
          1: t.skill_physical,
          3: t.skill_physical,
          2: t.skill_magic,
          4: t.skill_magic,
        }[action.actionDetail1] ??
        "";
    final hpRecovery = {
          3: t.skill_action_type_desc_33_hp,
          4: t.skill_action_type_desc_33_hp,
          6: t.skill_action_type_desc_33_hp,
        }[action.actionDetail1] ??
        "";
    if (action.actionDetail1 <= 6) {
      return t.skill_action_type_desc_33(
        shieldText,
        backType,
        value,
        hpRecovery,
        action.actionValue3.toInt(),
      );
    } else {
      return t.unknown;
    }
  }

  String accumulativeDamage() {
    final value = getValueText(2, action.actionValue2, action.actionValue3);
    final limit = t.skill_action_limit_int(action.actionValue4.toInt());
    return t.skill_action_type_desc_34(value, limit);
  }

  String seal() {
    final count = action.actionValue4.abs();
    if (action.actionValue4 <= 0) {
      return t.skill_action_type_desc_35_reduce(getTarget(), count.toInt());
    }
    final time = getTimeText(3, action.actionValue3, hideIndex: true);
    final limit = t.skill_action_limit_int(action.actionValue1.toInt());
    return t.skill_action_type_desc_35(getTarget(), count.toInt(), time, limit);
  }

  String sealV2() {
    final count = action.actionValue4.abs().toInt();
    if (action.actionDetail2 <= 0) {
      return t.skill_action_type_desc_101_reduce(getTarget(), count);
    }
    final time = getTimeText(3, action.actionValue3, hideIndex: true);
    final limit = t.skill_action_limit_int(action.actionValue1.toInt());
    return t.skill_action_type_desc_101(getTarget(), count, time, limit);
  }

  String attackField() {
    final atkType = getAtkType();
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      v3: action.actionValue3,
    );
    final time = getTimeText(5, action.actionValue5, v2: action.actionValue6);
    final damage = t.skill_action_type_desc_36_damage(value, atkType);
    return t.skill_action_type_desc_field(
      damage,
      action.actionValue7.toInt(),
      time,
    );
  }

  String healField() {
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      v3: action.actionValue3,
    );
    final heal = t.skill_action_type_desc_37_heal(value);
    final time = getTimeText(5, action.actionValue5, v2: action.actionValue6);
    return t.skill_action_type_desc_field(
      heal,
      action.actionValue7.toInt(),
      time,
    );
  }

  String dotField() {
    final time = getTimeText(3, action.actionValue1, v2: action.actionValue2);
    final actionDesc = t.skill_action_type_desc_38_action(
      action.actionDetail1 % 100,
    );
    return t.skill_action_type_desc_field(
      actionDesc,
      action.actionValue3.toInt(),
      time,
    );
  }

  String auraField() {
    final value = getValueText(
      2,
      action.actionValue2,
      action.actionValue3,
      percent: getPercent(),
    );
    final aura = getAura(action.actionDetail1, value);
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    return t.skill_action_type_desc_field(
      aura,
      action.actionValue5.toInt(),
      time,
    );
  }

  String waveStart() {
    return t.skill_action_type_desc_44(action.actionValue1.toInt());
  }

  String skillCount() {
    return t.skill_action_type_desc_45(
      t.skill_action_limit_int(action.actionValue1.toInt()),
    );
  }

  String rateDamage() {
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      percent: "%",
    );
    final limit = action.actionValue3 != 0.0
        ? t.skill_action_damage_limit_int(action.actionValue3.toInt())
        : "";
    final result = {
          1: t.skill_action_type_desc_46_1(getTarget(), value),
          2: t.skill_action_type_desc_46_2(getTarget(), value),
          3: t.skill_action_type_desc_46_3(getTarget(), value),
        }[action.actionDetail1] ??
        t.unknown;
    return result + limit;
  }

  String limitAttack() {
    return t.skill_action_type_desc_47;
  }

  String hot() {
    final type =
        {1: t.attr_hp, 2: t.attr_tp}[action.actionDetail2] ?? t.unknown;
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      v3: action.actionValue3,
    );
    final time = getTimeText(5, action.actionValue5, v2: action.actionValue6);
    if (type != t.unknown) {
      return t.skill_action_type_desc_48(getTarget(), type, value, time);
    } else {
      return t.unknown;
    }
  }

  String dispel() {
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      v3: 0.0,
      percent: "%",
    );
    final type = {
          1: t.skill_buff,
          3: t.skill_buff,
          2: t.skill_debuff,
          10: t.skill_barrier,
          20: t.skill_barrier,
        }[action.actionDetail1] ??
        t.unknown;

    return t.skill_action_type_desc_49(value, getTarget(), type);
  }

  String channel() {
    final time = getTimeText(4, action.actionValue4, v2: action.actionValue5);
    final value = getValueText(
      2,
      action.actionValue2,
      action.actionValue3,
      percent: getPercent(),
    );
    final aura = getAura(action.actionDetail1, value);
    return t.skill_action_type_desc_50(
      getTarget(),
      aura,
      time,
      action.actionDetail3,
    );
  }

  String changeWidth() {
    return t.skill_action_type_desc_52(action.actionValue1.toInt());
  }

  String ifHasField() {
    // 53：存在领域时
    if (action.actionDetail2 != 0 && action.actionDetail3 != 0) {
      final otherwise = t.skill_action_type_desc_53_2(
        action.actionDetail3 % 100,
      );
      final content = t.skill_action_type_desc_53(
        action.actionDetail2 % 100,
        otherwise,
      );
      return t.skill_action_condition(content);
    } else if (action.actionDetail2 != 0) {
      final content = t.skill_action_type_desc_53(
        action.actionDetail2 % 100,
        "",
      );
      return t.skill_action_condition(content);
    } else {
      return t.unknown;
    }
  }

  String stealth() {
    return t.skill_action_type_desc_54(getTimeText(1, action.actionValue1));
  }

  String movePart() {
    return t.skill_action_type_desc_55(
      action.actionValue4.toInt(),
      action.actionValue1.toInt(),
    );
  }

  String countBlind() {
    if (action.actionValue1 == 1) {
      final time = getTimeText(2, action.actionValue2, v2: action.actionValue3);
      return t.skill_action_type_desc_56_1(time, "");
    } else if (action.actionValue1 == 2) {
      final value = getValueText(2, action.actionValue2, action.actionValue3);
      return t.skill_action_type_desc_56_2(getTarget(), value);
    } else {
      return t.unknown;
    }
  }

  String countDown() {
    return t.skill_action_type_desc_57(
      getTarget(),
      action.actionValue1.toInt(),
      action.actionDetail1 % 100,
    );
  }

  String stopField() {
    return t.skill_action_type_desc_58(
      action.actionDetail1 ~/ 100 % 10,
      action.actionDetail1 % 100,
    );
  }

  String inhibitHeal() {
    return t.skill_action_type_desc_59(
      getTarget(),
      (action.actionValue1 * 100).toInt(),
      getTimeText(2, action.actionValue2),
    );
  }

  String attackSeal() {
    final limit = t.skill_action_limit_int(action.actionValue1.toInt());
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    final target = getTarget();
    final desc = t.skill_action_type_desc_60_0(time, limit);
    if (action.actionDetail1 == 3) {
      return t.skill_action_type_desc_60_1(target, desc);
    } else if (action.actionDetail1 == 1 && action.actionDetail3 == 1) {
      return t.skill_action_type_desc_60_2(target, desc);
    } else if (action.actionDetail1 == 4 && action.actionDetail3 == 1) {
      return t.skill_action_type_desc_60_3(target, desc);
    } else if (action.actionDetail1 == 5 && action.actionDetail3 == 1) {
      return t.skill_action_type_desc_60_4(target, desc);
    } else {
      return t.unknown;
    }
  }

  String fear() {
    final value = getValueText(
      3,
      action.actionValue3,
      action.actionValue4,
      percent: "%",
    );
    final time = getTimeText(1, action.actionValue1, v2: action.actionValue2);
    return t.skill_action_type_desc_61(
      value,
      getTarget(),
      action.ailmentName,
      time,
    );
  }

  String awe() {
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      percent: "%",
    );
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    return {
          0: t.skill_action_type_desc_62_0(getTarget(), value, time),
          1: t.skill_action_type_desc_62_1(getTarget(), value, time),
        }[action.actionDetail1] ??
        t.unknown;
  }

  String loop() {
    final successClause = action.actionDetail2 != 0
        ? t.skill_action_type_desc_63_success(action.actionDetail2 % 100)
        : t.unknown;
    final failureClause = action.actionDetail3 != 0
        ? t.skill_action_type_desc_63_failure(action.actionDetail3 % 100)
        : t.unknown;
    final main = t.skill_action_type_desc_63(
      action.actionValue2.toString(),
      action.actionDetail1 % 100,
      action.actionValue1.toString(),
      action.actionValue3.toString(),
    );
    if (successClause != t.unknown && failureClause != t.unknown) {
      return main + successClause + failureClause;
    } else if (successClause != t.unknown) {
      return main + successClause;
    } else if (failureClause != t.unknown) {
      return main + failureClause;
    } else {
      return t.unknown;
    }
  }

  String reindeer() {
    return t.skill_action_type_desc_69(
      getTarget(),
      getTimeText(1, action.actionValue1, v2: action.actionValue2),
    );
  }

  String exemptionDeath() {
    return t.skill_action_type_desc_71(
      getTarget(),
      getValueText(
        2,
        action.actionValue2,
        action.actionValue3,
        v3: action.actionValue4,
      ),
      getTimeText(6, action.actionValue6, v2: action.actionValue7),
    );
  }

  String damageReduce() {
    final type = {
          1: t.skill_physical,
          2: t.skill_magic,
          3: t.skill_all
        }[action.actionDetail1] ??
        "UNKNOWN";
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      percent: "%",
    );
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    return t.skill_action_type_desc_72(getTarget(), type, value, time);
  }

  String logBarrier() {
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    return t.skill_action_type_desc_73(
      getTarget(),
      action.actionValue5.toInt(),
      time,
    );
  }

  String hitCount() {
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    if (action.actionDetail1 == 3) {
      return t.skill_action_type_desc_75(
        action.actionValue1.toInt(),
        action.actionDetail2 % 100,
        time,
      );
    } else {
      return t.unknown;
    }
  }

  String healDown() {
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      percent: getPercent(),
    );
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    return t.skill_action_type_desc_76(getTarget(), value, time);
  }

  String ifBuffSeal() {
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    final effect = {
          1: t.skill_action_type_desc_77_1 + t.skill_buff,
          2: t.skill_action_type_desc_77_1 + t.skill_damage,
          3: t.skill_action_type_desc_77_1 + t.skill_status_down,
          4: t.skill_status_ub,
        }[action.actionDetail1] ??
        t.unknown;
    final limit = t.skill_action_limit_int(action.actionValue1.toInt());

    return t.skill_action_type_desc_77(
      action.actionDetail1 != 4 ? getTarget() : "",
      effect,
      action.actionDetail2,
      time,
      limit,
    );
  }

  String damageTacenUp() {
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    final limit = t.skill_action_limit_int(action.actionValue1.toInt());
    final countType =
        {1: t.skill_action_type_desc_78_1}[action.actionDetail1] ?? t.unknown;
    final effectType = {
          1: t.skill_action_type_desc_additive,
          2: t.skill_action_type_desc_subtract,
        }[action.actionDetail2] ??
        t.unknown;
    final valueText = "<${action.actionValue1} * $countType>";
    return t.skill_action_type_desc_78(
      getTarget(),
      effectType,
      valueText,
      time,
      limit,
    );
  }

  String actionDot() {
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      percent: getPercent(),
    );
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    String type = "";
    String limit = "";
    if (action.actionDetail1 == 10) {
      type = t.skill_hp_max;
      limit = t.skill_action_damage_limit_int(action.actionValue5.toInt());
    }

    return t.skill_action_type_desc_79(getTarget(), type, value, time, limit);
  }

  String noTarget() {
    return t.skill_action_type_desc_81(getTarget());
  }

  String ex() {
    final type = {
          1: t.attr_hp,
          2: t.attr_atk,
          3: t.attr_def,
          4: t.attr_magic_str,
          5: t.attr_magic_def,
          6: t.attr_physical_critical,
          7: t.attr_magic_critical,
        }[action.actionDetail1] ??
        t.unknown;

    final value = getValueText(2, action.actionValue2, action.actionValue3);

    return t.skill_action_type_desc_90(getTarget(), type, value);
  }

  String exEquipHalf() {
    return t.skill_action_type_desc_902(action.actionValue3.toString());
  }

  String exEquipFull() {
    return t.skill_action_type_desc_901;
  }

  String changeTpRatio() {
    return t.skill_action_type_desc_92(
      getTarget(),
      action.actionValue1.toInt().toString(),
    );
  }

  String ignoreTaunt() {
    return t.skill_action_type_desc_93(getTarget());
  }

  String specialEffect() {
    return t.skill_action_type_desc_94(getTarget());
  }

  String hide() {
    final time = getTimeText(1, action.actionValue1, v2: action.actionValue2);
    return t.skill_action_type_desc_95(getTarget(), time);
  }

  String tpField() {
    final value = getValueText(1, action.actionValue1, action.actionValue2);
    final tp = t.skill_action_type_desc_96_tp(value);
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    return t.skill_action_type_desc_field(
      tp,
      action.actionValue5.toInt(),
      time,
    );
  }

  String tpHit() {
    final limit = t.skill_action_limit_int(action.actionValue4.toInt());
    final time = getTimeText(5, action.actionValue5);
    final desc = t.skill_action_type_desc_35(
      getTarget(),
      action.actionValue3.toInt(),
      time,
      limit,
    );
    final tpDesc = t.skill_action_type_desc_97(action.actionValue1.toInt());
    return desc + tpDesc;
  }

  String tpHitReduce() {
    final time = getTimeText(2, action.actionValue2, v2: action.actionValue3);
    return t.skill_action_type_desc_98(
      getTarget(),
      action.actionValue1.toString(),
      time,
    );
  }

  String ignoreSpeedDown() {
    final time = getTimeText(3, action.actionValue3);
    final limit = action.actionValue1 == -1
        ? t.none
        : t.skill_action_type_desc_100_count(action.actionValue1.toInt());
    return t.skill_action_type_desc_100(getTarget(), limit, time);
  }

  String copyAtk() {
    return t.skill_action_type_desc_103(
      action.actionDetail2 % 100,
      getTarget(),
    );
  }

  String environment() {
    final type = {
          137: t.skill_status_3137,
          162: t.skill_status_3162,
          175: t.skill_status_3175,
          207: t.skill_status_3207,
        }[action.actionDetail2] ??
        t.unknown;

    final time = getTimeText(1, action.actionValue1);
    return t.skill_action_type_desc_105(type, time);
  }

  String guard() {
    final type = {
          141: t.skill_action_type_desc_106_type_141
        }[action.actionDetail1] ??
        t.skill_action_type_desc_106_type_common;
    final time = getTimeText(3, action.actionValue3, v2: action.actionValue4);
    return t.skill_action_type_desc_106(getTarget(), type, time);
  }

  String sumCritical() {
    return t.skill_action_type_desc_107(action.actionDetail1 % 100);
  }

  String dotUp() {
    final value = getValueText(1, action.actionValue1, action.actionValue2);
    final limit = t.skill_action_damage_limit_int(action.actionValue7.toInt());
    return t.skill_action_type_desc_110(getTarget(), value, limit);
  }

  String sealCount() {
    return t.skill_action_type_desc_114(
      getTarget(),
      action.actionValue2.toInt(),
      action.actionValue3.toString(),
      action.actionDetail1 % 100,
      action.actionDetail2 % 100,
      getTimeText(4, action.actionValue4, hideIndex: true),
    );
  }

  String persistent() {
    final time = getTimeText(1, action.actionValue1);
    final status = t.skill_action_type_116;
    return t.skill_action_type_desc_116_121_123_124(getTarget(), status, time);
  }

  String magicChange() {
    final time = getTimeText(5, action.actionValue5);
    final status = t.skill_action_type_121;
    return t.skill_action_type_desc_116_121_123_124(getTarget(), status, time);
  }

  String magicChangeReduceDamage() {
    final time = getTimeText(3, action.actionValue3);
    final value = getValueText(
      1,
      action.actionValue1,
      action.actionValue2,
      percent: "%",
    );
    final desc = t.skill_action_type_desc_123_1(value);
    return t.skill_action_type_desc_116_121_123_124(getTarget(), desc, time);
  }

  String transferDamage() {
    final time = getTimeText(3, action.actionValue3);
    final status = t.skill_action_type_124;
    return t.skill_action_type_desc_116_121_123_124(getTarget(), status, time);
  }

  String cannotSelected() {
    return t.skill_action_type_desc_125(getTarget(), t.skill_action_type_125);
  }

  String buffDot() {
    return t.skill_action_type_desc_128(
      getTarget(),
      action.actionValue1 ~/ 100,
      getTimeText(2, action.actionValue2),
    );
  }

  String damage2dot() {
    return t.skill_action_type_desc_129(
      getTarget(),
      getValueText(1, action.actionValue1, 0.0, percent: "%"),
      getTimeText(2, action.actionValue2),
    );
  }

  String changeDefMax() {
    return t.skill_action_type_desc_130(getTarget());
  }
}
