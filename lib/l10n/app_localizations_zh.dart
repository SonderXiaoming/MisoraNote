// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String date_m_d(String arg1, String arg2) {
    return '$arg1 月 $arg2 日';
  }

  @override
  String get app_name => '美空笔记';

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
  String get sp_skill => 'SP技能';

  @override
  String get search_hit => '请输入角色名/编号';

  @override
  String get type_normal => '常驻';

  @override
  String get type_limit => '限定';

  @override
  String get type_event_limit => '活动';

  @override
  String get type_extra_character => '额外';

  @override
  String get unknown => '?';

  @override
  String get magic => '魔法';

  @override
  String get physical => '物理';

  @override
  String equip_require_level(String arg1) {
    return '需求等级：$arg1';
  }

  @override
  String get equip_name => '装备名';

  @override
  String get favorite_equip => '收藏装备';

  @override
  String get favorite_equip_material => '收藏素材';

  @override
  String get tool_equip => '装备';

  @override
  String get equip_material => '合成素材';

  @override
  String equip_max_select_count(int arg1) {
    return '最多可选 $arg1 个装备';
  }

  @override
  String get equip_search => '开始查询';

  @override
  String get equip_search_mode => '掉落查询';

  @override
  String get tip_equip_search => '请先选择装备';

  @override
  String get picked_equip => '已选择';

  @override
  String get tool_leader => '角色排行';

  @override
  String get leader_score => '角色评分';

  @override
  String get wiki => 'wiki';

  @override
  String get tool_calendar_inprogress => '进行中活动';

  @override
  String get tool_calendar_coming => '活动预告';

  @override
  String get tool_calendar_event => '活动记录';

  @override
  String get tool_website => '收藏夹';

  @override
  String get tool_clan => '公会战';

  @override
  String get tool_clan_no_boss => 'BOSS 信息暂未实装';

  @override
  String get tool_guild => '角色公会';

  @override
  String get character => '角色';

  @override
  String get tool_gacha => '卡池';

  @override
  String get tool_free_gacha => '免费十连';

  @override
  String get tool_birthday => '生日';

  @override
  String get tool_event => '剧情活动';

  @override
  String get tool_news => '公告';

  @override
  String get news_title => '公告标题';

  @override
  String get jjc => '竞技场';

  @override
  String get clan => '公会战';

  @override
  String get tower => '露娜塔';

  @override
  String get sp_dungeon => '特殊地下城';

  @override
  String get tdf => '次元断层';

  @override
  String get colosseum => '斗技场';

  @override
  String get abyss => '深渊讨伐战';

  @override
  String get result => '数值变化';

  @override
  String get character_name => '角色名';

  @override
  String get tweet => '日服情报';

  @override
  String get comic => '漫画';

  @override
  String get comic_4 => '4格漫画';

  @override
  String get comic_toc => '目录';

  @override
  String comic_toc_index(int arg1) {
    return '第$arg1话';
  }

  @override
  String get comic_input_hint => '输入跳转，如：382';

  @override
  String get other => '其他';

  @override
  String get activity_info => '活动日程';

  @override
  String get no_limit => '无限制';

  @override
  String get tip_no_equip_get_area => '暂无掉落区域';

  @override
  String get title_recently_used => '常用';

  @override
  String phase(String arg1) {
    return '$arg1阶段';
  }

  @override
  String get random_area => '额外掉落';

  @override
  String random_drop_area_title(int arg1) {
    return '区域 $arg1';
  }

  @override
  String get random_drop_area_1 => '（前半）';

  @override
  String get random_drop_area_2 => '（后半）';

  @override
  String get qq_group => '反馈交流群';

  @override
  String get to_feedback => '反馈';

  @override
  String get qq_group_summary => '有任何问题或建议，可在群内反馈';

  @override
  String get to_join_qq_group => '加入QQ群';

  @override
  String get clean_image_cache => '清除缓存';

  @override
  String get tip_clean_cache => '加载缓存，可减少网络数据使用。正常使用中请勿清除';

  @override
  String cache_size(String arg1, int arg2) {
    return '占用：$arg1\\n数量：$arg2';
  }

  @override
  String get confirm_clean_cache => '清除缓存后，下次打开应用将通过网络重新加载图片';

  @override
  String get github => 'GitHub';

  @override
  String get afd => '爱发电';

  @override
  String get sponsor => '支持';

  @override
  String get afd_url => 'https://afdian.com/a/wthee';

  @override
  String get tip_afd => '期待你的关注与支持';

  @override
  String get please => '✪ ω ✪';

  @override
  String get github_project_url => 'https://github.com/wthee/pcr-tool';

  @override
  String get tip_github => '项目开源代码';

  @override
  String mode(int arg1) {
    return 'MODE$arg1';
  }

  @override
  String clan_battle_y_m(String arg1, String arg2) {
    return '$arg1 年 $arg2 月';
  }

  @override
  String get update => '更新';

  @override
  String get system => '系统';

  @override
  String get event => '活动';

  @override
  String get shop => '周边';

  @override
  String get local_note => '本地化笔记';

  @override
  String get search_suggestion => '快捷输入';

  @override
  String get search_api => '查询';

  @override
  String get search_api_desc => '需要网络';

  @override
  String get tool_all_quest => '主线地图';

  @override
  String get pick_date => '选择日期';

  @override
  String get picked_date => '已选择';

  @override
  String get beta_tool_group => '测试';

  @override
  String get beta_tool_group_title => '后续将调整至其他分组或移除';

  @override
  String get all_unit_calc_equip => '全角色装备统计';

  @override
  String get to => ' ~ ';

  @override
  String get title_comic_zh => '优妮hnn汉化组';

  @override
  String get tip_comic_zh => '漫画汉化';

  @override
  String get comic_zh_url => 'https://space.bilibili.com/3260075';

  @override
  String get title_jp_info => 'PCR公主连结日服情报站';

  @override
  String get tip_jp_info => '日服最新情报';

  @override
  String get jp_info_url => 'https://space.bilibili.com/1731293061';

  @override
  String get tool_unique_equip => '专用装备';

  @override
  String get search_unique_equip => '装备名/角色名';

  @override
  String get character_detail => '角色详情';

  @override
  String get tool_load_comic => '过场漫画';

  @override
  String get description => '描述';

  @override
  String get pvp_search => '查询';

  @override
  String get pvp_upload => '上传记录';

  @override
  String get pvp_no_data => '未查询到进攻队伍信息';

  @override
  String get research => '重新查询';

  @override
  String get pvp_search_on_web => '去网站查询';

  @override
  String team_no(String arg1) {
    return '进攻队伍 $arg1';
  }

  @override
  String get team_win => '进攻';

  @override
  String get team_lose => '防守';

  @override
  String get tip_select_5 => '请选择 5 名角色';

  @override
  String get tip_selected_5 => '已选择 5 名角色';

  @override
  String get tool_pvp => '竞技场';

  @override
  String get pvp_no_favorites => '暂无收藏';

  @override
  String get pvp_no_history => '暂无查询历史';

  @override
  String get pvp_service => '竞技场查询服务';

  @override
  String get pvp_service_running => '竞技场查询服务正在运行';

  @override
  String get close_app => '关闭应用';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确认';

  @override
  String get to_add_tool => '添加功能';

  @override
  String get edit => '管理功能';

  @override
  String get done => '完成';

  @override
  String get copy_all => '全部复制';

  @override
  String get open_browser => '在浏览器中打开';

  @override
  String copy_qq_group(String arg1) {
    return '已复制QQ群号：$arg1';
  }

  @override
  String get share_to => '分享到：';

  @override
  String release(String arg1) {
    return '$arg1 发布';
  }

  @override
  String get daily_mission => '每日任务体力';

  @override
  String get daily_login => '每日登录宝石奖励，共计';

  @override
  String get fortune_event => '兰德索尔杯';

  @override
  String get normal => '普通关卡';

  @override
  String get hard => '困难关卡';

  @override
  String get very_hard => '高难关卡';

  @override
  String get explore => '探索';

  @override
  String get shrine => '圣迹调查';

  @override
  String get temple => '神殿调查';

  @override
  String get dungeon => '地下城';

  @override
  String get drop => '掉落量';

  @override
  String get mana => '玛那掉落量';

  @override
  String multiple(String arg1) {
    return '$arg1倍';
  }

  @override
  String free_gacha_content(int arg1) {
    return '「免费十连」$arg1 次';
  }

  @override
  String get story_event_sub => '支线';

  @override
  String get story_event_re => '复刻';

  @override
  String get story_event_preview => '预告';

  @override
  String get story_event_new => '活动';

  @override
  String clan_battle_month(int arg1) {
    return '$arg1月公会战';
  }

  @override
  String get title_ex_skill_add => 'EX+ 额外数值';

  @override
  String get title_skill_1_add => '技能+ 额外数值';

  @override
  String get title_skill_1_coe => '技能+ 系数';

  @override
  String get title_ub_add => '连结爆发+ 额外数值';

  @override
  String get title_ub_coe => '连结爆发+ 系数';

  @override
  String attr_all_value(String arg1) {
    return '战力：$arg1';
  }

  @override
  String get title_attr_tip => '属性数值说明';

  @override
  String get attr_calc => '角色属性数值 = 基本属性 + 剧情属性 + 被动技能（不计算到战力） + RANK 奖励属性';

  @override
  String get tip_status_coe => '※ 数值与游戏数值可能存在一定误差，请以游戏内为准';

  @override
  String get no_more => '暂无更多';

  @override
  String get no_data => '暂无数据';

  @override
  String get data_get_error => '数据获取失败';

  @override
  String get not_installed => '暂未实装';

  @override
  String get tip_click_to_add => '点击下列功能，添加至首页';

  @override
  String get tip_save_to_gallery => '保存至系统相册';

  @override
  String get wait_pic_load => '请等待图片加载完成';

  @override
  String get wait_video_load => '请等待视频加载完成';

  @override
  String pic_exist(String arg1) {
    return '图片已存在\\n$arg1';
  }

  @override
  String video_exist(String arg1) {
    return '视频已存在\\n$arg1';
  }

  @override
  String save_success(String arg1) {
    return '已成功保存至系统相册\\n$arg1';
  }

  @override
  String get save_failure => '保存失败';

  @override
  String get save_error => '保存异常';

  @override
  String get download_failure => '下载失败';

  @override
  String get copy_success => '文本已复制';

  @override
  String get title_api_request_error => '网络请求异常';

  @override
  String get title_dialog_delete => '删除';

  @override
  String get title_dialog_save_img => '保存图片';

  @override
  String get title_dialog_clean_cache => '清除缓存';

  @override
  String find_new_release(String arg1) {
    return 'v$arg1 已发布';
  }

  @override
  String get change_failed => '切换失败';

  @override
  String get check_db_error => '数据版本获取失败';

  @override
  String get db_file_error_re_download => '数据文件已损坏\\n请点此[重新下载]数据';

  @override
  String get db_error => '数据异常';

  @override
  String get remote_db_file_error => '远程数据异常\\n请[加群反馈]';

  @override
  String get re_download_db_file => '若数据加载或下载异常\\n请点此[重新下载]数据';

  @override
  String get title_db_downloading => '正在下载数据';

  @override
  String get db_download_cancel => '下载因未知原因中断，请重新下载';

  @override
  String get update_database => '数据更新';

  @override
  String get db_download_failure => '数据下载失败，请重新下载';

  @override
  String get db_download_exception => '数据下载出现异常，请重新下载';

  @override
  String get db_load_failure => '数据加载失败，请重试';

  @override
  String get db_diff_version => '版本';

  @override
  String get db_diff_content => '更新内容';

  @override
  String get db_diff_time => '日期';

  @override
  String get db_diff_content_none => '其他';

  @override
  String get db_cn => '国服';

  @override
  String get db_tw => '台服';

  @override
  String get db_jp => '日服';

  @override
  String get limit_re => '复刻限定';

  @override
  String get limit_re_pick => '复刻自选';

  @override
  String get normal_re => '复刻常驻';

  @override
  String get fes => '公主庆典';

  @override
  String get anv => '周年';

  @override
  String get gacha_fes => 'Fes限定★3';

  @override
  String get gacha_limit => '限定★3';

  @override
  String get gacha_normal => '常驻★3';

  @override
  String get tool_mock_gacha => '抽卡模拟';

  @override
  String get gacha_pick_up_normal => '全角色 UP';

  @override
  String get gacha_pick_up_fes => 'Fes UP';

  @override
  String get gacha_pick_up_single => '单角色 UP';

  @override
  String get tip_to_pick_up => '请选择角色';

  @override
  String get tip_to_pick_up_normal => '所选角色概率相同';

  @override
  String get tip_to_pick_up_single => '仅最后选择的角色概率提升';

  @override
  String get tip_to_mock_single => '单角色 UP：至少选择2名角色';

  @override
  String get tip_no_gacha_record => '暂无抽卡记录';

  @override
  String get reset_record => '重置卡池';

  @override
  String get delete_gacha => '删除卡池';

  @override
  String get tip_delete_gacha => '删除卡池记录和模拟抽卡记录';

  @override
  String get go_to_mock => '去抽卡';

  @override
  String gacha_max_select_count(int arg1) {
    return '最多可选 $arg1 名角色';
  }

  @override
  String last_gacha_date(int arg1, String arg2) {
    return '已抽$arg1次，$arg2';
  }

  @override
  String gacha_used_gem(int arg1) {
    return '宝石 $arg1';
  }

  @override
  String gacha_order(int arg1) {
    return '第 $arg1 次';
  }

  @override
  String get selected_mark => '✓';

  @override
  String get extra_equip_normal => '普通';

  @override
  String get extra_equip_clan => '公会战';

  @override
  String get extra_equip_flag => '适用场景';

  @override
  String get extra_equip_category => '类型';

  @override
  String get extra_equip_passive_skill => '被动技能';

  @override
  String get extra_equip_default_value => '初始';

  @override
  String get extra_equip_max_value => '上限';

  @override
  String get tool_extra_equip => 'EX装备';

  @override
  String extra_equip_rarity_and_type(int arg1, String arg2) {
    return '★$arg1  $arg2';
  }

  @override
  String get extra_equip_rarity => '稀有度';

  @override
  String get extra_equip_unit => '适用角色';

  @override
  String get extra_equip_no_drop_quest => '暂无掉落区域';

  @override
  String get tool_travel => 'EX冒险';

  @override
  String get unit_extra_equip_slot => '适用装备';

  @override
  String get travel_limit_unit_num => '人数上限';

  @override
  String get travel_need_power => '所需战力';

  @override
  String get travel_time => '所需时间';

  @override
  String get travel_time_decrease_limit => '缩减时间';

  @override
  String get ex_equip_drop_odd => '%.2f%';

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
  String character_summon_info(int arg1, int arg2, int arg3) {
    return '等级：$arg1 / RANK：$arg2 / 星级：$arg3';
  }

  @override
  String get normal_attack => '普攻';

  @override
  String get ub_video => '技能动画';

  @override
  String get color_blue => '蓝';

  @override
  String get color_copper => '铜';

  @override
  String get color_silver => '银';

  @override
  String get color_gold => '金';

  @override
  String get color_purple => '紫';

  @override
  String get color_red => '红';

  @override
  String get color_green => '绿';

  @override
  String get color_orange => '橙';

  @override
  String get color_cyan => '青';

  @override
  String get color_pink => '粉';

  @override
  String get no1 => '一';

  @override
  String get no2 => '二';

  @override
  String get no3 => '三';

  @override
  String get no4 => '四';

  @override
  String get no5 => '五';

  @override
  String get no6 => '六';

  @override
  String get no7 => '七';

  @override
  String get none => '';

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
  String skill_action_type_desc_1(String arg1, String arg2, String arg3,
      String arg4, String arg5, String arg6, String arg7) {
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
      String arg1, String arg2, String arg3, String arg4) {
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
      String arg1, String arg2, String arg3, String arg4) {
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
      String arg1, String arg2, String arg3, String arg4, String arg5) {
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
      String arg1, String arg2, String arg3, String arg4) {
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
      String arg1, String arg2, int arg3, String arg4) {
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
      String arg1, int arg2, String arg3, String arg4) {
    return '为$arg1的下 [$arg2] 次攻击附加$arg3 $arg4 的效果';
  }

  @override
  String skill_action_type_desc_33(
      String arg1, String arg2, String arg3, String arg4, int arg5) {
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
      String arg1, int arg2, String arg3, String arg4) {
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
      String arg1, String arg2, String arg3, String arg4) {
    return '每秒回复$arg1的 $arg2 $arg3$arg4';
  }

  @override
  String skill_action_type_desc_49(String arg1, String arg2, String arg3) {
    return '$arg1 概率移除$arg2的$arg3';
  }

  @override
  String skill_action_type_desc_50(
      String arg1, String arg2, String arg3, int arg4) {
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
      String arg1, String arg2, String arg3, String arg4) {
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
      String arg1, int arg2, String arg3, String arg4) {
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
      String arg1, String arg2, String arg3, String arg4) {
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
      String arg1, String arg2, int arg3, String arg4, String arg5) {
    return '每当$arg1 [$arg2] 时，为自身追加 [$arg3] 层标记$arg4$arg5';
  }

  @override
  String get skill_action_type_desc_77_1 => '受到';

  @override
  String skill_action_type_desc_78(
      String arg1, String arg2, String arg3, String arg4, String arg5) {
    return '使$arg1受到的伤害额外$arg2 $arg3 倍$arg4$arg5';
  }

  @override
  String get skill_action_type_desc_78_1 => '减益和异常状态数量';

  @override
  String skill_action_type_desc_79(
      String arg1, String arg2, String arg3, String arg4, String arg5) {
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
      String arg1, int arg2, String arg3, String arg4) {
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
      String arg1, String arg2, int arg3, String arg4, String arg5) {
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
      String arg1, String arg2, int arg3, int arg4) {
    return '当$arg1标记数量 $arg2 [$arg3] 时，使用动作($arg4)';
  }

  @override
  String get skill_action_type_desc_111_2 => '受到暴击伤害';

  @override
  String skill_action_type_desc_114(
      String arg1, int arg2, String arg3, int arg4, int arg5, String arg6) {
    return '对$arg1追加 [$arg2] 层标记，$arg3，受到伤害时，减少 [1] 层标记，并使用动作($arg4)和动作($arg5)$arg6';
  }

  @override
  String skill_action_type_desc_114_aura(int arg1) {
    return '己方受到的伤害降低 [$arg1%]';
  }

  @override
  String skill_action_type_desc_116_121_123_124(
      String arg1, String arg2, String arg3) {
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

  @override
  String day(int arg1) {
    return '$arg1天';
  }

  @override
  String hour(int arg1) {
    return '$arg1时';
  }

  @override
  String minute(int arg1) {
    return '$arg1分';
  }

  @override
  String get response_error => '未正常获取数据，请切换网络后重试';

  @override
  String get response_cancel => '查询取消';

  @override
  String get leader_need_sync => '未关联';

  @override
  String get only_jp => '基于日服版本的评价，仅供参考';

  @override
  String get tool_leader_tier => '角色梯队';

  @override
  String get leader_tier_0 => '综合';

  @override
  String get leader_tier_1 => '竞技场进攻';

  @override
  String get leader_tier_2 => '竞技场防守';

  @override
  String leader_tier_d(String arg1) {
    return 'T$arg1';
  }

  @override
  String get debug_short_text => '测试文本测试文本测试文本';

  @override
  String get debug_long_text => '测试文本测试文本测试文本测试文本，测试文本测试文本测试文本，测试文本测试';

  @override
  String get debug_name => '测试名称（类型）';

  @override
  String get to_zh => '（汉化）';

  @override
  String get download_apk_error => '获取安装包失败，请重试';

  @override
  String get install_apk_error => '安装失败';

  @override
  String get download_apk => '立即更新';

  @override
  String get download_apk_from_github => '从Github更新';

  @override
  String apk_url(String arg1) {
    return 'https://github.com/wthee/pcr-tool/releases/download/v$arg1/app-official-release.apk';
  }

  @override
  String get request_install => '正在请求应用安装权限，开启权限后请重新更新';

  @override
  String get video_play_speed => '倍速:';

  @override
  String get play_error => '播放出错或资源不存在';

  @override
  String get video_resource_error => '资源不存在';

  @override
  String get save_video => '保存视频';

  @override
  String get video_caching => '视频缓存中...';

  @override
  String get saved => '已保存';

  @override
  String get title_download_file => '正在下载';

  @override
  String get download_file_notice => '文件下载通知';

  @override
  String get preview_spine_type => '预览类型';

  @override
  String get preview_spine_battle => '战斗';

  @override
  String get preview_spine_room => '小屋';

  @override
  String get talent_quest => '深域关卡';

  @override
  String get talent_weakness => '弱点属性';

  @override
  String get talent_weakness_tip => '弱点属性加成数值为最大值，即队伍中相同天赋角色数量为 5 时的数值';

  @override
  String talent_item_1(String arg1) {
    return '星素碎片*$arg1';
  }

  @override
  String talnet_item_2(String arg1) {
    return '水晶球*$arg1';
  }
}
