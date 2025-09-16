import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';

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
}
