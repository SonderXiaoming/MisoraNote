import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/features/component/skill/skill_text.dart';
import 'package:misora_note/features/component/skill/skill_type.dart';
import 'package:misora_note/l10n/app_localizations_zh.dart';

void main() {
  final localizations = AppLocalizationsZh();

  group('latest skill action descriptions', () {
    test('recognizes damage change and seal consume actions', () {
      expect(SkillActionType.getByType(132), SkillActionType.damageChange);
      expect(SkillActionType.getByType(133), SkillActionType.sealConsume);
    });

    test('describes combined barrier behavior', () {
      final handler = ActionHandler(localizations);
      expect(handler.getBarrierType(7), contains('无效和吸收物理伤害'));
      expect(handler.getBarrierType(8), contains('无效和吸收魔法伤害'));
    });

    test('includes received-damage TP behavior in damage text', () {
      final handler = ActionHandler(localizations);
      final description = handler.formatDesc(
        _action(
          actionType: SkillActionType.damage.value,
          actionDetail1: 1,
          actionDetail3: 100,
          actionValue1: 100,
        ),
        _skill(),
        1,
        0,
      );

      expect(description, contains('受击时不回复 TP'));
    });

    test('formats action 132 damage change', () {
      final handler = ActionHandler(localizations);
      final description = handler.formatDesc(
        _action(
          actionType: SkillActionType.damageChange.value,
          actionDetail1: 1,
          actionValue1: 20,
          actionValue4: 8,
        ),
        _skill(),
        1,
        0,
      );

      expect(description, contains('造成的伤害增加'));
      expect(description, contains('20.0%'));
      expect(description, contains('8'));
    });
  });
}

SkillActionInfo _action({
  required int actionType,
  int actionDetail1 = 0,
  int actionDetail2 = 0,
  int actionDetail3 = 0,
  double actionValue1 = 0,
  double actionValue2 = 0,
  double actionValue3 = 0,
  double actionValue4 = 0,
  double actionValue5 = 0,
  double actionValue6 = 0,
  double actionValue7 = 0,
}) {
  return SkillActionInfo(
    actionId: 1001,
    classId: 0,
    actionType: actionType,
    actionDetail1: actionDetail1,
    actionDetail2: actionDetail2,
    actionDetail3: actionDetail3,
    actionValue1: actionValue1,
    actionValue2: actionValue2,
    actionValue3: actionValue3,
    actionValue4: actionValue4,
    actionValue5: actionValue5,
    actionValue6: actionValue6,
    actionValue7: actionValue7,
    targetAssignment: 0,
    targetArea: 0,
    targetRange: 0,
    targetType: 0,
    targetNumber: 0,
    targetCount: 1,
    description: null,
    levelUpDisp: null,
    ailmentName: '',
    isRfSkill: false,
    isOtherRfSkill: false,
  );
}

SkillDataData _skill() {
  return const SkillDataData(
    skillId: 1,
    name: '',
    skillType: 1,
    skillAreaWidth: 0,
    skillCastTime: 0,
    action1: 1001,
    action2: 0,
    action3: 0,
    action4: 0,
    action5: 0,
    action6: 0,
    action7: 0,
    action8: 0,
    action9: 0,
    action10: 0,
    actionDepend1: 0,
    actionDepend2: 0,
    actionDepend3: 0,
    actionDepend4: 0,
    actionDepend5: 0,
    actionDepend6: 0,
    actionDepend7: 0,
    actionDepend8: 0,
    actionDepend9: 0,
    actionDepend10: 0,
  );
}
