// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get unknown => '?';

  @override
  String get none => '';

  @override
  String date_m_d(String arg1, String arg2) {
    return '$arg1 月 $arg2 日';
  }

  @override
  String get app_name => '美空笔记';

  @override
  String get home_page => '首页';

  @override
  String get function_page => '功能';

  @override
  String get settings_page => '设置';

  @override
  String get about_page => '关于';

  @override
  String get restore => '恢复';

  @override
  String get restore_settings => '恢复默认设置';

  @override
  String get restore_settings_success => '已恢复默认设置';

  @override
  String skill_cooltime(String arg1) {
    return '冷却时间：$arg1秒';
  }

  @override
  String skill_cast_time(String arg1) {
    return '准备时间：$arg1秒';
  }

  @override
  String cast_time(String arg1) {
    return '$arg1秒';
  }

  @override
  String skill_level(int arg1) {
    return '技能等级：$arg1';
  }

  @override
  String get normal_attack => '普攻';

  @override
  String get union_burst => '连结爆发';

  @override
  String skill_index(int arg1) {
    return '技能$arg1';
  }

  @override
  String ex_skill_index(String arg1) {
    return '额外技能$arg1';
  }

  @override
  String get skill_loop_start => '循环开始';

  @override
  String get skill_loop_end => '循环结束';

  @override
  String get attack_pattern => '攻击模式';

  @override
  String get skill_loop => '技能循环';

  @override
  String get skill_info => '技能信息';

  @override
  String get summon_unit => '召唤物';

  @override
  String get sp_skill => 'SP技能';

  @override
  String get type_normal => '常驻';

  @override
  String get type_limit => '限定';

  @override
  String get type_event_limit => '活动';

  @override
  String get type_extra_character => '额外';

  @override
  String get magic => '魔法';

  @override
  String get physical => '物理';

  @override
  String get position => '位置';

  @override
  String get position_front => '前卫';

  @override
  String get position_middle => '中卫';

  @override
  String get position_back => '后卫';

  @override
  String get last_update => '最后更新';

  @override
  String get age => '年龄';

  @override
  String get height => '身高';

  @override
  String get weight => '体重';

  @override
  String get unit_id => '角色ID';

  @override
  String get birthday => '生日';

  @override
  String get search_area_width => '位置';

  @override
  String get character => '角色';

  @override
  String clan_battle_y_m(String arg1, String arg2) {
    return '$arg1 年 $arg2 月';
  }

  @override
  String get tool_unique_equip => '专武';

  @override
  String get character_detail => '角色详情';

  @override
  String get no_description => '暂无描述';

  @override
  String get attack_type => '类型';

  @override
  String get no_search_result => '无搜索结果';

  @override
  String get searching => '搜索中';

  @override
  String get search_hit_name => '请输入角色名';

  @override
  String get search_hit_id => '请输入角色ID';

  @override
  String get app_settings => '应用设置';

  @override
  String get language => '语言';

  @override
  String get database_settings => '数据库设置';

  @override
  String get database_area => '数据库区域';

  @override
  String get cn_server => '国服';

  @override
  String get tw_server => '台服';

  @override
  String get jp_server => '日服';

  @override
  String get version => '版本';

  @override
  String get database_last_update => '数据库最后更新';

  @override
  String get check_update => '检查更新';

  @override
  String get checking_update_failed => '检查更新失败';

  @override
  String get latest_version => '已是最新版本';

  @override
  String find_new_version(String arg1) {
    return '发现新版本：$arg1';
  }

  @override
  String get can_not_launch_url => '无法打开链接';

  @override
  String get new_version_log => '更新日志';

  @override
  String get force_update => '强制更新';

  @override
  String get auto_check_update => '自动检查更新';

  @override
  String get database_missing => '数据库文件缺失';

  @override
  String get database_missing_hit => '检测到数据库文件不存在，需要下载数据库文件才能正常使用应用。';

  @override
  String get download => '下载';

  @override
  String get database_broken => '数据库文件损坏';

  @override
  String get database_broken_hit => '检测到数据库文件损坏，需要重新下载数据库文件才能正常使用应用。';

  @override
  String get database_updating => '正在更新数据库';

  @override
  String get database_update_success => '数据库更新成功';

  @override
  String get database_update_fail => '数据库更新失败:';

  @override
  String get download_failed => '下载失败';

  @override
  String get database_update => '数据库更新';

  @override
  String database_current_version(String arg1) {
    return '当前数据库版本：$arg1';
  }

  @override
  String database_new_version(String arg1) {
    return '最新数据库版本：$arg1';
  }

  @override
  String get database_update_hint => '检测到有新的数据库版本可用，建议更新以获取最新数据。';

  @override
  String get already_latest_version => '当前已是最新版本';

  @override
  String get database_version_fetch_failed => '无法获取最新数据库版本';

  @override
  String database_server(String arg1) {
    return '服务器: $arg1';
  }

  @override
  String get close => '关闭';

  @override
  String get talent => '天赋';

  @override
  String get app_check_auto_update => '应用检查自动更新';

  @override
  String get enemy_character => '敌方角色';

  @override
  String get no_data_error => '未找到单位数据';

  @override
  String get talent_fire => '火';

  @override
  String get talent_water => '水';

  @override
  String get talent_wind => '风';

  @override
  String get talent_light => '光';

  @override
  String get talent_dark => '暗';

  @override
  String get skill_type_1 => '伤害';

  @override
  String get skill_type_2 => '位移';

  @override
  String get skill_type_4_5 => '治疗';

  @override
  String get skill_type_6 => '护盾';

  @override
  String get skill_type_12 => '黑暗';

  @override
  String get skill_type_13 => '沉默';

  @override
  String get skill_type_14 => '模式变更';

  @override
  String get skill_type_15 => '召唤';

  @override
  String get skill_type_16_92 => 'TP';

  @override
  String get skill_type_17 => '条件';

  @override
  String get skill_type_18_19 => '蓄力';

  @override
  String get skill_type_20 => '挑衅';

  @override
  String get skill_type_21 => '回避';

  @override
  String get skill_type_22 => '循环变更';

  @override
  String get skill_type_24 => '复活';

  @override
  String get skill_type_30 => '即死';

  @override
  String get skill_type_32 => 'HP吸收';

  @override
  String get skill_type_33 => '反伤';

  @override
  String get skill_type_34 => '伤害递增';

  @override
  String get skill_type_35_43_60_77 => '标记';

  @override
  String get skill_type_36_37_38_39_40 => '领域';

  @override
  String get skill_type_42 => '触发';

  @override
  String get skill_type_44 => '进场';

  @override
  String get skill_type_46 => '比例伤害';

  @override
  String get skill_type_48 => '持续回复';

  @override
  String get skill_type_49 => '移除';

  @override
  String get skill_type_50 => '持续动作';

  @override
  String get skill_type_54 => '潜伏';

  @override
  String get skill_type_56 => '千里眼';

  @override
  String get skill_type_57 => '延时';

  @override
  String get skill_type_58 => '解除领域';

  @override
  String get skill_type_59 => '回复妨碍';

  @override
  String get skill_type_61 => '恐慌';

  @override
  String get skill_type_62 => '畏惧';

  @override
  String get skill_type_63 => '持续效果';

  @override
  String get skill_type_69 => '变身';

  @override
  String get skill_type_70 => 'HP变化';

  @override
  String get skill_type_71 => '免死';

  @override
  String get skill_type_72 => '减伤';

  @override
  String get skill_type_73 => '伤害护盾';

  @override
  String get skill_type_75 => '次数触发';

  @override
  String get skill_type_76 => 'HP回复量';

  @override
  String get skill_type_78 => '被击伤害';

  @override
  String get skill_type_79 => '行动伤害';

  @override
  String get skill_type_81 => '无效目标';

  @override
  String get skill_type_90 => '被动';

  @override
  String get skill_type_901_902 => '装备';

  @override
  String get skill_type_95 => '隐匿';

  @override
  String get skill_type_100 => '免疫';

  @override
  String get skill_type_105 => '环境';

  @override
  String get skill_type_106 => '守护';

  @override
  String get skill_type_110 => '持续伤害易伤';

  @override
  String get skill_action_type_116 => '执着';

  @override
  String get skill_action_type_121 => '幻化';

  @override
  String get skill_action_type_123 => '减伤';

  @override
  String get skill_action_type_124 => '转移伤害';

  @override
  String get skill_action_type_125 => '无法选中';

  @override
  String get skill_action_type_128 => '持续伤害增强';

  @override
  String get skill_action_type_129 => '伤害转化';

  @override
  String get skill_action_type_130 => '调和';

  @override
  String get skill_status_100 => '无法行动';

  @override
  String get skill_status_101 => '加速状态';

  @override
  String get skill_status_200 => '失明';

  @override
  String get skill_status_300 => '魅惑状态';

  @override
  String get skill_status_400 => '挑衅状态';

  @override
  String get skill_status_500 => '烧伤状态';

  @override
  String get skill_status_501 => '诅咒状态';

  @override
  String get skill_status_502 => '中毒状态';

  @override
  String get skill_status_503 => '猛毒状态';

  @override
  String get skill_status_504 => '咒术状态';

  @override
  String get skill_status_511 => '诅咒或咒术状态';

  @override
  String get skill_status_512 => '中毒或猛毒状态';

  @override
  String get skill_status_710 => 'BREAK 状态';

  @override
  String get skill_status_900 => 'HP 全满状态';

  @override
  String get skill_status_1400 => '变身状态';

  @override
  String get skill_status_1600 => '恐慌状态';

  @override
  String get skill_status_1601 => '隐匿状态';

  @override
  String get skill_status_1700_21 => '物理防御减少状态';

  @override
  String get skill_status_1700_41 => '魔法防御减少状态';

  @override
  String get skill_status_721 => '特殊标记状态';

  @override
  String get skill_status_6107 => '龙之眼状态';

  @override
  String get skill_status_1800 => '多目标状态';

  @override
  String get skill_status_1900 => '护盾展开';

  @override
  String get skill_status_3137 => '界雷';

  @override
  String get skill_status_3162 => '妨魔塵';

  @override
  String get skill_status_3175 => '绝冰';

  @override
  String get skill_status_3207 => '忌火';

  @override
  String get skill_status_6160 => '黏着状态';

  @override
  String get skill_status_physical_atk => '物理攻击';

  @override
  String get skill_status_magic_atk => '魔法攻击';

  @override
  String get skill_area_exclude_summon => '召唤物、分身除外';

  @override
  String get skill_target_none => '目标';

  @override
  String get skill_target_2_8 => '随机';

  @override
  String get skill_target_3 => '最近';

  @override
  String get skill_target_4 => '最远';

  @override
  String get skill_target_5_25 => 'HP最低';

  @override
  String get skill_target_6_26 => 'HP最高';

  @override
  String get skill_target_7 => '自身';

  @override
  String get skill_target_9 => '最后方';

  @override
  String get skill_target_10 => '最前方';

  @override
  String get skill_target_11 => '范围内';

  @override
  String get skill_target_12_27_37 => 'TP最高';

  @override
  String get skill_target_13_19_28 => 'TP最低';

  @override
  String get skill_target_14_29 => '物理攻击力最高';

  @override
  String get skill_target_15_30 => '物理攻击力最低';

  @override
  String get skill_target_16_31 => '魔法攻击力最高';

  @override
  String get skill_target_17_32 => '魔法攻击力最低';

  @override
  String get skill_target_18 => '召唤物';

  @override
  String get skill_target_20 => '物理';

  @override
  String get skill_target_21 => '魔法';

  @override
  String get skill_target_22 => '随机召唤物';

  @override
  String get skill_target_23 => '自身召唤物';

  @override
  String get skill_target_24 => '领主';

  @override
  String get skill_target_33 => '暗影';

  @override
  String get skill_target_34 => '除自身以外';

  @override
  String get skill_target_35 => '剩余HP最高';

  @override
  String get skill_target_36 => '剩余HP最低';

  @override
  String get skill_target_38 => '攻击力最高';

  @override
  String get skill_target_39 => '攻击力最低';

  @override
  String get skill_target_42 => '多目标';

  @override
  String get skill_target_43 => '物理攻击力最高(自身除外)';

  @override
  String get skill_target_44 => '剩余HP最低(自身除外)';

  @override
  String get skill_target_45 => '物理防御力最低';

  @override
  String get skill_target_46 => '魔法防御力最低';

  @override
  String get skill_target_50 => '魔法攻击力最高(自身除外)';

  @override
  String get skill_target_13xxx => '被标记';

  @override
  String get skill_target_fire => '火天赋';

  @override
  String get skill_target_water => '水天赋';

  @override
  String get skill_target_wind => '风天赋';

  @override
  String get skill_target_light => '光天赋';

  @override
  String get skill_target_dark => '暗天赋';

  @override
  String get skill_target_assignment_0 => '自身';

  @override
  String get skill_target_assignment_1 => '敌人';

  @override
  String get skill_target_assignment_2 => '己方';

  @override
  String get skill_target_assignment_3 => '敌人和己方';

  @override
  String get skill_shield_no_effect => '无效';

  @override
  String get skill_shield_defense => '吸收';

  @override
  String skill_shield(String arg1, String arg2) {
    return '$arg1$arg2伤害的护盾';
  }

  @override
  String get skill_action => '动作';

  @override
  String skill_action_d(int arg1) {
    return '动作($arg1)';
  }

  @override
  String skill_effect_time(String arg1) {
    return '，持续 $arg1 秒';
  }

  @override
  String get skill_all => '所有';

  @override
  String get skill_level_text => '技能等级';

  @override
  String get skill_atk_text => '攻击力';

  @override
  String get skill_speed => '速度';

  @override
  String get skill_hp_max => 'HP最大值';

  @override
  String get skill_increase => '提升';

  @override
  String get skill_reduce => '减少';

  @override
  String get skill_fixed => '(固定数值，无法被其他技能效果改变)';

  @override
  String get skill_physical_critical_damage => '物理暴击伤害';

  @override
  String get skill_magic_critical_damage => '魔法暴击伤害';

  @override
  String get skill_critical_damage_take => '受到的暴击伤害';

  @override
  String get skill_physical_damage_take => '受到的物理伤害';

  @override
  String get skill_magic_damage_take => '受到的魔法伤害';

  @override
  String get skill_physical_damage => '造成的物理伤害';

  @override
  String get skill_magic_damage => '造成的魔法伤害';

  @override
  String skill_depend_action(int arg1) {
    return '受到动作($arg1)影响的';
  }

  @override
  String skill_range(int arg1) {
    return '范围$arg1内';
  }

  @override
  String get skill_target_single => '单体';

  @override
  String skill_target_count(int arg1) {
    return '$arg1名';
  }

  @override
  String get skill_target_all => '全体';

  @override
  String skill_target_order_num(String arg1) {
    return '第$arg1近';
  }

  @override
  String get skill_target_order_1 => '最近';

  @override
  String get skill_physical => '物理';

  @override
  String get skill_physical_str => '物理攻击力';

  @override
  String get skill_physical_def => '物理防御力';

  @override
  String get skill_magic => '魔法';

  @override
  String get skill_magic_str => '魔法攻击力';

  @override
  String get skill_magic_def => '魔法防御力';

  @override
  String get skill_must_hit_physical => '必定命中的物理';

  @override
  String get skill_must_hit_magic => '必定命中的魔法';

  @override
  String get skill_sum_atk_physical => '(物理、魔法攻击力合计)物理';

  @override
  String get skill_sum_atk_magic => '(物理、魔法攻击力合计)魔法';

  @override
  String get skill_adaptive_lower_defense => '(适应物理/魔法防御中较低的防御)';

  @override
  String skill_critical_damage_multiple(String arg1) {
    return '；暴击时，造成$arg1 倍伤害';
  }

  @override
  String get skill_must_critical => '；必定暴击';

  @override
  String skill_ignore_def(String arg1) {
    return '；无视目标$arg1防御力 ';
  }

  @override
  String skill_action_type_desc_1(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    String arg5,
    String arg6,
    String arg7,
  ) {
    return '对$arg1造成 $arg2 的$arg3伤害$arg4$arg5$arg6$arg7';
  }

  @override
  String get skill_forward => '向前';

  @override
  String get skill_backward => '向后';

  @override
  String get skill_ahead => '前方';

  @override
  String get skill_rear => '后方';

  @override
  String skill_move(String arg1, String arg2, int arg3) {
    return '移动至$arg1$arg2 [$arg3]';
  }

  @override
  String get skill_return => '，动作结束后回到原来位置';

  @override
  String skill_move_speed(int arg1) {
    return '，移动速度 [$arg1]';
  }

  @override
  String get skill_hit_up => '击飞';

  @override
  String skill_action_type_desc_3_up(String arg1, String arg2, int arg3) {
    return '$arg1$arg2，高度 [$arg3]';
  }

  @override
  String get skill_push => '击退';

  @override
  String get skill_pull => '拉近';

  @override
  String skill_action_type_desc_3_move(String arg1, String arg2, int arg3) {
    return '$arg1$arg2，距离 [$arg3]';
  }

  @override
  String skill_action_type_desc_3_pull(String arg1, String arg2, int arg3) {
    return '将$arg1$arg2身前 [$arg3]';
  }

  @override
  String skill_action_type_desc_4(String arg1, String arg2) {
    return '使${arg1}HP回复 $arg2';
  }

  @override
  String skill_action_type_desc_6(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  ) {
    return '对$arg1展开$arg2 $arg3$arg4';
  }

  @override
  String skill_action_type_desc_7(String arg1) {
    return '锁定$arg1';
  }

  @override
  String skill_action_speed_change(String arg1, String arg2) {
    return '速度额外$arg1初始值的 $arg2 倍';
  }

  @override
  String skill_action_speed_multiple(String arg1) {
    return '速度变更为初始值的 $arg1 倍';
  }

  @override
  String skill_action_type_desc_8(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  ) {
    return '使$arg1进入$arg2状态$arg3$arg4';
  }

  @override
  String get skill_action_hit_remove => '，本效果将会在受到伤害时解除';

  @override
  String skill_action_dot_increase(int arg1) {
    return '，伤害每秒增加基础数值的 [$arg1%]';
  }

  @override
  String skill_action_type_desc_9(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    String arg5,
  ) {
    return '使$arg1进入 [$arg2] 状态，每秒造成伤害 $arg3$arg4$arg5';
  }

  @override
  String get skill_buff => '增益';

  @override
  String get skill_debuff => '减益';

  @override
  String get skill_barrier => '护盾';

  @override
  String get skill_damage => '伤害';

  @override
  String get skill_status_down => '状态下降';

  @override
  String get skill_status_ub => '己方使用连结爆发技能';

  @override
  String skill_action_type_desc_10_break(String arg1, String arg2) {
    return 'BREAK 期间，$arg1$arg2';
  }

  @override
  String get skill_charm_0 => '魅惑';

  @override
  String get skill_charm_1 => '混乱';

  @override
  String skill_action_type_desc_12_13(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  ) {
    return '以 $arg1 的概率使$arg2进入$arg3状态$arg4';
  }

  @override
  String skill_action_atk_miss(int arg1) {
    return '；对象进行物理攻击时有 [$arg1%] 的概率被回避';
  }

  @override
  String skill_action_loop_change(String arg1) {
    return '技能循环改变$arg1';
  }

  @override
  String skill_action_change_mode(String arg1, String arg2) {
    return '行动模式改变$arg1$arg2';
  }

  @override
  String get skill_action_change_to_flight_status => '，进入 [飞行] 状态';

  @override
  String skill_action_type_desc_14_2(int arg1) {
    return '行动模式改变，每秒降低 [$arg1] TP';
  }

  @override
  String get skill_action_type_desc_14_3 => '效果结束后，切换回原行动模式';

  @override
  String skill_action_type_desc_15(
    String arg1,
    String arg2,
    int arg3,
    String arg4,
  ) {
    return '在$arg1$arg2 [$arg3] 的位置$arg4';
  }

  @override
  String skill_action_summon_target(String arg1, String arg2) {
    return '在$arg1$arg2';
  }

  @override
  String get skill_action_summon_unit => '，召唤友方单位';

  @override
  String get skill_action_tp_recovery => 'TP回复';

  @override
  String get skill_action_tp_reduce => 'TP减少';

  @override
  String skill_action_condition(String arg1) {
    return '条件：$arg1';
  }

  @override
  String skill_action_type_desc_17_2(int arg1) {
    return '受到伤害时 [$arg1%] 概率';
  }

  @override
  String skill_action_type_desc_17_3(int arg1) {
    return 'HP [$arg1%] 以下';
  }

  @override
  String skill_action_type_desc_17_4(int arg1) {
    return '死亡时 [$arg1%] 概率';
  }

  @override
  String skill_action_type_desc_17_5(int arg1) {
    return '暴击时 [$arg1%] 概率';
  }

  @override
  String skill_action_type_desc_17_7(int arg1) {
    return '战斗剩余时间 [$arg1] 秒以下';
  }

  @override
  String skill_action_type_desc_17_8(int arg1) {
    return '隐身时 [$arg1%] 概率';
  }

  @override
  String skill_action_type_desc_17_9(int arg1, String arg2) {
    return 'BREAK 时 [$arg1%] 的概率$arg2';
  }

  @override
  String skill_action_type_desc_17_10(int arg1) {
    return '受到持续伤害时 [$arg1%] 概率';
  }

  @override
  String get skill_action_type_desc_17_11 => '所有部位 BREAK';

  @override
  String skill_action_type_desc_17_13(int arg1) {
    return 'HP减少 [$arg1] 时';
  }

  @override
  String skill_action_type_desc_17_17(int arg1) {
    return '被击时 [$arg1%] 概率触发';
  }

  @override
  String skill_action_type_desc_18_19(String arg1) {
    return '蓄力 [$arg1] 秒';
  }

  @override
  String skill_action_type_desc_18_19_detail(int arg1, String arg2) {
    return '，动作($arg1)效果增加 $arg2 * 蓄力中受到的伤害';
  }

  @override
  String skill_action_type_desc_20(String arg1, String arg2, String arg3) {
    return '使$arg1进入$arg2状态$arg3';
  }

  @override
  String get skill_action_type_desc_21_1 => '无敌';

  @override
  String get skill_action_type_desc_21_2 => '回避物理攻击';

  @override
  String get skill_action_type_desc_21_3 => '回避所有攻击';

  @override
  String get skill_action_type_desc_21_6 => '回避 BREAK';

  @override
  String get skill_action_type_desc_21_8 => '回避魔法攻击';

  @override
  String skill_action_skill_anim_change(String arg1) {
    return '技能动画改变$arg1';
  }

  @override
  String skill_action_if_status(String arg1, String arg2, int arg3) {
    return '当$arg1在 [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_if_status_not(String arg1, String arg2, int arg3) {
    return '当$arg1不在 [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_if_mark(String arg1, int arg2) {
    return '$arg1持有标记时，使用动作($arg2)';
  }

  @override
  String skill_action_if_mark_not(String arg1, int arg2) {
    return '$arg1未持有标记时，使用动作($arg2)';
  }

  @override
  String skill_action_if_mark_count(String arg1, int arg2, int arg3) {
    return '$arg1持有标记数量为 [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_if_mark_count_not(String arg1, int arg2, int arg3) {
    return '$arg1持有标记数量不为 [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_if_alone(String arg1, int arg2) {
    return '$arg1仅剩一名时，使用动作($arg2)';
  }

  @override
  String skill_action_if_alone_not(String arg1, int arg2) {
    return '$arg1多于一名时，使用动作($arg2)';
  }

  @override
  String skill_action_if_hp_below(String arg1, int arg2, int arg3) {
    return '$arg1的HP在 [$arg2%] 以下时，使用动作($arg3)';
  }

  @override
  String skill_action_if_hp_above(String arg1, int arg2, int arg3) {
    return '$arg1的HP在 [$arg2%] 以上时，使用动作($arg3)';
  }

  @override
  String skill_action_if_unit_atk_type(String arg1, String arg2, int arg3) {
    return '$arg1是 [$arg2] 对象时，使用动作($arg3)';
  }

  @override
  String skill_action_random_1(int arg1, int arg2, int arg3) {
    return '随机：[$arg1%] 的概率使用动作($arg2)，否则使用动作($arg3)';
  }

  @override
  String skill_action_random_2(int arg1, int arg2) {
    return '随机：[$arg1%] 的概率使用动作($arg2)';
  }

  @override
  String skill_action_type_desc_24(String arg1, int arg2) {
    return '复活$arg1，并回复其 [$arg2%] HP';
  }

  @override
  String get skill_action_type_desc_additive => '增加';

  @override
  String get skill_action_type_desc_subtract => '减少';

  @override
  String get skill_action_type_desc_multiple => '乘以';

  @override
  String get skill_action_type_desc_divide => '除以';

  @override
  String skill_action_change_coe(int arg1, int arg2, String arg3, String arg4) {
    return '动作($arg1)的数值{$arg2}$arg3 $arg4';
  }

  @override
  String skill_action_limit(String arg1) {
    return '；叠加上限 $arg1';
  }

  @override
  String skill_action_limit_int(int arg1) {
    return '；叠加上限 [$arg1]';
  }

  @override
  String skill_action_damage_limit_int(int arg1) {
    return '；伤害上限 [$arg1]';
  }

  @override
  String skill_action_change_coe_0(String arg1) {
    return '$arg1 * [剩余的HP]';
  }

  @override
  String skill_action_change_coe_1(String arg1) {
    return '$arg1 * [损失的HP]';
  }

  @override
  String skill_action_change_coe_2(String arg1) {
    return '$arg1 * [击杀数量]';
  }

  @override
  String skill_action_change_coe_4(String arg1, String arg2) {
    return '$arg1 * [$arg2数量]';
  }

  @override
  String skill_action_change_coe_5(String arg1) {
    return '$arg1 * [受到伤害的目标数量]';
  }

  @override
  String skill_action_change_coe_6(String arg1) {
    return '$arg1 * [造成的伤害]';
  }

  @override
  String skill_action_change_coe_7_10(String arg1, String arg2, String arg3) {
    return '$arg1 * [$arg2的$arg3]';
  }

  @override
  String skill_action_change_coe_12(String arg1, String arg2) {
    return '$arg1 * [后方$arg2数量]';
  }

  @override
  String skill_action_change_coe_13(String arg1) {
    return '$arg1 * [损失的HP比例]';
  }

  @override
  String skill_action_change_coe_15(String arg1, String arg2) {
    return '$arg1 * [$arg2剩余HP]';
  }

  @override
  String skill_action_change_coe_16(String arg1, String arg2) {
    return '$arg1 * [$arg2消耗的TP]';
  }

  @override
  String skill_action_change_coe_102(String arg1) {
    return '$arg1 * [小眼球数量]';
  }

  @override
  String skill_action_change_coe_skill_count(String arg1) {
    return '$arg1 * [技能计数]';
  }

  @override
  String skill_action_change_coe_mark_count(String arg1) {
    return '$arg1 * [标记层数]';
  }

  @override
  String skill_action_sp_if_rate(int arg1, int arg2) {
    return '以 [$arg1%] 的概率使用动作($arg2)';
  }

  @override
  String skill_action_sp_if_dot(String arg1, int arg2) {
    return '$arg1身上有持续伤害时，使用动作($arg2)';
  }

  @override
  String skill_action_sp_if_dot_not(String arg1, int arg2) {
    return '$arg1身上没有持续伤害时，使用动作($arg2)';
  }

  @override
  String skill_action_sp_if_skill_count(String arg1, int arg2, int arg3) {
    return '$arg1的技能计数 ≥ [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_sp_if_skill_count_not(String arg1, int arg2, int arg3) {
    return '$arg1的技能计数 ﹤ [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_sp_if_mark_count(String arg1, int arg2, int arg3) {
    return '$arg1的标记层数 ≥ [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_sp_if_mark_count_not(String arg1, int arg2, int arg3) {
    return '$arg1的标记层数 ﹤ [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_sp_if_unit_count(String arg1, int arg2, int arg3) {
    return '隐身状态的单位除外，$arg1的数量是 [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_sp_if_unit_count_not(String arg1, int arg2, int arg3) {
    return '隐身状态的单位除外，$arg1的数量不是 [$arg2] 时，使用动作($arg3)';
  }

  @override
  String skill_action_sp_if_unit_exist(String arg1, int arg2) {
    return '$arg1中存在单位时，使用动作($arg2)';
  }

  @override
  String skill_action_sp_if_unit_exist_not(String arg1, int arg2) {
    return '$arg1中不存在单位时，使用动作($arg2)';
  }

  @override
  String skill_action_sp_if_kill(int arg1) {
    return '上一个动作击杀了单位时，使用动作($arg1)';
  }

  @override
  String skill_action_sp_if_kill_not(int arg1) {
    return '上一个动作未击杀单位时，使用动作($arg1)';
  }

  @override
  String skill_action_sp_if_critical(int arg1) {
    return '技能暴击时，使用动作($arg1)';
  }

  @override
  String skill_action_sp_if_critical_not(int arg1) {
    return '技能未暴击时，使用动作($arg1)';
  }

  @override
  String get skill_action_type_desc_29 => '无 UB 技能';

  @override
  String skill_action_type_desc_30(String arg1) {
    return '$arg1死亡';
  }

  @override
  String skill_action_type_desc_32(
    String arg1,
    int arg2,
    String arg3,
    String arg4,
  ) {
    return '为$arg1的下 [$arg2] 次攻击附加$arg3 $arg4 的效果';
  }

  @override
  String skill_action_type_desc_33(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    int arg5,
  ) {
    return '$arg1，受到$arg2伤害时反弹 $arg3 伤害$arg4，生效 [$arg5] 次';
  }

  @override
  String get skill_action_type_desc_33_hp => '，并回复HP';

  @override
  String skill_action_type_desc_34(String arg1, String arg2) {
    return '每次攻击当前的目标，将会追加伤害 $arg1$arg2';
  }

  @override
  String skill_action_type_desc_35(
    String arg1,
    int arg2,
    String arg3,
    String arg4,
  ) {
    return '对$arg1追加 [$arg2] 层标记$arg3$arg4';
  }

  @override
  String skill_action_type_desc_35_reduce(String arg1, int arg2) {
    return '$arg1减少 [$arg2] 层标记';
  }

  @override
  String skill_action_type_desc_36_damage(String arg1, String arg2) {
    return '每秒造成 $arg1 $arg2伤害';
  }

  @override
  String skill_action_type_desc_field(String arg2, int arg1, String arg3) {
    return '展开$arg2的领域，范围 [$arg1]$arg3';
  }

  @override
  String skill_action_type_desc_37_heal(String arg1) {
    return '每秒回复 $arg1 HP';
  }

  @override
  String skill_action_type_desc_38_action(int arg1) {
    return '，持续施放动作($arg1)';
  }

  @override
  String skill_action_type_desc_42_2(int arg1, String arg2, int arg3) {
    return '[$arg1] 秒内受到伤害时，以 $arg2 的概率使用动作($arg3)';
  }

  @override
  String skill_action_type_desc_42_14(int arg1, String arg2, String arg3) {
    return '[$arg1] 秒内受到无法行动、击飞、拉近伤害时，以 $arg2 的概率使用$arg3';
  }

  @override
  String skill_action_type_desc_44(int arg1) {
    return '战斗开始 [$arg1] 秒后入场';
  }

  @override
  String skill_action_type_desc_45(String arg1) {
    return '技能计数加 [1] $arg1';
  }

  @override
  String skill_action_type_desc_46_1(String arg1, String arg2) {
    return '对$arg1造成最大HP $arg2 伤害';
  }

  @override
  String skill_action_type_desc_46_2(String arg1, String arg2) {
    return '对$arg1造成剩余HP $arg2 伤害';
  }

  @override
  String skill_action_type_desc_46_3(String arg1, String arg2) {
    return '对$arg1造成初始最大HP $arg2 伤害';
  }

  @override
  String get skill_action_type_desc_47 => '对低等级的玩家造成的伤害将被减轻';

  @override
  String skill_action_type_desc_48(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  ) {
    return '每秒回复$arg1的 $arg2 $arg3$arg4';
  }

  @override
  String skill_action_type_desc_49(String arg1, String arg2, String arg3) {
    return '$arg1 概率移除$arg2的$arg3';
  }

  @override
  String skill_action_type_desc_50(
    String arg1,
    String arg2,
    String arg3,
    int arg4,
  ) {
    return '$arg1$arg2$arg3，受到 [$arg4] 次伤害时中断';
  }

  @override
  String skill_action_type_desc_52(int arg1) {
    return '将模型的宽度变为 [$arg1]';
  }

  @override
  String skill_action_type_desc_53(int arg1, String arg2) {
    return '特定的领域效果存在时使用动作($arg1)$arg2';
  }

  @override
  String skill_action_type_desc_53_2(int arg1) {
    return '，否则使用动作($arg1)';
  }

  @override
  String skill_action_type_desc_54(String arg1) {
    return '进入隐身状态$arg1';
  }

  @override
  String skill_action_type_desc_55(int arg1, int arg2) {
    return '使部位$arg1向前移动 [$arg2] ，随后使其返回原位置';
  }

  @override
  String skill_action_type_desc_56_1(String arg1, String arg2) {
    return '使$arg1的物理攻击必定被回避$arg2';
  }

  @override
  String skill_action_type_desc_56_2(String arg1, String arg2) {
    return '使$arg1的下 $arg2 次物理攻击必定被回避';
  }

  @override
  String skill_action_type_desc_57(String arg1, int arg2, int arg3) {
    return '对$arg1设置倒计时，[$arg2] 秒后触发动作($arg3)';
  }

  @override
  String skill_action_type_desc_58(int arg1, int arg2) {
    return '解除第$arg1个技能的动作($arg2)展开的领域';
  }

  @override
  String skill_action_type_desc_59(String arg1, int arg2, String arg3) {
    return '$arg1，HP回复效果减少 [$arg2%] $arg3';
  }

  @override
  String skill_action_type_desc_60_0(String arg1, String arg2) {
    return '，追加 [1] 层标记$arg1$arg2';
  }

  @override
  String skill_action_type_desc_60_1(String arg1, String arg2) {
    return '自身每次攻击$arg1时$arg2';
  }

  @override
  String skill_action_type_desc_60_2(String arg1, String arg2) {
    return '$arg1每次造成伤害时$arg2';
  }

  @override
  String skill_action_type_desc_60_3(String arg1, String arg2) {
    return '$arg1每次造成暴击时$arg2';
  }

  @override
  String skill_action_type_desc_60_4(String arg1, String arg2) {
    return '$arg1每次攻击命中敌人时$arg2';
  }

  @override
  String skill_action_type_desc_61(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  ) {
    return '以 $arg1 的概率使$arg2进入$arg3状态$arg4';
  }

  @override
  String skill_action_type_desc_62_0(String arg1, String arg2, String arg3) {
    return '$arg1的UB对任意目标造成伤害或直接回复时，使其效果值降低 $arg2$arg3';
  }

  @override
  String skill_action_type_desc_62_1(String arg1, String arg2, String arg3) {
    return '$arg1的UB或技能对任意目标造成伤害或直接回复时，使其效果值降低 $arg2$arg3';
  }

  @override
  String skill_action_type_desc_63_success(int arg1) {
    return '持续时间结束后，使用动作($arg1)；';
  }

  @override
  String skill_action_type_desc_63_failure(int arg1) {
    return '效果被中断后，使用动作($arg1)；';
  }

  @override
  String skill_action_type_desc_63(
    String arg1,
    int arg2,
    String arg3,
    String arg4,
  ) {
    return '每 $arg1 秒使用 1 次动作($arg2)，最长持续 [$arg3] 秒；受到的伤害量超过 [$arg4] 时中断此效果；';
  }

  @override
  String skill_action_type_desc_69(String arg1, String arg2) {
    return '使$arg1变身$arg2';
  }

  @override
  String skill_action_type_desc_71(String arg1, String arg2, String arg3) {
    return '赋予$arg1「受到致死伤害时，回复 $arg2 HP」的效果$arg3';
  }

  @override
  String skill_action_type_desc_72(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  ) {
    return '赋予$arg1承受$arg2伤害减少$arg3的效果$arg4';
  }

  @override
  String skill_action_type_desc_73(String arg1, int arg2, String arg3) {
    return '为$arg1展开护盾，在单个动作中受到的伤害超过 [$arg2] 时，伤害值将衰减$arg3';
  }

  @override
  String skill_action_type_desc_75(int arg1, int arg2, String arg3) {
    return '每造成 [$arg1] 次伤害时，触发动作($arg2) $arg3';
  }

  @override
  String skill_action_type_desc_76(String arg1, String arg2, String arg3) {
    return '$arg1治疗量变为原来的 $arg2$arg3';
  }

  @override
  String skill_action_type_desc_77(
    String arg1,
    String arg2,
    int arg3,
    String arg4,
    String arg5,
  ) {
    return '每当$arg1 [$arg2] 时，为自身追加 [$arg3] 层标记$arg4$arg5';
  }

  @override
  String get skill_action_type_desc_77_1 => '受到';

  @override
  String skill_action_type_desc_78(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    String arg5,
  ) {
    return '使$arg1受到的伤害额外$arg2 $arg3 倍$arg4$arg5';
  }

  @override
  String get skill_action_type_desc_78_1 => '减益和异常状态数量';

  @override
  String skill_action_type_desc_79(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    String arg5,
  ) {
    return '$arg1行动时，受到$arg2 $arg3 伤害$arg4$arg5';
  }

  @override
  String skill_action_type_desc_81(String arg1) {
    return '$arg1变更为无法被攻击的目标';
  }

  @override
  String skill_action_type_desc_90(String arg1, String arg2, String arg3) {
    return '$arg1$arg2提升 $arg3';
  }

  @override
  String get skill_action_type_desc_901 => '战斗开始时生效';

  @override
  String skill_action_type_desc_902(String arg1) {
    return '战斗时间剩余$arg1秒时生效';
  }

  @override
  String skill_action_type_desc_92(String arg1, String arg2) {
    return '使$arg1受击获得的TP变更为初始值的 [$arg2] 倍';
  }

  @override
  String skill_action_type_desc_93(String arg1) {
    return '攻击$arg1时，无视挑衅效果';
  }

  @override
  String skill_action_type_desc_94(String arg1) {
    return '$arg1附加技能特效';
  }

  @override
  String skill_action_type_desc_95(String arg1, String arg2) {
    return '$arg1进入隐匿状态$arg2';
  }

  @override
  String skill_action_type_desc_96_tp(String arg1) {
    return '每秒回复 $arg1 TP';
  }

  @override
  String skill_action_type_desc_97(int arg1) {
    return '；受击时减少 [1] 层标记，TP回复 [$arg1]';
  }

  @override
  String skill_action_type_desc_98(String arg1, String arg2, String arg3) {
    return '使$arg1受到TP降低时，效果变更为初始值的 [$arg2] 倍$arg3';
  }

  @override
  String skill_action_type_desc_100(String arg1, String arg2, String arg3) {
    return '$arg1免疫 [无法行动] 异常状态$arg2$arg3';
  }

  @override
  String skill_action_type_desc_100_count(int arg1) {
    return ' [$arg1] 次';
  }

  @override
  String skill_action_type_desc_101(
    String arg1,
    int arg2,
    String arg3,
    String arg4,
  ) {
    return '$arg1攻击时，对敌人追加 [$arg2] 层标记$arg3$arg4';
  }

  @override
  String skill_action_type_desc_101_reduce(String arg1, int arg2) {
    return '$arg1攻击时，敌人减少 [$arg2] 层标记';
  }

  @override
  String skill_action_type_desc_103(int arg1, String arg2) {
    return '动作($arg1)造成的伤害将依据$arg2的攻击力';
  }

  @override
  String skill_action_type_unknown(
    String arg1,
    String arg2,
    int arg3,
    String arg4,
    String arg5,
  ) {
    return '$arg1目标：$arg2；类型：$arg3；数值：$arg4$arg5';
  }

  @override
  String skill_action_type_desc_105(String arg1, String arg2) {
    return '发动 [$arg1] 环境效果$arg2';
  }

  @override
  String skill_action_type_desc_106(String arg1, String arg2, String arg3) {
    return '赋予$arg1 [$arg2] 状态，并代替其承受伤害$arg3';
  }

  @override
  String get skill_action_type_desc_106_type_common => '守护';

  @override
  String get skill_action_type_desc_106_type_141 => '堕天使的守护';

  @override
  String skill_action_type_desc_107(int arg1) {
    return '动作($arg1)暴击率依据物理暴击与魔法暴击之和';
  }

  @override
  String skill_action_type_desc_110(String arg1, String arg2, String arg3) {
    return '使$arg1受到持续伤害时，额外承受 $arg2 的伤害$arg3';
  }

  @override
  String skill_action_type_desc_111(String arg1, String arg2, int arg3) {
    return '当$arg1$arg2时，使用动作($arg3)';
  }

  @override
  String skill_action_type_desc_111_1(
    String arg1,
    String arg2,
    int arg3,
    int arg4,
  ) {
    return '当$arg1标记数量 $arg2 [$arg3] 时，使用动作($arg4)';
  }

  @override
  String get skill_action_type_desc_111_2 => '受到暴击伤害';

  @override
  String skill_action_type_desc_114(
    String arg1,
    int arg2,
    String arg3,
    int arg4,
    int arg5,
    String arg6,
  ) {
    return '对$arg1追加 [$arg2] 层标记，$arg3，受到伤害时，减少 [1] 层标记，并使用动作($arg4)和动作($arg5)$arg6';
  }

  @override
  String skill_action_type_desc_114_aura(int arg1) {
    return '己方受到的伤害降低 [$arg1%]';
  }

  @override
  String skill_action_type_desc_116_121_123_124(
    String arg1,
    String arg2,
    String arg3,
  ) {
    return '使$arg1进入 [$arg2] 状态$arg3';
  }

  @override
  String skill_action_type_desc_123_1(String arg1) {
    return '受到的伤害减少$arg1';
  }

  @override
  String skill_action_type_desc_125(String arg1, String arg2) {
    return '使$arg1进入 [$arg2] 状态（持有标记时，不会成为攻击目标）';
  }

  @override
  String skill_action_type_desc_128(String arg1, int arg2, String arg3) {
    return '使$arg1受到的持续伤害的间隔和时间延长 [$arg2] 倍$arg3';
  }

  @override
  String skill_action_type_desc_129(String arg1, String arg2, String arg3) {
    return '使$arg1受到的 $arg2 伤害转化为持续伤害$arg3；该持续伤害不回复 TP';
  }

  @override
  String skill_action_type_desc_130(String arg1) {
    return '使$arg1受到伤害时，按物理/魔法防御中较高的防御计算伤害';
  }

  @override
  String get skill_ailment_1 => '减速';

  @override
  String get skill_ailment_2 => '加速';

  @override
  String get skill_ailment_3 => '麻痹';

  @override
  String get skill_ailment_4 => '冻结';

  @override
  String get skill_ailment_5 => '束缚';

  @override
  String get skill_ailment_6 => '睡眠';

  @override
  String get skill_ailment_7_12_14 => '眩晕';

  @override
  String get skill_ailment_8 => '石化';

  @override
  String get skill_ailment_9 => '拘留';

  @override
  String get skill_ailment_10 => '昏迷';

  @override
  String get skill_ailment_11 => '时间停止';

  @override
  String get skill_ailment_13 => '结晶';

  @override
  String get skill_ailment_extra => '(额外)';

  @override
  String get skill_ailment_field => '(范围)';

  @override
  String get skill_dot_0 => '拘留(造成伤害)';

  @override
  String get skill_dot_1_7 => '中毒';

  @override
  String get skill_dot_2 => '烧伤';

  @override
  String get skill_dot_3_8 => '诅咒';

  @override
  String get skill_dot_4 => '猛毒';

  @override
  String get skill_dot_5 => '咒术';

  @override
  String get skill_dot_11 => '绝怠灵度';

  @override
  String get attr_hp => 'HP';

  @override
  String get attr_life_steal => 'HP吸收';

  @override
  String get attr_atk => '物理攻击力';

  @override
  String get attr_magic_str => '魔法攻击力';

  @override
  String get attr_def => '物理防御力';

  @override
  String get attr_magic_def => '魔法防御力';

  @override
  String get attr_physical_critical => '物理暴击';

  @override
  String get attr_magic_critical => '魔法暴击';

  @override
  String get attr_physical_penetrate => '物理穿透';

  @override
  String get attr_magic_penetrate => '魔法穿透';

  @override
  String get attr_accuracy => '命中';

  @override
  String get attr_dodge => '回避';

  @override
  String get attr_wave_hp_recovery => 'HP回复';

  @override
  String get attr_hp_recovery_rate => '回复上升';

  @override
  String get attr_wave_energy_recovery => 'TP回复';

  @override
  String get attr_energy_recovery_rate => 'TP上升';

  @override
  String get attr_energy_reduce_rate => 'TP减少';

  @override
  String get attr_tp => 'TP';
}
