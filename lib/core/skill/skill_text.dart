import 'package:kanna_note/constants.dart';
import 'package:kanna_note/core/db/database.dart';
import 'package:kanna_note/l10n/app_localizations.dart';
import 'package:kanna_note/core/db/model.dart';
import 'package:kanna_note/core/skill/skill_type.dart';

class ActionHandler {
  final AppLocalizations t;
  late int level;
  late int atk;
  late SkillActionInfo action;
  late SkillDataData skillData;
  late String tag;
  bool isOtherRfSkill = false; // 是否为回避等技能
  bool isOtherLimitAction = false; // 是否为等级限制技能
  ActionHandler({required this.t});

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
    final actionType =
        v == 1
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
        return if_status();
      case SkillActionType.revival:
        return revival();
      case SkillActionType.additive:
      case SkillActionType.multiple:
      case SkillActionType.divide:
        return coefficient();
      case SkillActionType.ifSpStatus:
        return if_sp_status();
      case SkillActionType.noUb:
        return no_ub();
      case SkillActionType.killMe:
        return kill_me();
      case SkillActionType.lifeSteal:
        return life_steal();
      case SkillActionType.strikeBack:
        return strike_back();
      case SkillActionType.accumulativeDamage:
      case SkillActionType.accumulativeDamageV2:
        return accumulative_damage();
      case SkillActionType.seal:
        return seal();
      case SkillActionType.sealV2:
        return seal_v2();
      case SkillActionType.attackField:
        return attack_field();
      case SkillActionType.healField:
        return heal_field();
      case SkillActionType.auraField:
        return aura_field();
      case SkillActionType.dotField:
        return dot_field();
      case SkillActionType.loopTrigger:
        return loop_trigger();
      case SkillActionType.waveStart:
        return wave_start();
      case SkillActionType.skillCount:
        return skill_count();
      case SkillActionType.rateDamage:
        return rate_damage();
      case SkillActionType.upperLimitAttack:
        return limit_attack();
      case SkillActionType.hot:
        return hot();
      case SkillActionType.dispel:
        return dispel();
      case SkillActionType.channel:
        return channel();
      case SkillActionType.changeWidth:
        return change_width();
      case SkillActionType.ifHasField:
        return if_has_field();
      case SkillActionType.stealth:
        return stealth();
      case SkillActionType.movePart:
        return move_part();
      case SkillActionType.countBlind:
        return count_blind();
      case SkillActionType.countDown:
        return count_down();
      case SkillActionType.stopField:
        return stop_field();
      case SkillActionType.inhibitHealAction:
        return inhibit_heal();
      case SkillActionType.attackSeal:
        return attack_seal();
      case SkillActionType.fear:
        return fear();
      case SkillActionType.awe:
        return awe();
      case SkillActionType.loop:
        return loop();
      case SkillActionType.reindeer:
        return reindeer();
      case SkillActionType.exemptionDeath:
        return exemption_death();
      case SkillActionType.damageReduce:
        return damage_reduce();
      case SkillActionType.logBarrier:
        return log_barrier();
      case SkillActionType.hitCount:
        return hit_count();
      case SkillActionType.healDown:
        return heal_down();
      case SkillActionType.ifBuffSeal:
        return if_buff_seal();
      case SkillActionType.dmgTakenUp:
        return damage_taken_up();
      case SkillActionType.actionDot:
        return action_dot();
      case SkillActionType.noTarget:
        return no_target();
      case SkillActionType.ex:
        return ex();
      case SkillActionType.exEquip:
        return ex_equip_full();
      case SkillActionType.exEquipHalf:
        return ex_equip_half();
      case SkillActionType.changeTpRatio:
        return change_tp_ratio();
      case SkillActionType.ignoreTaunt:
        return ignore_taunt();
      case SkillActionType.specialEffect:
        return special_effect();
      case SkillActionType.hide:
        return hide();
      case SkillActionType.tpField:
        return tp_field();
      case SkillActionType.tpHit:
        return tp_hit();
      case SkillActionType.tpHitReduce:
        return tp_hit_reduce();
      case SkillActionType.ignoreSpeedDown:
        return ignore_speed_down();
      case SkillActionType.copyAtk:
        return copy_atk();
      case SkillActionType.environment:
        return environment();
      case SkillActionType.guard:
        return guard();
      case SkillActionType.sumCritical:
        return sum_critical();
      case SkillActionType.dotUp:
        return dot_up();
      case SkillActionType.sealCount:
        return seal_count();
      case SkillActionType.persistent:
        return persistent();
      case SkillActionType.magicChange:
        return magic_change();
      case SkillActionType.magicChangeReduceDamage:
        return magic_change_reduce_damage();
      case SkillActionType.transferDamage:
        return transfer_damage();
      case SkillActionType.cannotSelected:
        return cannot_selected();
      case SkillActionType.buffDot:
        return buff_dot();
      case SkillActionType.damageToDot:
        return damage2dot();
      case SkillActionType.changeDefMax:
        return change_def_max();
      case SkillActionType.unknown:
        // TODO: Handle this case.
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
    final ignoreDef =
        (action.actionValue7 > 0 ||
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
    tag =
        ({
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
    tag =
        ({
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
    final dotIncrease =
        action.actionDetail1 == 5
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
      tag =
          {0: t.skill_charm_0, 1: t.skill_charm_1}[action.actionDetail1] ??
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
    final desc =
        {
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
    final effect =
        {
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
}
