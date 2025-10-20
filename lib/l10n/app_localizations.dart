import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('zh')];

  /// No description provided for @unknown.
  ///
  /// In zh, this message translates to:
  /// **'?'**
  String get unknown;

  /// No description provided for @none.
  ///
  /// In zh, this message translates to:
  /// **''**
  String get none;

  /// No description provided for @date_m_d.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} 月 {arg2} 日'**
  String date_m_d(String arg1, String arg2);

  /// No description provided for @app_name.
  ///
  /// In zh, this message translates to:
  /// **'美空笔记'**
  String get app_name;

  /// No description provided for @home_page.
  ///
  /// In zh, this message translates to:
  /// **'首页'**
  String get home_page;

  /// No description provided for @function_page.
  ///
  /// In zh, this message translates to:
  /// **'功能'**
  String get function_page;

  /// No description provided for @settings_page.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get settings_page;

  /// No description provided for @about_page.
  ///
  /// In zh, this message translates to:
  /// **'关于'**
  String get about_page;

  /// No description provided for @restore.
  ///
  /// In zh, this message translates to:
  /// **'恢复'**
  String get restore;

  /// No description provided for @restore_settings.
  ///
  /// In zh, this message translates to:
  /// **'恢复默认设置'**
  String get restore_settings;

  /// No description provided for @restore_settings_success.
  ///
  /// In zh, this message translates to:
  /// **'已恢复默认设置'**
  String get restore_settings_success;

  /// No description provided for @skill_cooltime.
  ///
  /// In zh, this message translates to:
  /// **'冷却时间：{arg1}秒'**
  String skill_cooltime(String arg1);

  /// No description provided for @skill_cast_time.
  ///
  /// In zh, this message translates to:
  /// **'准备时间：{arg1}秒'**
  String skill_cast_time(String arg1);

  /// No description provided for @cast_time.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}秒'**
  String cast_time(String arg1);

  /// No description provided for @skill_level.
  ///
  /// In zh, this message translates to:
  /// **'技能等级：{arg1}'**
  String skill_level(int arg1);

  /// No description provided for @normal_attack.
  ///
  /// In zh, this message translates to:
  /// **'普攻'**
  String get normal_attack;

  /// No description provided for @union_burst.
  ///
  /// In zh, this message translates to:
  /// **'连结爆发'**
  String get union_burst;

  /// No description provided for @skill_index.
  ///
  /// In zh, this message translates to:
  /// **'技能{arg1}'**
  String skill_index(int arg1);

  /// No description provided for @ex_skill_index.
  ///
  /// In zh, this message translates to:
  /// **'额外技能{arg1}'**
  String ex_skill_index(String arg1);

  /// No description provided for @skill_loop_start.
  ///
  /// In zh, this message translates to:
  /// **'循环开始'**
  String get skill_loop_start;

  /// No description provided for @skill_loop_end.
  ///
  /// In zh, this message translates to:
  /// **'循环结束'**
  String get skill_loop_end;

  /// No description provided for @attack_pattern.
  ///
  /// In zh, this message translates to:
  /// **'攻击模式'**
  String get attack_pattern;

  /// No description provided for @skill_loop.
  ///
  /// In zh, this message translates to:
  /// **'技能循环'**
  String get skill_loop;

  /// No description provided for @skill_info.
  ///
  /// In zh, this message translates to:
  /// **'技能信息'**
  String get skill_info;

  /// No description provided for @summon_unit.
  ///
  /// In zh, this message translates to:
  /// **'召唤物'**
  String get summon_unit;

  /// No description provided for @sp_skill.
  ///
  /// In zh, this message translates to:
  /// **'SP技能'**
  String get sp_skill;

  /// No description provided for @type_normal.
  ///
  /// In zh, this message translates to:
  /// **'常驻'**
  String get type_normal;

  /// No description provided for @type_limit.
  ///
  /// In zh, this message translates to:
  /// **'限定'**
  String get type_limit;

  /// No description provided for @type_event_limit.
  ///
  /// In zh, this message translates to:
  /// **'活动'**
  String get type_event_limit;

  /// No description provided for @type_extra_character.
  ///
  /// In zh, this message translates to:
  /// **'额外'**
  String get type_extra_character;

  /// No description provided for @magic.
  ///
  /// In zh, this message translates to:
  /// **'魔法'**
  String get magic;

  /// No description provided for @physical.
  ///
  /// In zh, this message translates to:
  /// **'物理'**
  String get physical;

  /// No description provided for @position.
  ///
  /// In zh, this message translates to:
  /// **'位置'**
  String get position;

  /// No description provided for @position_front.
  ///
  /// In zh, this message translates to:
  /// **'前卫'**
  String get position_front;

  /// No description provided for @position_middle.
  ///
  /// In zh, this message translates to:
  /// **'中卫'**
  String get position_middle;

  /// No description provided for @position_back.
  ///
  /// In zh, this message translates to:
  /// **'后卫'**
  String get position_back;

  /// No description provided for @last_update.
  ///
  /// In zh, this message translates to:
  /// **'最后更新'**
  String get last_update;

  /// No description provided for @age.
  ///
  /// In zh, this message translates to:
  /// **'年龄'**
  String get age;

  /// No description provided for @height.
  ///
  /// In zh, this message translates to:
  /// **'身高'**
  String get height;

  /// No description provided for @weight.
  ///
  /// In zh, this message translates to:
  /// **'体重'**
  String get weight;

  /// No description provided for @unit_id.
  ///
  /// In zh, this message translates to:
  /// **'角色ID'**
  String get unit_id;

  /// No description provided for @birthday.
  ///
  /// In zh, this message translates to:
  /// **'生日'**
  String get birthday;

  /// No description provided for @search_area_width.
  ///
  /// In zh, this message translates to:
  /// **'位置'**
  String get search_area_width;

  /// No description provided for @character.
  ///
  /// In zh, this message translates to:
  /// **'角色'**
  String get character;

  /// No description provided for @clan_battle_y_m.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} 年 {arg2} 月'**
  String clan_battle_y_m(String arg1, String arg2);

  /// No description provided for @tool_unique_equip.
  ///
  /// In zh, this message translates to:
  /// **'专武'**
  String get tool_unique_equip;

  /// No description provided for @character_detail.
  ///
  /// In zh, this message translates to:
  /// **'角色详情'**
  String get character_detail;

  /// No description provided for @no_description.
  ///
  /// In zh, this message translates to:
  /// **'暂无描述'**
  String get no_description;

  /// No description provided for @attack_type.
  ///
  /// In zh, this message translates to:
  /// **'类型'**
  String get attack_type;

  /// No description provided for @no_search_result.
  ///
  /// In zh, this message translates to:
  /// **'无搜索结果'**
  String get no_search_result;

  /// No description provided for @searching.
  ///
  /// In zh, this message translates to:
  /// **'搜索中'**
  String get searching;

  /// No description provided for @search_hit_name.
  ///
  /// In zh, this message translates to:
  /// **'请输入角色名'**
  String get search_hit_name;

  /// No description provided for @search_hit_id.
  ///
  /// In zh, this message translates to:
  /// **'请输入角色ID'**
  String get search_hit_id;

  /// No description provided for @app_settings.
  ///
  /// In zh, this message translates to:
  /// **'应用设置'**
  String get app_settings;

  /// No description provided for @language.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get language;

  /// No description provided for @database_settings.
  ///
  /// In zh, this message translates to:
  /// **'数据库设置'**
  String get database_settings;

  /// No description provided for @database_area.
  ///
  /// In zh, this message translates to:
  /// **'数据库区域'**
  String get database_area;

  /// No description provided for @cn_server.
  ///
  /// In zh, this message translates to:
  /// **'国服'**
  String get cn_server;

  /// No description provided for @tw_server.
  ///
  /// In zh, this message translates to:
  /// **'台服'**
  String get tw_server;

  /// No description provided for @jp_server.
  ///
  /// In zh, this message translates to:
  /// **'日服'**
  String get jp_server;

  /// No description provided for @version.
  ///
  /// In zh, this message translates to:
  /// **'版本'**
  String get version;

  /// No description provided for @database_last_update.
  ///
  /// In zh, this message translates to:
  /// **'数据库最后更新'**
  String get database_last_update;

  /// No description provided for @check_update.
  ///
  /// In zh, this message translates to:
  /// **'检查更新'**
  String get check_update;

  /// No description provided for @checking_update_failed.
  ///
  /// In zh, this message translates to:
  /// **'检查更新失败'**
  String get checking_update_failed;

  /// No description provided for @checking_update.
  ///
  /// In zh, this message translates to:
  /// **'正在检查更新...'**
  String get checking_update;

  /// No description provided for @latest_version.
  ///
  /// In zh, this message translates to:
  /// **'已是最新版本'**
  String get latest_version;

  /// No description provided for @find_new_version.
  ///
  /// In zh, this message translates to:
  /// **'发现新版本：{arg1}'**
  String find_new_version(String arg1);

  /// No description provided for @can_not_launch_url.
  ///
  /// In zh, this message translates to:
  /// **'无法打开链接'**
  String get can_not_launch_url;

  /// No description provided for @new_version_log.
  ///
  /// In zh, this message translates to:
  /// **'更新日志'**
  String get new_version_log;

  /// No description provided for @force_update.
  ///
  /// In zh, this message translates to:
  /// **'强制更新'**
  String get force_update;

  /// No description provided for @auto_check_update.
  ///
  /// In zh, this message translates to:
  /// **'自动检查更新'**
  String get auto_check_update;

  /// No description provided for @database_missing.
  ///
  /// In zh, this message translates to:
  /// **'数据库文件缺失'**
  String get database_missing;

  /// No description provided for @database_missing_hit.
  ///
  /// In zh, this message translates to:
  /// **'检测到数据库文件不存在，需要下载数据库文件才能正常使用应用。'**
  String get database_missing_hit;

  /// No description provided for @download.
  ///
  /// In zh, this message translates to:
  /// **'下载'**
  String get download;

  /// No description provided for @database_broken.
  ///
  /// In zh, this message translates to:
  /// **'数据库文件损坏'**
  String get database_broken;

  /// No description provided for @database_broken_hit.
  ///
  /// In zh, this message translates to:
  /// **'检测到数据库文件损坏，需要重新下载数据库文件才能正常使用应用。'**
  String get database_broken_hit;

  /// No description provided for @database_updating.
  ///
  /// In zh, this message translates to:
  /// **'正在更新数据库'**
  String get database_updating;

  /// No description provided for @database_update_success.
  ///
  /// In zh, this message translates to:
  /// **'数据库更新成功'**
  String get database_update_success;

  /// No description provided for @database_update_fail.
  ///
  /// In zh, this message translates to:
  /// **'数据库更新失败:'**
  String get database_update_fail;

  /// No description provided for @download_failed.
  ///
  /// In zh, this message translates to:
  /// **'下载失败'**
  String get download_failed;

  /// No description provided for @database_update.
  ///
  /// In zh, this message translates to:
  /// **'数据库更新'**
  String get database_update;

  /// No description provided for @database_current_version.
  ///
  /// In zh, this message translates to:
  /// **'当前数据库版本：{arg1}'**
  String database_current_version(String arg1);

  /// No description provided for @database_new_version.
  ///
  /// In zh, this message translates to:
  /// **'最新数据库版本：{arg1}'**
  String database_new_version(String arg1);

  /// No description provided for @database_update_hint.
  ///
  /// In zh, this message translates to:
  /// **'检测到有新的数据库版本可用，建议更新以获取最新数据。'**
  String get database_update_hint;

  /// No description provided for @already_latest_version.
  ///
  /// In zh, this message translates to:
  /// **'当前已是最新版本'**
  String get already_latest_version;

  /// No description provided for @database_version_fetch_failed.
  ///
  /// In zh, this message translates to:
  /// **'无法获取最新数据库版本'**
  String get database_version_fetch_failed;

  /// No description provided for @database_server.
  ///
  /// In zh, this message translates to:
  /// **'服务器: {arg1}'**
  String database_server(String arg1);

  /// No description provided for @close.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get close;

  /// No description provided for @talent.
  ///
  /// In zh, this message translates to:
  /// **'天赋'**
  String get talent;

  /// No description provided for @app_check_auto_update.
  ///
  /// In zh, this message translates to:
  /// **'应用检查自动更新'**
  String get app_check_auto_update;

  /// No description provided for @enemy_character.
  ///
  /// In zh, this message translates to:
  /// **'敌方角色'**
  String get enemy_character;

  /// No description provided for @no_data_error.
  ///
  /// In zh, this message translates to:
  /// **'未找到单位数据'**
  String get no_data_error;

  /// No description provided for @talent_fire.
  ///
  /// In zh, this message translates to:
  /// **'火'**
  String get talent_fire;

  /// No description provided for @talent_water.
  ///
  /// In zh, this message translates to:
  /// **'水'**
  String get talent_water;

  /// No description provided for @talent_wind.
  ///
  /// In zh, this message translates to:
  /// **'风'**
  String get talent_wind;

  /// No description provided for @talent_light.
  ///
  /// In zh, this message translates to:
  /// **'光'**
  String get talent_light;

  /// No description provided for @talent_dark.
  ///
  /// In zh, this message translates to:
  /// **'暗'**
  String get talent_dark;

  /// No description provided for @skill_type_1.
  ///
  /// In zh, this message translates to:
  /// **'伤害'**
  String get skill_type_1;

  /// No description provided for @skill_type_2.
  ///
  /// In zh, this message translates to:
  /// **'位移'**
  String get skill_type_2;

  /// No description provided for @skill_type_4_5.
  ///
  /// In zh, this message translates to:
  /// **'治疗'**
  String get skill_type_4_5;

  /// No description provided for @skill_type_6.
  ///
  /// In zh, this message translates to:
  /// **'护盾'**
  String get skill_type_6;

  /// No description provided for @skill_type_12.
  ///
  /// In zh, this message translates to:
  /// **'黑暗'**
  String get skill_type_12;

  /// No description provided for @skill_type_13.
  ///
  /// In zh, this message translates to:
  /// **'沉默'**
  String get skill_type_13;

  /// No description provided for @skill_type_14.
  ///
  /// In zh, this message translates to:
  /// **'模式变更'**
  String get skill_type_14;

  /// No description provided for @skill_type_15.
  ///
  /// In zh, this message translates to:
  /// **'召唤'**
  String get skill_type_15;

  /// No description provided for @skill_type_16_92.
  ///
  /// In zh, this message translates to:
  /// **'TP'**
  String get skill_type_16_92;

  /// No description provided for @skill_type_17.
  ///
  /// In zh, this message translates to:
  /// **'条件'**
  String get skill_type_17;

  /// No description provided for @skill_type_18_19.
  ///
  /// In zh, this message translates to:
  /// **'蓄力'**
  String get skill_type_18_19;

  /// No description provided for @skill_type_20.
  ///
  /// In zh, this message translates to:
  /// **'挑衅'**
  String get skill_type_20;

  /// No description provided for @skill_type_21.
  ///
  /// In zh, this message translates to:
  /// **'回避'**
  String get skill_type_21;

  /// No description provided for @skill_type_22.
  ///
  /// In zh, this message translates to:
  /// **'循环变更'**
  String get skill_type_22;

  /// No description provided for @skill_type_24.
  ///
  /// In zh, this message translates to:
  /// **'复活'**
  String get skill_type_24;

  /// No description provided for @skill_type_30.
  ///
  /// In zh, this message translates to:
  /// **'即死'**
  String get skill_type_30;

  /// No description provided for @skill_type_32.
  ///
  /// In zh, this message translates to:
  /// **'HP吸收'**
  String get skill_type_32;

  /// No description provided for @skill_type_33.
  ///
  /// In zh, this message translates to:
  /// **'反伤'**
  String get skill_type_33;

  /// No description provided for @skill_type_34.
  ///
  /// In zh, this message translates to:
  /// **'伤害递增'**
  String get skill_type_34;

  /// No description provided for @skill_type_35_43_60_77.
  ///
  /// In zh, this message translates to:
  /// **'标记'**
  String get skill_type_35_43_60_77;

  /// No description provided for @skill_type_36_37_38_39_40.
  ///
  /// In zh, this message translates to:
  /// **'领域'**
  String get skill_type_36_37_38_39_40;

  /// No description provided for @skill_type_42.
  ///
  /// In zh, this message translates to:
  /// **'触发'**
  String get skill_type_42;

  /// No description provided for @skill_type_44.
  ///
  /// In zh, this message translates to:
  /// **'进场'**
  String get skill_type_44;

  /// No description provided for @skill_type_46.
  ///
  /// In zh, this message translates to:
  /// **'比例伤害'**
  String get skill_type_46;

  /// No description provided for @skill_type_48.
  ///
  /// In zh, this message translates to:
  /// **'持续回复'**
  String get skill_type_48;

  /// No description provided for @skill_type_49.
  ///
  /// In zh, this message translates to:
  /// **'移除'**
  String get skill_type_49;

  /// No description provided for @skill_type_50.
  ///
  /// In zh, this message translates to:
  /// **'持续动作'**
  String get skill_type_50;

  /// No description provided for @skill_type_54.
  ///
  /// In zh, this message translates to:
  /// **'潜伏'**
  String get skill_type_54;

  /// No description provided for @skill_type_56.
  ///
  /// In zh, this message translates to:
  /// **'千里眼'**
  String get skill_type_56;

  /// No description provided for @skill_type_57.
  ///
  /// In zh, this message translates to:
  /// **'延时'**
  String get skill_type_57;

  /// No description provided for @skill_type_58.
  ///
  /// In zh, this message translates to:
  /// **'解除领域'**
  String get skill_type_58;

  /// No description provided for @skill_type_59.
  ///
  /// In zh, this message translates to:
  /// **'回复妨碍'**
  String get skill_type_59;

  /// No description provided for @skill_type_61.
  ///
  /// In zh, this message translates to:
  /// **'恐慌'**
  String get skill_type_61;

  /// No description provided for @skill_type_62.
  ///
  /// In zh, this message translates to:
  /// **'畏惧'**
  String get skill_type_62;

  /// No description provided for @skill_type_63.
  ///
  /// In zh, this message translates to:
  /// **'持续效果'**
  String get skill_type_63;

  /// No description provided for @skill_type_69.
  ///
  /// In zh, this message translates to:
  /// **'变身'**
  String get skill_type_69;

  /// No description provided for @skill_type_70.
  ///
  /// In zh, this message translates to:
  /// **'HP变化'**
  String get skill_type_70;

  /// No description provided for @skill_type_71.
  ///
  /// In zh, this message translates to:
  /// **'免死'**
  String get skill_type_71;

  /// No description provided for @skill_type_72.
  ///
  /// In zh, this message translates to:
  /// **'减伤'**
  String get skill_type_72;

  /// No description provided for @skill_type_73.
  ///
  /// In zh, this message translates to:
  /// **'伤害护盾'**
  String get skill_type_73;

  /// No description provided for @skill_type_75.
  ///
  /// In zh, this message translates to:
  /// **'次数触发'**
  String get skill_type_75;

  /// No description provided for @skill_type_76.
  ///
  /// In zh, this message translates to:
  /// **'HP回复量'**
  String get skill_type_76;

  /// No description provided for @skill_type_78.
  ///
  /// In zh, this message translates to:
  /// **'被击伤害'**
  String get skill_type_78;

  /// No description provided for @skill_type_79.
  ///
  /// In zh, this message translates to:
  /// **'行动伤害'**
  String get skill_type_79;

  /// No description provided for @skill_type_81.
  ///
  /// In zh, this message translates to:
  /// **'无效目标'**
  String get skill_type_81;

  /// No description provided for @skill_type_90.
  ///
  /// In zh, this message translates to:
  /// **'被动'**
  String get skill_type_90;

  /// No description provided for @skill_type_901_902.
  ///
  /// In zh, this message translates to:
  /// **'装备'**
  String get skill_type_901_902;

  /// No description provided for @skill_type_95.
  ///
  /// In zh, this message translates to:
  /// **'隐匿'**
  String get skill_type_95;

  /// No description provided for @skill_type_100.
  ///
  /// In zh, this message translates to:
  /// **'免疫'**
  String get skill_type_100;

  /// No description provided for @skill_type_105.
  ///
  /// In zh, this message translates to:
  /// **'环境'**
  String get skill_type_105;

  /// No description provided for @skill_type_106.
  ///
  /// In zh, this message translates to:
  /// **'守护'**
  String get skill_type_106;

  /// No description provided for @skill_type_110.
  ///
  /// In zh, this message translates to:
  /// **'持续伤害易伤'**
  String get skill_type_110;

  /// No description provided for @skill_action_type_116.
  ///
  /// In zh, this message translates to:
  /// **'执着'**
  String get skill_action_type_116;

  /// No description provided for @skill_action_type_121.
  ///
  /// In zh, this message translates to:
  /// **'幻化'**
  String get skill_action_type_121;

  /// No description provided for @skill_action_type_123.
  ///
  /// In zh, this message translates to:
  /// **'减伤'**
  String get skill_action_type_123;

  /// No description provided for @skill_action_type_124.
  ///
  /// In zh, this message translates to:
  /// **'转移伤害'**
  String get skill_action_type_124;

  /// No description provided for @skill_action_type_125.
  ///
  /// In zh, this message translates to:
  /// **'无法选中'**
  String get skill_action_type_125;

  /// No description provided for @skill_action_type_128.
  ///
  /// In zh, this message translates to:
  /// **'持续伤害增强'**
  String get skill_action_type_128;

  /// No description provided for @skill_action_type_129.
  ///
  /// In zh, this message translates to:
  /// **'伤害转化'**
  String get skill_action_type_129;

  /// No description provided for @skill_action_type_130.
  ///
  /// In zh, this message translates to:
  /// **'调和'**
  String get skill_action_type_130;

  /// No description provided for @skill_status_100.
  ///
  /// In zh, this message translates to:
  /// **'无法行动'**
  String get skill_status_100;

  /// No description provided for @skill_status_101.
  ///
  /// In zh, this message translates to:
  /// **'加速状态'**
  String get skill_status_101;

  /// No description provided for @skill_status_200.
  ///
  /// In zh, this message translates to:
  /// **'失明'**
  String get skill_status_200;

  /// No description provided for @skill_status_300.
  ///
  /// In zh, this message translates to:
  /// **'魅惑状态'**
  String get skill_status_300;

  /// No description provided for @skill_status_400.
  ///
  /// In zh, this message translates to:
  /// **'挑衅状态'**
  String get skill_status_400;

  /// No description provided for @skill_status_500.
  ///
  /// In zh, this message translates to:
  /// **'烧伤状态'**
  String get skill_status_500;

  /// No description provided for @skill_status_501.
  ///
  /// In zh, this message translates to:
  /// **'诅咒状态'**
  String get skill_status_501;

  /// No description provided for @skill_status_502.
  ///
  /// In zh, this message translates to:
  /// **'中毒状态'**
  String get skill_status_502;

  /// No description provided for @skill_status_503.
  ///
  /// In zh, this message translates to:
  /// **'猛毒状态'**
  String get skill_status_503;

  /// No description provided for @skill_status_504.
  ///
  /// In zh, this message translates to:
  /// **'咒术状态'**
  String get skill_status_504;

  /// No description provided for @skill_status_511.
  ///
  /// In zh, this message translates to:
  /// **'诅咒或咒术状态'**
  String get skill_status_511;

  /// No description provided for @skill_status_512.
  ///
  /// In zh, this message translates to:
  /// **'中毒或猛毒状态'**
  String get skill_status_512;

  /// No description provided for @skill_status_710.
  ///
  /// In zh, this message translates to:
  /// **'BREAK 状态'**
  String get skill_status_710;

  /// No description provided for @skill_status_900.
  ///
  /// In zh, this message translates to:
  /// **'HP 全满状态'**
  String get skill_status_900;

  /// No description provided for @skill_status_1400.
  ///
  /// In zh, this message translates to:
  /// **'变身状态'**
  String get skill_status_1400;

  /// No description provided for @skill_status_1600.
  ///
  /// In zh, this message translates to:
  /// **'恐慌状态'**
  String get skill_status_1600;

  /// No description provided for @skill_status_1601.
  ///
  /// In zh, this message translates to:
  /// **'隐匿状态'**
  String get skill_status_1601;

  /// No description provided for @skill_status_1700.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}状态'**
  String skill_status_1700(String arg1);

  /// No description provided for @skill_status_721.
  ///
  /// In zh, this message translates to:
  /// **'特殊标记状态'**
  String get skill_status_721;

  /// No description provided for @skill_status_6107.
  ///
  /// In zh, this message translates to:
  /// **'龙之眼状态'**
  String get skill_status_6107;

  /// No description provided for @skill_status_1800.
  ///
  /// In zh, this message translates to:
  /// **'多目标状态'**
  String get skill_status_1800;

  /// No description provided for @skill_status_1900.
  ///
  /// In zh, this message translates to:
  /// **'护盾展开'**
  String get skill_status_1900;

  /// No description provided for @skill_status_3137.
  ///
  /// In zh, this message translates to:
  /// **'界雷'**
  String get skill_status_3137;

  /// No description provided for @skill_status_3162.
  ///
  /// In zh, this message translates to:
  /// **'妨魔塵'**
  String get skill_status_3162;

  /// No description provided for @skill_status_3175.
  ///
  /// In zh, this message translates to:
  /// **'绝冰'**
  String get skill_status_3175;

  /// No description provided for @skill_status_3207.
  ///
  /// In zh, this message translates to:
  /// **'忌火'**
  String get skill_status_3207;

  /// No description provided for @skill_status_6160.
  ///
  /// In zh, this message translates to:
  /// **'黏着状态'**
  String get skill_status_6160;

  /// No description provided for @skill_status_physical_atk.
  ///
  /// In zh, this message translates to:
  /// **'物理攻击'**
  String get skill_status_physical_atk;

  /// No description provided for @skill_status_magic_atk.
  ///
  /// In zh, this message translates to:
  /// **'魔法攻击'**
  String get skill_status_magic_atk;

  /// No description provided for @skill_area_exclude_summon.
  ///
  /// In zh, this message translates to:
  /// **'召唤物、分身除外'**
  String get skill_area_exclude_summon;

  /// No description provided for @skill_area_include_summon.
  ///
  /// In zh, this message translates to:
  /// **'飞行单位在内'**
  String get skill_area_include_summon;

  /// No description provided for @skill_target_none.
  ///
  /// In zh, this message translates to:
  /// **'目标'**
  String get skill_target_none;

  /// No description provided for @skill_target_2_8.
  ///
  /// In zh, this message translates to:
  /// **'随机'**
  String get skill_target_2_8;

  /// No description provided for @skill_target_3.
  ///
  /// In zh, this message translates to:
  /// **'最近'**
  String get skill_target_3;

  /// No description provided for @skill_target_4.
  ///
  /// In zh, this message translates to:
  /// **'最远'**
  String get skill_target_4;

  /// No description provided for @skill_target_5_25.
  ///
  /// In zh, this message translates to:
  /// **'HP最低'**
  String get skill_target_5_25;

  /// No description provided for @skill_target_6_26.
  ///
  /// In zh, this message translates to:
  /// **'HP最高'**
  String get skill_target_6_26;

  /// No description provided for @skill_target_7.
  ///
  /// In zh, this message translates to:
  /// **'自身'**
  String get skill_target_7;

  /// No description provided for @skill_target_9.
  ///
  /// In zh, this message translates to:
  /// **'最后方'**
  String get skill_target_9;

  /// No description provided for @skill_target_10.
  ///
  /// In zh, this message translates to:
  /// **'最前方'**
  String get skill_target_10;

  /// No description provided for @skill_target_11.
  ///
  /// In zh, this message translates to:
  /// **'范围内'**
  String get skill_target_11;

  /// No description provided for @skill_target_12_27_37.
  ///
  /// In zh, this message translates to:
  /// **'TP最高'**
  String get skill_target_12_27_37;

  /// No description provided for @skill_target_13_19_28.
  ///
  /// In zh, this message translates to:
  /// **'TP最低'**
  String get skill_target_13_19_28;

  /// No description provided for @skill_target_14_29.
  ///
  /// In zh, this message translates to:
  /// **'物理攻击力最高'**
  String get skill_target_14_29;

  /// No description provided for @skill_target_15_30.
  ///
  /// In zh, this message translates to:
  /// **'物理攻击力最低'**
  String get skill_target_15_30;

  /// No description provided for @skill_target_16_31.
  ///
  /// In zh, this message translates to:
  /// **'魔法攻击力最高'**
  String get skill_target_16_31;

  /// No description provided for @skill_target_17_32.
  ///
  /// In zh, this message translates to:
  /// **'魔法攻击力最低'**
  String get skill_target_17_32;

  /// No description provided for @skill_target_18.
  ///
  /// In zh, this message translates to:
  /// **'召唤物'**
  String get skill_target_18;

  /// No description provided for @skill_target_20.
  ///
  /// In zh, this message translates to:
  /// **'物理'**
  String get skill_target_20;

  /// No description provided for @skill_target_21.
  ///
  /// In zh, this message translates to:
  /// **'魔法'**
  String get skill_target_21;

  /// No description provided for @skill_target_22.
  ///
  /// In zh, this message translates to:
  /// **'随机召唤物'**
  String get skill_target_22;

  /// No description provided for @skill_target_23.
  ///
  /// In zh, this message translates to:
  /// **'自身召唤物'**
  String get skill_target_23;

  /// No description provided for @skill_target_24.
  ///
  /// In zh, this message translates to:
  /// **'领主'**
  String get skill_target_24;

  /// No description provided for @skill_target_33.
  ///
  /// In zh, this message translates to:
  /// **'暗影'**
  String get skill_target_33;

  /// No description provided for @skill_target_34.
  ///
  /// In zh, this message translates to:
  /// **'除自身以外'**
  String get skill_target_34;

  /// No description provided for @skill_target_35.
  ///
  /// In zh, this message translates to:
  /// **'剩余HP最高'**
  String get skill_target_35;

  /// No description provided for @skill_target_36.
  ///
  /// In zh, this message translates to:
  /// **'剩余HP最低'**
  String get skill_target_36;

  /// No description provided for @skill_target_38.
  ///
  /// In zh, this message translates to:
  /// **'攻击力最高'**
  String get skill_target_38;

  /// No description provided for @skill_target_39.
  ///
  /// In zh, this message translates to:
  /// **'攻击力最低'**
  String get skill_target_39;

  /// No description provided for @skill_target_42.
  ///
  /// In zh, this message translates to:
  /// **'多目标'**
  String get skill_target_42;

  /// No description provided for @skill_target_43.
  ///
  /// In zh, this message translates to:
  /// **'物理攻击力最高(自身除外)'**
  String get skill_target_43;

  /// No description provided for @skill_target_44.
  ///
  /// In zh, this message translates to:
  /// **'剩余HP最低(自身除外)'**
  String get skill_target_44;

  /// No description provided for @skill_target_45.
  ///
  /// In zh, this message translates to:
  /// **'物理防御力最低'**
  String get skill_target_45;

  /// No description provided for @skill_target_46.
  ///
  /// In zh, this message translates to:
  /// **'魔法防御力最低'**
  String get skill_target_46;

  /// No description provided for @skill_target_50.
  ///
  /// In zh, this message translates to:
  /// **'魔法攻击力最高(自身除外)'**
  String get skill_target_50;

  /// No description provided for @skill_target_13xxx.
  ///
  /// In zh, this message translates to:
  /// **'被标记'**
  String get skill_target_13xxx;

  /// No description provided for @skill_target_fire.
  ///
  /// In zh, this message translates to:
  /// **'火天赋'**
  String get skill_target_fire;

  /// No description provided for @skill_target_water.
  ///
  /// In zh, this message translates to:
  /// **'水天赋'**
  String get skill_target_water;

  /// No description provided for @skill_target_wind.
  ///
  /// In zh, this message translates to:
  /// **'风天赋'**
  String get skill_target_wind;

  /// No description provided for @skill_target_light.
  ///
  /// In zh, this message translates to:
  /// **'光天赋'**
  String get skill_target_light;

  /// No description provided for @skill_target_dark.
  ///
  /// In zh, this message translates to:
  /// **'暗天赋'**
  String get skill_target_dark;

  /// No description provided for @skill_target_assignment_0.
  ///
  /// In zh, this message translates to:
  /// **'自身'**
  String get skill_target_assignment_0;

  /// No description provided for @skill_target_assignment_1.
  ///
  /// In zh, this message translates to:
  /// **'敌人'**
  String get skill_target_assignment_1;

  /// No description provided for @skill_target_assignment_2.
  ///
  /// In zh, this message translates to:
  /// **'己方'**
  String get skill_target_assignment_2;

  /// No description provided for @skill_target_assignment_3.
  ///
  /// In zh, this message translates to:
  /// **'敌人和己方'**
  String get skill_target_assignment_3;

  /// No description provided for @skill_shield_no_effect.
  ///
  /// In zh, this message translates to:
  /// **'无效'**
  String get skill_shield_no_effect;

  /// No description provided for @skill_shield_defense.
  ///
  /// In zh, this message translates to:
  /// **'吸收'**
  String get skill_shield_defense;

  /// No description provided for @skill_shield.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}{arg2}伤害的护盾'**
  String skill_shield(String arg1, String arg2);

  /// No description provided for @skill_action.
  ///
  /// In zh, this message translates to:
  /// **'动作'**
  String get skill_action;

  /// No description provided for @skill_action_d.
  ///
  /// In zh, this message translates to:
  /// **'动作({arg1})'**
  String skill_action_d(int arg1);

  /// No description provided for @skill_effect_time.
  ///
  /// In zh, this message translates to:
  /// **'，持续 {arg1} 秒'**
  String skill_effect_time(String arg1);

  /// No description provided for @skill_all.
  ///
  /// In zh, this message translates to:
  /// **'所有'**
  String get skill_all;

  /// No description provided for @skill_level_text.
  ///
  /// In zh, this message translates to:
  /// **'技能等级'**
  String get skill_level_text;

  /// No description provided for @skill_atk_text.
  ///
  /// In zh, this message translates to:
  /// **'攻击力'**
  String get skill_atk_text;

  /// No description provided for @skill_speed.
  ///
  /// In zh, this message translates to:
  /// **'速度'**
  String get skill_speed;

  /// No description provided for @skill_hp_max.
  ///
  /// In zh, this message translates to:
  /// **'HP最大值'**
  String get skill_hp_max;

  /// No description provided for @skill_increase.
  ///
  /// In zh, this message translates to:
  /// **'提升'**
  String get skill_increase;

  /// No description provided for @skill_reduce.
  ///
  /// In zh, this message translates to:
  /// **'减少'**
  String get skill_reduce;

  /// No description provided for @skill_fixed.
  ///
  /// In zh, this message translates to:
  /// **'(固定数值)'**
  String get skill_fixed;

  /// No description provided for @skill_cannot_dispel.
  ///
  /// In zh, this message translates to:
  /// **'(不可驱散)'**
  String get skill_cannot_dispel;

  /// No description provided for @skill_physical_critical_damage.
  ///
  /// In zh, this message translates to:
  /// **'物理暴击伤害'**
  String get skill_physical_critical_damage;

  /// No description provided for @skill_magic_critical_damage.
  ///
  /// In zh, this message translates to:
  /// **'魔法暴击伤害'**
  String get skill_magic_critical_damage;

  /// No description provided for @skill_critical_damage_take.
  ///
  /// In zh, this message translates to:
  /// **'受到的暴击伤害'**
  String get skill_critical_damage_take;

  /// No description provided for @skill_damage_take.
  ///
  /// In zh, this message translates to:
  /// **'受到的伤害'**
  String get skill_damage_take;

  /// No description provided for @skill_physical_damage_take.
  ///
  /// In zh, this message translates to:
  /// **'受到的物理伤害'**
  String get skill_physical_damage_take;

  /// No description provided for @skill_magic_damage_take.
  ///
  /// In zh, this message translates to:
  /// **'受到的魔法伤害'**
  String get skill_magic_damage_take;

  /// No description provided for @skill_physical_damage.
  ///
  /// In zh, this message translates to:
  /// **'造成的物理伤害'**
  String get skill_physical_damage;

  /// No description provided for @skill_magic_damage.
  ///
  /// In zh, this message translates to:
  /// **'造成的魔法伤害'**
  String get skill_magic_damage;

  /// No description provided for @skill_depend_action.
  ///
  /// In zh, this message translates to:
  /// **'受到动作({arg1})影响的'**
  String skill_depend_action(int arg1);

  /// No description provided for @skill_range.
  ///
  /// In zh, this message translates to:
  /// **'范围{arg1}内'**
  String skill_range(int arg1);

  /// No description provided for @skill_target_single.
  ///
  /// In zh, this message translates to:
  /// **'单体'**
  String get skill_target_single;

  /// No description provided for @skill_target_count.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}名'**
  String skill_target_count(int arg1);

  /// No description provided for @skill_target_all.
  ///
  /// In zh, this message translates to:
  /// **'全体'**
  String get skill_target_all;

  /// No description provided for @skill_target_order_num.
  ///
  /// In zh, this message translates to:
  /// **'第{arg1}近'**
  String skill_target_order_num(String arg1);

  /// No description provided for @skill_target_order_1.
  ///
  /// In zh, this message translates to:
  /// **'最近'**
  String get skill_target_order_1;

  /// No description provided for @skill_physical.
  ///
  /// In zh, this message translates to:
  /// **'物理'**
  String get skill_physical;

  /// No description provided for @skill_physical_str.
  ///
  /// In zh, this message translates to:
  /// **'物理攻击力'**
  String get skill_physical_str;

  /// No description provided for @skill_physical_def.
  ///
  /// In zh, this message translates to:
  /// **'物理防御力'**
  String get skill_physical_def;

  /// No description provided for @skill_magic.
  ///
  /// In zh, this message translates to:
  /// **'魔法'**
  String get skill_magic;

  /// No description provided for @skill_magic_str.
  ///
  /// In zh, this message translates to:
  /// **'魔法攻击力'**
  String get skill_magic_str;

  /// No description provided for @skill_magic_def.
  ///
  /// In zh, this message translates to:
  /// **'魔法防御力'**
  String get skill_magic_def;

  /// No description provided for @skill_must_hit_physical.
  ///
  /// In zh, this message translates to:
  /// **'必定命中的物理'**
  String get skill_must_hit_physical;

  /// No description provided for @skill_must_hit_magic.
  ///
  /// In zh, this message translates to:
  /// **'必定命中的魔法'**
  String get skill_must_hit_magic;

  /// No description provided for @skill_sum_atk_physical.
  ///
  /// In zh, this message translates to:
  /// **'(物理、魔法攻击力合计)物理'**
  String get skill_sum_atk_physical;

  /// No description provided for @skill_sum_atk_magic.
  ///
  /// In zh, this message translates to:
  /// **'(物理、魔法攻击力合计)魔法'**
  String get skill_sum_atk_magic;

  /// No description provided for @skill_adaptive_lower_defense.
  ///
  /// In zh, this message translates to:
  /// **'(适应物理/魔法防御中较低的防御)'**
  String get skill_adaptive_lower_defense;

  /// No description provided for @skill_critical_damage_multiple.
  ///
  /// In zh, this message translates to:
  /// **'；暴击时，造成{arg1} 倍伤害'**
  String skill_critical_damage_multiple(String arg1);

  /// No description provided for @skill_must_critical.
  ///
  /// In zh, this message translates to:
  /// **'；必定暴击'**
  String get skill_must_critical;

  /// No description provided for @skill_ignore_def.
  ///
  /// In zh, this message translates to:
  /// **'；无视目标{arg1}防御力 '**
  String skill_ignore_def(String arg1);

  /// No description provided for @skill_action_type_desc_1.
  ///
  /// In zh, this message translates to:
  /// **'对{arg1}造成 {arg2} 的{arg3}伤害{arg4}{arg5}{arg6}{arg7}'**
  String skill_action_type_desc_1(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    String arg5,
    String arg6,
    String arg7,
  );

  /// No description provided for @skill_forward.
  ///
  /// In zh, this message translates to:
  /// **'向前'**
  String get skill_forward;

  /// No description provided for @skill_backward.
  ///
  /// In zh, this message translates to:
  /// **'向后'**
  String get skill_backward;

  /// No description provided for @skill_ahead.
  ///
  /// In zh, this message translates to:
  /// **'前方'**
  String get skill_ahead;

  /// No description provided for @skill_rear.
  ///
  /// In zh, this message translates to:
  /// **'后方'**
  String get skill_rear;

  /// No description provided for @skill_move.
  ///
  /// In zh, this message translates to:
  /// **'移动至{arg1}{arg2} [{arg3}]'**
  String skill_move(String arg1, String arg2, int arg3);

  /// No description provided for @skill_return.
  ///
  /// In zh, this message translates to:
  /// **'，动作结束后回到原来位置'**
  String get skill_return;

  /// No description provided for @skill_move_speed.
  ///
  /// In zh, this message translates to:
  /// **'，移动速度 [{arg1}]'**
  String skill_move_speed(int arg1);

  /// No description provided for @skill_hit_up.
  ///
  /// In zh, this message translates to:
  /// **'击飞'**
  String get skill_hit_up;

  /// No description provided for @skill_action_type_desc_3_up.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}{arg2}，高度 [{arg3}]'**
  String skill_action_type_desc_3_up(String arg1, String arg2, int arg3);

  /// No description provided for @skill_push.
  ///
  /// In zh, this message translates to:
  /// **'击退'**
  String get skill_push;

  /// No description provided for @skill_pull.
  ///
  /// In zh, this message translates to:
  /// **'拉近'**
  String get skill_pull;

  /// No description provided for @skill_action_type_desc_3_move.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}{arg2}，距离 [{arg3}]'**
  String skill_action_type_desc_3_move(String arg1, String arg2, int arg3);

  /// No description provided for @skill_action_type_desc_3_pull.
  ///
  /// In zh, this message translates to:
  /// **'将{arg1}{arg2}身前 [{arg3}]'**
  String skill_action_type_desc_3_pull(String arg1, String arg2, int arg3);

  /// No description provided for @skill_action_type_desc_4.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}HP回复 {arg2}'**
  String skill_action_type_desc_4(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_6.
  ///
  /// In zh, this message translates to:
  /// **'对{arg1}展开{arg2} {arg3}{arg4}'**
  String skill_action_type_desc_6(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_7.
  ///
  /// In zh, this message translates to:
  /// **'锁定{arg1}'**
  String skill_action_type_desc_7(String arg1);

  /// No description provided for @skill_action_speed_change.
  ///
  /// In zh, this message translates to:
  /// **'速度额外{arg1}初始值的 {arg2} 倍'**
  String skill_action_speed_change(String arg1, String arg2);

  /// No description provided for @skill_action_speed_multiple.
  ///
  /// In zh, this message translates to:
  /// **'速度变更为初始值的 {arg1} 倍'**
  String skill_action_speed_multiple(String arg1);

  /// No description provided for @skill_action_type_desc_8.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}进入{arg2}状态{arg3}{arg4}'**
  String skill_action_type_desc_8(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_hit_remove.
  ///
  /// In zh, this message translates to:
  /// **'，本效果将会在受到伤害时解除'**
  String get skill_action_hit_remove;

  /// No description provided for @skill_action_dot_increase.
  ///
  /// In zh, this message translates to:
  /// **'，伤害每秒增加基础数值的 [{arg1}%]'**
  String skill_action_dot_increase(int arg1);

  /// No description provided for @skill_action_type_desc_9.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}进入 [{arg2}] 状态，每秒造成伤害 {arg3}{arg4}{arg5}'**
  String skill_action_type_desc_9(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    String arg5,
  );

  /// No description provided for @skill_buff.
  ///
  /// In zh, this message translates to:
  /// **'增益'**
  String get skill_buff;

  /// No description provided for @skill_debuff.
  ///
  /// In zh, this message translates to:
  /// **'减益'**
  String get skill_debuff;

  /// No description provided for @skill_barrier.
  ///
  /// In zh, this message translates to:
  /// **'护盾'**
  String get skill_barrier;

  /// No description provided for @skill_damage.
  ///
  /// In zh, this message translates to:
  /// **'伤害'**
  String get skill_damage;

  /// No description provided for @skill_status_down.
  ///
  /// In zh, this message translates to:
  /// **'状态下降'**
  String get skill_status_down;

  /// No description provided for @skill_status_ub.
  ///
  /// In zh, this message translates to:
  /// **'己方使用连结爆发技能'**
  String get skill_status_ub;

  /// No description provided for @skill_action_type_desc_10_break.
  ///
  /// In zh, this message translates to:
  /// **'BREAK 期间，{arg1}{arg2}'**
  String skill_action_type_desc_10_break(String arg1, String arg2);

  /// No description provided for @skill_charm_0.
  ///
  /// In zh, this message translates to:
  /// **'魅惑'**
  String get skill_charm_0;

  /// No description provided for @skill_charm_1.
  ///
  /// In zh, this message translates to:
  /// **'混乱'**
  String get skill_charm_1;

  /// No description provided for @skill_action_type_desc_12_13.
  ///
  /// In zh, this message translates to:
  /// **'以 {arg1} 的概率使{arg2}进入{arg3}状态{arg4}'**
  String skill_action_type_desc_12_13(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_atk_miss.
  ///
  /// In zh, this message translates to:
  /// **'；对象进行物理攻击时有 [{arg1}%] 的概率被回避'**
  String skill_action_atk_miss(int arg1);

  /// No description provided for @skill_action_loop_change.
  ///
  /// In zh, this message translates to:
  /// **'技能循环改变{arg1}'**
  String skill_action_loop_change(String arg1);

  /// No description provided for @skill_action_change_mode.
  ///
  /// In zh, this message translates to:
  /// **'行动模式改变{arg1}{arg2}'**
  String skill_action_change_mode(String arg1, String arg2);

  /// No description provided for @skill_action_change_to_flight_status.
  ///
  /// In zh, this message translates to:
  /// **'，进入 [飞行] 状态'**
  String get skill_action_change_to_flight_status;

  /// No description provided for @skill_action_type_desc_14_2.
  ///
  /// In zh, this message translates to:
  /// **'行动模式改变，每秒降低 [{arg1}] TP'**
  String skill_action_type_desc_14_2(int arg1);

  /// No description provided for @skill_action_type_desc_14_3.
  ///
  /// In zh, this message translates to:
  /// **'效果结束后，切换回原行动模式'**
  String get skill_action_type_desc_14_3;

  /// No description provided for @skill_action_type_desc_15.
  ///
  /// In zh, this message translates to:
  /// **'在{arg1}{arg2} [{arg3}] 的位置{arg4}'**
  String skill_action_type_desc_15(
    String arg1,
    String arg2,
    int arg3,
    String arg4,
  );

  /// No description provided for @skill_action_summon_target.
  ///
  /// In zh, this message translates to:
  /// **'在{arg1}{arg2}'**
  String skill_action_summon_target(String arg1, String arg2);

  /// No description provided for @skill_action_summon_unit.
  ///
  /// In zh, this message translates to:
  /// **'，召唤友方单位'**
  String get skill_action_summon_unit;

  /// No description provided for @skill_action_tp_recovery.
  ///
  /// In zh, this message translates to:
  /// **'TP回复'**
  String get skill_action_tp_recovery;

  /// No description provided for @skill_action_tp_recovery_fix.
  ///
  /// In zh, this message translates to:
  /// **'TP回复（固定）'**
  String get skill_action_tp_recovery_fix;

  /// No description provided for @skill_action_tp_reduce.
  ///
  /// In zh, this message translates to:
  /// **'TP减少'**
  String get skill_action_tp_reduce;

  /// No description provided for @skill_action_condition.
  ///
  /// In zh, this message translates to:
  /// **'条件：{arg1}'**
  String skill_action_condition(String arg1);

  /// No description provided for @skill_action_type_desc_17_2.
  ///
  /// In zh, this message translates to:
  /// **'受到伤害时 [{arg1}%] 概率'**
  String skill_action_type_desc_17_2(int arg1);

  /// No description provided for @skill_action_type_desc_17_3.
  ///
  /// In zh, this message translates to:
  /// **'HP [{arg1}%] 以下'**
  String skill_action_type_desc_17_3(int arg1);

  /// No description provided for @skill_action_type_desc_17_4.
  ///
  /// In zh, this message translates to:
  /// **'死亡时 [{arg1}%] 概率'**
  String skill_action_type_desc_17_4(int arg1);

  /// No description provided for @skill_action_type_desc_17_5.
  ///
  /// In zh, this message translates to:
  /// **'暴击时 [{arg1}%] 概率'**
  String skill_action_type_desc_17_5(int arg1);

  /// No description provided for @skill_action_type_desc_17_7.
  ///
  /// In zh, this message translates to:
  /// **'战斗剩余时间 [{arg1}] 秒以下'**
  String skill_action_type_desc_17_7(int arg1);

  /// No description provided for @skill_action_type_desc_17_8.
  ///
  /// In zh, this message translates to:
  /// **'隐身时 [{arg1}%] 概率'**
  String skill_action_type_desc_17_8(int arg1);

  /// No description provided for @skill_action_type_desc_17_9.
  ///
  /// In zh, this message translates to:
  /// **'BREAK 时 [{arg1}%] 的概率{arg2}'**
  String skill_action_type_desc_17_9(int arg1, String arg2);

  /// No description provided for @skill_action_type_desc_17_10.
  ///
  /// In zh, this message translates to:
  /// **'受到持续伤害时 [{arg1}%] 概率'**
  String skill_action_type_desc_17_10(int arg1);

  /// No description provided for @skill_action_type_desc_17_11.
  ///
  /// In zh, this message translates to:
  /// **'所有部位 BREAK'**
  String get skill_action_type_desc_17_11;

  /// No description provided for @skill_action_type_desc_17_13.
  ///
  /// In zh, this message translates to:
  /// **'HP减少 [{arg1}] 时'**
  String skill_action_type_desc_17_13(int arg1);

  /// No description provided for @skill_action_type_desc_17_17.
  ///
  /// In zh, this message translates to:
  /// **'被击时 [{arg1}%] 概率触发'**
  String skill_action_type_desc_17_17(int arg1);

  /// No description provided for @skill_action_type_desc_18_19.
  ///
  /// In zh, this message translates to:
  /// **'蓄力 [{arg1}] 秒'**
  String skill_action_type_desc_18_19(String arg1);

  /// No description provided for @skill_action_type_desc_18_19_detail.
  ///
  /// In zh, this message translates to:
  /// **'，动作({arg1})效果增加 {arg2} * 蓄力中受到的伤害'**
  String skill_action_type_desc_18_19_detail(int arg1, String arg2);

  /// No description provided for @skill_action_type_desc_20.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}进入{arg2}状态{arg3}'**
  String skill_action_type_desc_20(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_21_1.
  ///
  /// In zh, this message translates to:
  /// **'无敌'**
  String get skill_action_type_desc_21_1;

  /// No description provided for @skill_action_type_desc_21_2.
  ///
  /// In zh, this message translates to:
  /// **'回避物理攻击'**
  String get skill_action_type_desc_21_2;

  /// No description provided for @skill_action_type_desc_21_3.
  ///
  /// In zh, this message translates to:
  /// **'回避所有攻击'**
  String get skill_action_type_desc_21_3;

  /// No description provided for @skill_action_type_desc_21_6.
  ///
  /// In zh, this message translates to:
  /// **'回避 BREAK'**
  String get skill_action_type_desc_21_6;

  /// No description provided for @skill_action_type_desc_21_8.
  ///
  /// In zh, this message translates to:
  /// **'回避魔法攻击'**
  String get skill_action_type_desc_21_8;

  /// No description provided for @skill_action_skill_anim_change.
  ///
  /// In zh, this message translates to:
  /// **'技能动画改变{arg1}'**
  String skill_action_skill_anim_change(String arg1);

  /// No description provided for @skill_action_if_status.
  ///
  /// In zh, this message translates to:
  /// **'当{arg1}在 [{arg2}] 时，使用动作({arg3})'**
  String skill_action_if_status(String arg1, String arg2, int arg3);

  /// No description provided for @skill_action_if_status_not.
  ///
  /// In zh, this message translates to:
  /// **'当{arg1}不在 [{arg2}] 时，使用动作({arg3})'**
  String skill_action_if_status_not(String arg1, String arg2, int arg3);

  /// No description provided for @skill_action_if_mark.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}持有标记时，使用动作({arg2})'**
  String skill_action_if_mark(String arg1, int arg2);

  /// No description provided for @skill_action_if_mark_not.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}未持有标记时，使用动作({arg2})'**
  String skill_action_if_mark_not(String arg1, int arg2);

  /// No description provided for @skill_action_if_mark_count.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}持有标记数量为 [{arg2}] 时，使用动作({arg3})'**
  String skill_action_if_mark_count(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_if_mark_count_not.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}持有标记数量不为 [{arg2}] 时，使用动作({arg3})'**
  String skill_action_if_mark_count_not(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_if_alone.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}仅剩一名时，使用动作({arg2})'**
  String skill_action_if_alone(String arg1, int arg2);

  /// No description provided for @skill_action_if_alone_not.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}多于一名时，使用动作({arg2})'**
  String skill_action_if_alone_not(String arg1, int arg2);

  /// No description provided for @skill_action_if_hp_below.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}的HP在 [{arg2}%] 以下时，使用动作({arg3})'**
  String skill_action_if_hp_below(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_if_hp_above.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}的HP在 [{arg2}%] 以上时，使用动作({arg3})'**
  String skill_action_if_hp_above(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_if_unit_atk_type.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}是 [{arg2}] 对象时，使用动作({arg3})'**
  String skill_action_if_unit_atk_type(String arg1, String arg2, int arg3);

  /// No description provided for @skill_action_random_1.
  ///
  /// In zh, this message translates to:
  /// **'随机：[{arg1}%] 的概率使用动作({arg2})，否则使用动作({arg3})'**
  String skill_action_random_1(int arg1, int arg2, int arg3);

  /// No description provided for @skill_action_random_2.
  ///
  /// In zh, this message translates to:
  /// **'随机：[{arg1}%] 的概率使用动作({arg2})'**
  String skill_action_random_2(int arg1, int arg2);

  /// No description provided for @skill_action_type_desc_24.
  ///
  /// In zh, this message translates to:
  /// **'复活{arg1}，并回复其 [{arg2}%] HP'**
  String skill_action_type_desc_24(String arg1, int arg2);

  /// No description provided for @skill_action_type_desc_additive.
  ///
  /// In zh, this message translates to:
  /// **'增加'**
  String get skill_action_type_desc_additive;

  /// No description provided for @skill_action_type_desc_subtract.
  ///
  /// In zh, this message translates to:
  /// **'减少'**
  String get skill_action_type_desc_subtract;

  /// No description provided for @skill_action_type_desc_multiple.
  ///
  /// In zh, this message translates to:
  /// **'乘以'**
  String get skill_action_type_desc_multiple;

  /// No description provided for @skill_action_type_desc_divide.
  ///
  /// In zh, this message translates to:
  /// **'除以'**
  String get skill_action_type_desc_divide;

  /// No description provided for @skill_action_change_coe.
  ///
  /// In zh, this message translates to:
  /// **'动作({arg1})的数值\'{\'{arg2}\'}\'{arg3} {arg4}'**
  String skill_action_change_coe(int arg1, int arg2, String arg3, String arg4);

  /// No description provided for @skill_action_limit.
  ///
  /// In zh, this message translates to:
  /// **'；叠加上限 {arg1}'**
  String skill_action_limit(String arg1);

  /// No description provided for @skill_action_limit_int.
  ///
  /// In zh, this message translates to:
  /// **'；叠加上限 [{arg1}]'**
  String skill_action_limit_int(int arg1);

  /// No description provided for @skill_action_damage_limit_int.
  ///
  /// In zh, this message translates to:
  /// **'；伤害上限 [{arg1}]'**
  String skill_action_damage_limit_int(int arg1);

  /// No description provided for @skill_action_change_coe_0.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [剩余的HP]'**
  String skill_action_change_coe_0(String arg1);

  /// No description provided for @skill_action_change_coe_1.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [损失的HP]'**
  String skill_action_change_coe_1(String arg1);

  /// No description provided for @skill_action_change_coe_2.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [击杀数量]'**
  String skill_action_change_coe_2(String arg1);

  /// No description provided for @skill_action_change_coe_4.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [{arg2}数量]'**
  String skill_action_change_coe_4(String arg1, String arg2);

  /// No description provided for @skill_action_change_coe_5.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [受到伤害的目标数量]'**
  String skill_action_change_coe_5(String arg1);

  /// No description provided for @skill_action_change_coe_6.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [造成的伤害]'**
  String skill_action_change_coe_6(String arg1);

  /// No description provided for @skill_action_change_coe_7_10.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [{arg2}的{arg3}]'**
  String skill_action_change_coe_7_10(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_change_coe_12.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [后方{arg2}数量]'**
  String skill_action_change_coe_12(String arg1, String arg2);

  /// No description provided for @skill_action_change_coe_13.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [损失的HP比例]'**
  String skill_action_change_coe_13(String arg1);

  /// No description provided for @skill_action_change_coe_15.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [{arg2}剩余HP]'**
  String skill_action_change_coe_15(String arg1, String arg2);

  /// No description provided for @skill_action_change_coe_16.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [{arg2}消耗的TP]'**
  String skill_action_change_coe_16(String arg1, String arg2);

  /// No description provided for @skill_action_change_coe_102.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [小眼球数量]'**
  String skill_action_change_coe_102(String arg1);

  /// No description provided for @skill_action_change_coe_skill_count.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [技能计数]'**
  String skill_action_change_coe_skill_count(String arg1);

  /// No description provided for @skill_action_change_coe_mark_count.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} * [标记层数]'**
  String skill_action_change_coe_mark_count(String arg1);

  /// No description provided for @skill_action_sp_if_rate.
  ///
  /// In zh, this message translates to:
  /// **'以 [{arg1}%] 的概率使用动作({arg2})'**
  String skill_action_sp_if_rate(int arg1, int arg2);

  /// No description provided for @skill_action_sp_if_dot.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}身上有持续伤害时，使用动作({arg2})'**
  String skill_action_sp_if_dot(String arg1, int arg2);

  /// No description provided for @skill_action_sp_if_dot_not.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}身上没有持续伤害时，使用动作({arg2})'**
  String skill_action_sp_if_dot_not(String arg1, int arg2);

  /// No description provided for @skill_action_sp_if_skill_count.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}的技能计数 ≥ [{arg2}] 时，使用动作({arg3})'**
  String skill_action_sp_if_skill_count(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_sp_if_skill_count_not.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}的技能计数 ﹤ [{arg2}] 时，使用动作({arg3})'**
  String skill_action_sp_if_skill_count_not(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_sp_if_mark_count.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}的标记层数 ≥ [{arg2}] 时，使用动作({arg3})'**
  String skill_action_sp_if_mark_count(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_sp_if_mark_count_not.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}的标记层数 ﹤ [{arg2}] 时，使用动作({arg3})'**
  String skill_action_sp_if_mark_count_not(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_sp_if_unit_count.
  ///
  /// In zh, this message translates to:
  /// **'隐身状态的单位除外，{arg1}的数量是 [{arg2}] 时，使用动作({arg3})'**
  String skill_action_sp_if_unit_count(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_sp_if_unit_count_not.
  ///
  /// In zh, this message translates to:
  /// **'隐身状态的单位除外，{arg1}的数量不是 [{arg2}] 时，使用动作({arg3})'**
  String skill_action_sp_if_unit_count_not(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_sp_if_unit_exist.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}中存在单位时，使用动作({arg2})'**
  String skill_action_sp_if_unit_exist(String arg1, int arg2);

  /// No description provided for @skill_action_sp_if_unit_exist_not.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}中不存在单位时，使用动作({arg2})'**
  String skill_action_sp_if_unit_exist_not(String arg1, int arg2);

  /// No description provided for @skill_action_sp_if_kill.
  ///
  /// In zh, this message translates to:
  /// **'上一个动作击杀了单位时，使用动作({arg1})'**
  String skill_action_sp_if_kill(int arg1);

  /// No description provided for @skill_action_sp_if_kill_not.
  ///
  /// In zh, this message translates to:
  /// **'上一个动作未击杀单位时，使用动作({arg1})'**
  String skill_action_sp_if_kill_not(int arg1);

  /// No description provided for @skill_action_sp_if_critical.
  ///
  /// In zh, this message translates to:
  /// **'技能暴击时，使用动作({arg1})'**
  String skill_action_sp_if_critical(int arg1);

  /// No description provided for @skill_action_sp_if_critical_not.
  ///
  /// In zh, this message translates to:
  /// **'技能未暴击时，使用动作({arg1})'**
  String skill_action_sp_if_critical_not(int arg1);

  /// No description provided for @skill_action_type_desc_29.
  ///
  /// In zh, this message translates to:
  /// **'无 UB 技能'**
  String get skill_action_type_desc_29;

  /// No description provided for @skill_action_type_desc_30.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}死亡'**
  String skill_action_type_desc_30(String arg1);

  /// No description provided for @skill_action_type_desc_32.
  ///
  /// In zh, this message translates to:
  /// **'为{arg1}的下 [{arg2}] 次攻击附加{arg3} {arg4} 的效果'**
  String skill_action_type_desc_32(
    String arg1,
    int arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_33.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}，受到{arg2}伤害时反弹 {arg3} 伤害{arg4}，生效 [{arg5}] 次'**
  String skill_action_type_desc_33(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    int arg5,
  );

  /// No description provided for @skill_action_type_desc_33_hp.
  ///
  /// In zh, this message translates to:
  /// **'，并回复HP'**
  String get skill_action_type_desc_33_hp;

  /// No description provided for @skill_action_type_desc_34.
  ///
  /// In zh, this message translates to:
  /// **'每次攻击当前的目标，将会追加伤害 {arg1}{arg2}'**
  String skill_action_type_desc_34(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_35.
  ///
  /// In zh, this message translates to:
  /// **'对{arg1}追加 [{arg2}] 层标记{arg3}{arg4}'**
  String skill_action_type_desc_35(
    String arg1,
    int arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_35_reduce.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}减少 [{arg2}] 层标记'**
  String skill_action_type_desc_35_reduce(String arg1, int arg2);

  /// No description provided for @skill_action_type_desc_36_damage.
  ///
  /// In zh, this message translates to:
  /// **'每秒造成 {arg1} {arg2}伤害'**
  String skill_action_type_desc_36_damage(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_field.
  ///
  /// In zh, this message translates to:
  /// **'展开{arg2}的领域，范围 [{arg1}]{arg3}'**
  String skill_action_type_desc_field(String arg2, int arg1, String arg3);

  /// No description provided for @skill_action_type_desc_37_heal.
  ///
  /// In zh, this message translates to:
  /// **'每秒回复 {arg1} HP'**
  String skill_action_type_desc_37_heal(String arg1);

  /// No description provided for @skill_action_type_desc_38_action.
  ///
  /// In zh, this message translates to:
  /// **'，持续施放动作({arg1})'**
  String skill_action_type_desc_38_action(int arg1);

  /// No description provided for @skill_action_type_desc_42_2.
  ///
  /// In zh, this message translates to:
  /// **'[{arg1}] 秒内受到伤害时，以 {arg2} 的概率使用动作({arg3})'**
  String skill_action_type_desc_42_2(int arg1, String arg2, int arg3);

  /// No description provided for @skill_action_type_desc_42_14.
  ///
  /// In zh, this message translates to:
  /// **'[{arg1}] 秒内受到无法行动、击飞、拉近伤害时，以 {arg2} 的概率使用{arg3}'**
  String skill_action_type_desc_42_14(int arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_44.
  ///
  /// In zh, this message translates to:
  /// **'战斗开始 [{arg1}] 秒后入场'**
  String skill_action_type_desc_44(int arg1);

  /// No description provided for @skill_action_type_desc_45.
  ///
  /// In zh, this message translates to:
  /// **'技能计数加 [1] {arg1}'**
  String skill_action_type_desc_45(String arg1);

  /// No description provided for @skill_action_type_desc_46_1.
  ///
  /// In zh, this message translates to:
  /// **'对{arg1}造成最大HP {arg2} 伤害'**
  String skill_action_type_desc_46_1(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_46_2.
  ///
  /// In zh, this message translates to:
  /// **'对{arg1}造成剩余HP {arg2} 伤害'**
  String skill_action_type_desc_46_2(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_46_3.
  ///
  /// In zh, this message translates to:
  /// **'对{arg1}造成初始最大HP {arg2} 伤害'**
  String skill_action_type_desc_46_3(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_47.
  ///
  /// In zh, this message translates to:
  /// **'对低等级的玩家造成的伤害将被减轻'**
  String get skill_action_type_desc_47;

  /// No description provided for @skill_action_type_desc_48.
  ///
  /// In zh, this message translates to:
  /// **'每秒回复{arg1}的 {arg2} {arg3}{arg4}'**
  String skill_action_type_desc_48(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_49.
  ///
  /// In zh, this message translates to:
  /// **'{arg1} 概率移除{arg2}的{arg3}'**
  String skill_action_type_desc_49(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_50.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}{arg2}{arg3}，受到 [{arg4}] 次伤害时中断'**
  String skill_action_type_desc_50(
    String arg1,
    String arg2,
    String arg3,
    int arg4,
  );

  /// No description provided for @skill_action_type_desc_52.
  ///
  /// In zh, this message translates to:
  /// **'将模型的宽度变为 [{arg1}]'**
  String skill_action_type_desc_52(int arg1);

  /// No description provided for @skill_action_type_desc_53.
  ///
  /// In zh, this message translates to:
  /// **'特定的领域效果存在时使用动作({arg1}){arg2}'**
  String skill_action_type_desc_53(int arg1, String arg2);

  /// No description provided for @skill_action_type_desc_53_2.
  ///
  /// In zh, this message translates to:
  /// **'，否则使用动作({arg1})'**
  String skill_action_type_desc_53_2(int arg1);

  /// No description provided for @skill_action_type_desc_54.
  ///
  /// In zh, this message translates to:
  /// **'进入隐身状态{arg1}'**
  String skill_action_type_desc_54(String arg1);

  /// No description provided for @skill_action_type_desc_55.
  ///
  /// In zh, this message translates to:
  /// **'使部位{arg1}向前移动 [{arg2}] ，随后使其返回原位置'**
  String skill_action_type_desc_55(int arg1, int arg2);

  /// No description provided for @skill_action_type_desc_56_1.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}的物理攻击必定被回避{arg2}'**
  String skill_action_type_desc_56_1(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_56_2.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}的下 {arg2} 次物理攻击必定被回避'**
  String skill_action_type_desc_56_2(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_57.
  ///
  /// In zh, this message translates to:
  /// **'对{arg1}设置倒计时，[{arg2}] 秒后触发动作({arg3})'**
  String skill_action_type_desc_57(String arg1, int arg2, int arg3);

  /// No description provided for @skill_action_type_desc_58.
  ///
  /// In zh, this message translates to:
  /// **'解除第{arg1}个技能的动作({arg2})展开的领域'**
  String skill_action_type_desc_58(int arg1, int arg2);

  /// No description provided for @skill_action_type_desc_59.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}，HP回复效果减少 [{arg2}%] {arg3}'**
  String skill_action_type_desc_59(String arg1, int arg2, String arg3);

  /// No description provided for @skill_action_type_desc_60_0.
  ///
  /// In zh, this message translates to:
  /// **'，追加 [1] 层标记{arg1}{arg2}'**
  String skill_action_type_desc_60_0(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_60_1.
  ///
  /// In zh, this message translates to:
  /// **'自身每次攻击{arg1}时{arg2}'**
  String skill_action_type_desc_60_1(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_60_2.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}每次造成伤害时{arg2}'**
  String skill_action_type_desc_60_2(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_60_3.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}每次造成暴击时{arg2}'**
  String skill_action_type_desc_60_3(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_60_4.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}每次攻击命中敌人时{arg2}'**
  String skill_action_type_desc_60_4(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_61.
  ///
  /// In zh, this message translates to:
  /// **'以 {arg1} 的概率使{arg2}进入{arg3}状态{arg4}'**
  String skill_action_type_desc_61(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_62_0.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}的UB对任意目标造成伤害或直接回复时，使其效果值降低 {arg2}{arg3}'**
  String skill_action_type_desc_62_0(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_62_1.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}的UB或技能对任意目标造成伤害或直接回复时，使其效果值降低 {arg2}{arg3}'**
  String skill_action_type_desc_62_1(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_63_success.
  ///
  /// In zh, this message translates to:
  /// **'持续时间结束后，使用动作({arg1})；'**
  String skill_action_type_desc_63_success(int arg1);

  /// No description provided for @skill_action_type_desc_63_failure.
  ///
  /// In zh, this message translates to:
  /// **'效果被中断后，使用动作({arg1})；'**
  String skill_action_type_desc_63_failure(int arg1);

  /// No description provided for @skill_action_type_desc_63.
  ///
  /// In zh, this message translates to:
  /// **'每 {arg1} 秒使用 1 次动作({arg2})，最长持续 [{arg3}] 秒；受到的伤害量超过 [{arg4}] 时中断此效果；'**
  String skill_action_type_desc_63(
    String arg1,
    int arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_69.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}变身{arg2}'**
  String skill_action_type_desc_69(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_71.
  ///
  /// In zh, this message translates to:
  /// **'赋予{arg1}「受到致死伤害时，回复 {arg2} HP」的效果{arg3}'**
  String skill_action_type_desc_71(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_72.
  ///
  /// In zh, this message translates to:
  /// **'赋予{arg1}承受{arg2}伤害减少{arg3}的效果{arg4}'**
  String skill_action_type_desc_72(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_73.
  ///
  /// In zh, this message translates to:
  /// **'为{arg1}展开护盾，在单个动作中受到的伤害超过 [{arg2}] 时，伤害值将衰减{arg3}'**
  String skill_action_type_desc_73(String arg1, int arg2, String arg3);

  /// No description provided for @skill_action_type_desc_75.
  ///
  /// In zh, this message translates to:
  /// **'每造成 [{arg1}] 次伤害时，触发动作({arg2}) {arg3}'**
  String skill_action_type_desc_75(int arg1, int arg2, String arg3);

  /// No description provided for @skill_action_type_desc_76.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}治疗量变为原来的 {arg2}{arg3}'**
  String skill_action_type_desc_76(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_77.
  ///
  /// In zh, this message translates to:
  /// **'每当{arg1} [{arg2}] 时，为自身追加 [{arg3}] 层标记{arg4}{arg5}'**
  String skill_action_type_desc_77(
    String arg1,
    String arg2,
    int arg3,
    String arg4,
    String arg5,
  );

  /// No description provided for @skill_action_type_desc_77_1.
  ///
  /// In zh, this message translates to:
  /// **'受到'**
  String get skill_action_type_desc_77_1;

  /// No description provided for @skill_action_type_desc_78.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}受到的伤害额外{arg2} {arg3} 倍{arg4}{arg5}'**
  String skill_action_type_desc_78(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    String arg5,
  );

  /// No description provided for @skill_action_type_desc_78_1.
  ///
  /// In zh, this message translates to:
  /// **'减益和异常状态数量'**
  String get skill_action_type_desc_78_1;

  /// No description provided for @skill_action_type_desc_79.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}行动时，受到{arg2} {arg3} 伤害{arg4}{arg5}'**
  String skill_action_type_desc_79(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
    String arg5,
  );

  /// No description provided for @skill_action_type_desc_81.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}变更为无法被攻击的目标'**
  String skill_action_type_desc_81(String arg1);

  /// No description provided for @skill_action_type_desc_90.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}{arg2}提升 {arg3}'**
  String skill_action_type_desc_90(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_901.
  ///
  /// In zh, this message translates to:
  /// **'战斗开始时生效'**
  String get skill_action_type_desc_901;

  /// No description provided for @skill_action_type_desc_902.
  ///
  /// In zh, this message translates to:
  /// **'战斗时间剩余{arg1}秒时生效'**
  String skill_action_type_desc_902(String arg1);

  /// No description provided for @skill_action_type_desc_92.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}受击获得的TP变更为初始值的 [{arg2}] 倍'**
  String skill_action_type_desc_92(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_93.
  ///
  /// In zh, this message translates to:
  /// **'攻击{arg1}时，无视挑衅效果'**
  String skill_action_type_desc_93(String arg1);

  /// No description provided for @skill_action_type_desc_94.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}附加技能特效'**
  String skill_action_type_desc_94(String arg1);

  /// No description provided for @skill_action_type_desc_95.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}进入隐匿状态{arg2}'**
  String skill_action_type_desc_95(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_96_tp.
  ///
  /// In zh, this message translates to:
  /// **'每秒回复 {arg1} TP'**
  String skill_action_type_desc_96_tp(String arg1);

  /// No description provided for @skill_action_type_desc_97.
  ///
  /// In zh, this message translates to:
  /// **'；受击时减少 [1] 层标记，TP回复 [{arg1}]'**
  String skill_action_type_desc_97(int arg1);

  /// No description provided for @skill_action_type_desc_98.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}受到TP降低时，效果变更为初始值的 [{arg2}] 倍{arg3}'**
  String skill_action_type_desc_98(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_100.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}免疫 [无法行动] 异常状态{arg2}{arg3}'**
  String skill_action_type_desc_100(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_100_count.
  ///
  /// In zh, this message translates to:
  /// **' [{arg1}] 次'**
  String skill_action_type_desc_100_count(int arg1);

  /// No description provided for @skill_action_type_desc_101.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}攻击时，对敌人追加 [{arg2}] 层标记{arg3}{arg4}'**
  String skill_action_type_desc_101(
    String arg1,
    int arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_101_reduce.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}攻击时，敌人减少 [{arg2}] 层标记'**
  String skill_action_type_desc_101_reduce(String arg1, int arg2);

  /// No description provided for @skill_action_type_desc_103.
  ///
  /// In zh, this message translates to:
  /// **'动作({arg1})造成的伤害将依据{arg2}的攻击力'**
  String skill_action_type_desc_103(int arg1, String arg2);

  /// No description provided for @skill_action_type_unknown.
  ///
  /// In zh, this message translates to:
  /// **'{arg1}目标：{arg2}；类型：{arg3}；数值：{arg4}{arg5}'**
  String skill_action_type_unknown(
    String arg1,
    String arg2,
    int arg3,
    String arg4,
    String arg5,
  );

  /// No description provided for @skill_action_type_desc_105.
  ///
  /// In zh, this message translates to:
  /// **'发动 [{arg1}] 环境效果{arg2}'**
  String skill_action_type_desc_105(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_106.
  ///
  /// In zh, this message translates to:
  /// **'赋予{arg1} [{arg2}] 状态，并代替其承受伤害{arg3}'**
  String skill_action_type_desc_106(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_106_type_common.
  ///
  /// In zh, this message translates to:
  /// **'守护'**
  String get skill_action_type_desc_106_type_common;

  /// No description provided for @skill_action_type_desc_106_type_141.
  ///
  /// In zh, this message translates to:
  /// **'堕天使的守护'**
  String get skill_action_type_desc_106_type_141;

  /// No description provided for @skill_action_type_desc_107.
  ///
  /// In zh, this message translates to:
  /// **'动作({arg1})暴击率依据物理暴击与魔法暴击之和'**
  String skill_action_type_desc_107(int arg1);

  /// No description provided for @skill_action_type_desc_110.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}受到持续伤害{arg2}时，伤害提升 [{arg3}] 倍{arg4}'**
  String skill_action_type_desc_110(
    String arg1,
    String arg2,
    String arg3,
    String arg4,
  );

  /// No description provided for @skill_action_type_desc_111.
  ///
  /// In zh, this message translates to:
  /// **'当{arg1}{arg2}时，使用动作({arg3})'**
  String skill_action_type_desc_111(String arg1, String arg2, int arg3);

  /// No description provided for @skill_action_type_desc_111_1.
  ///
  /// In zh, this message translates to:
  /// **'当{arg1}标记数量 {arg2} [{arg3}] 时，使用动作({arg4})'**
  String skill_action_type_desc_111_1(
    String arg1,
    String arg2,
    int arg3,
    int arg4,
  );

  /// No description provided for @skill_action_type_desc_111_2.
  ///
  /// In zh, this message translates to:
  /// **'受到暴击伤害'**
  String get skill_action_type_desc_111_2;

  /// No description provided for @skill_action_type_desc_114.
  ///
  /// In zh, this message translates to:
  /// **'对{arg1}追加 [{arg2}] 层标记，{arg3}，受到伤害时，减少 [1] 层标记，并使用动作({arg4})和动作({arg5}){arg6}'**
  String skill_action_type_desc_114(
    String arg1,
    int arg2,
    String arg3,
    int arg4,
    int arg5,
    String arg6,
  );

  /// No description provided for @skill_action_type_desc_114_aura.
  ///
  /// In zh, this message translates to:
  /// **'己方受到的伤害降低 [{arg1}%]'**
  String skill_action_type_desc_114_aura(int arg1);

  /// No description provided for @skill_action_type_desc_116_121_123_124.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}进入 [{arg2}] 状态{arg3}'**
  String skill_action_type_desc_116_121_123_124(
    String arg1,
    String arg2,
    String arg3,
  );

  /// No description provided for @skill_action_type_desc_123_1.
  ///
  /// In zh, this message translates to:
  /// **'受到的伤害减少{arg1}'**
  String skill_action_type_desc_123_1(String arg1);

  /// No description provided for @skill_action_type_desc_125.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}进入 [{arg2}] 状态（持有标记时，不会成为攻击目标）'**
  String skill_action_type_desc_125(String arg1, String arg2);

  /// No description provided for @skill_action_type_desc_128.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}受到的持续伤害的间隔和时间延长 [{arg2}] 倍{arg3}'**
  String skill_action_type_desc_128(String arg1, int arg2, String arg3);

  /// No description provided for @skill_action_type_desc_129.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}受到的 {arg2} 伤害转化为持续伤害{arg3}；该持续伤害不回复 TP'**
  String skill_action_type_desc_129(String arg1, String arg2, String arg3);

  /// No description provided for @skill_action_type_desc_130.
  ///
  /// In zh, this message translates to:
  /// **'使{arg1}受到伤害时，按物理/魔法防御中较高的防御计算伤害'**
  String skill_action_type_desc_130(String arg1);

  /// No description provided for @skill_ailment_1.
  ///
  /// In zh, this message translates to:
  /// **'减速'**
  String get skill_ailment_1;

  /// No description provided for @skill_ailment_2.
  ///
  /// In zh, this message translates to:
  /// **'加速'**
  String get skill_ailment_2;

  /// No description provided for @skill_ailment_3.
  ///
  /// In zh, this message translates to:
  /// **'麻痹'**
  String get skill_ailment_3;

  /// No description provided for @skill_ailment_4.
  ///
  /// In zh, this message translates to:
  /// **'冻结'**
  String get skill_ailment_4;

  /// No description provided for @skill_ailment_5.
  ///
  /// In zh, this message translates to:
  /// **'束缚'**
  String get skill_ailment_5;

  /// No description provided for @skill_ailment_6.
  ///
  /// In zh, this message translates to:
  /// **'睡眠'**
  String get skill_ailment_6;

  /// No description provided for @skill_ailment_7_12_14.
  ///
  /// In zh, this message translates to:
  /// **'眩晕'**
  String get skill_ailment_7_12_14;

  /// No description provided for @skill_ailment_8.
  ///
  /// In zh, this message translates to:
  /// **'石化'**
  String get skill_ailment_8;

  /// No description provided for @skill_ailment_9.
  ///
  /// In zh, this message translates to:
  /// **'拘留'**
  String get skill_ailment_9;

  /// No description provided for @skill_ailment_10.
  ///
  /// In zh, this message translates to:
  /// **'昏迷'**
  String get skill_ailment_10;

  /// No description provided for @skill_ailment_11.
  ///
  /// In zh, this message translates to:
  /// **'时间停止'**
  String get skill_ailment_11;

  /// No description provided for @skill_ailment_13.
  ///
  /// In zh, this message translates to:
  /// **'结晶'**
  String get skill_ailment_13;

  /// No description provided for @skill_ailment_extra.
  ///
  /// In zh, this message translates to:
  /// **'(额外)'**
  String get skill_ailment_extra;

  /// No description provided for @skill_ailment_field.
  ///
  /// In zh, this message translates to:
  /// **'(范围)'**
  String get skill_ailment_field;

  /// No description provided for @skill_dot_0.
  ///
  /// In zh, this message translates to:
  /// **'拘留(造成伤害)'**
  String get skill_dot_0;

  /// No description provided for @skill_dot_1_7.
  ///
  /// In zh, this message translates to:
  /// **'中毒'**
  String get skill_dot_1_7;

  /// No description provided for @skill_dot_2.
  ///
  /// In zh, this message translates to:
  /// **'烧伤'**
  String get skill_dot_2;

  /// No description provided for @skill_dot_3_8.
  ///
  /// In zh, this message translates to:
  /// **'诅咒'**
  String get skill_dot_3_8;

  /// No description provided for @skill_dot_4.
  ///
  /// In zh, this message translates to:
  /// **'猛毒'**
  String get skill_dot_4;

  /// No description provided for @skill_dot_5.
  ///
  /// In zh, this message translates to:
  /// **'咒术'**
  String get skill_dot_5;

  /// No description provided for @skill_dot_9.
  ///
  /// In zh, this message translates to:
  /// **'黑炎'**
  String get skill_dot_9;

  /// No description provided for @skill_dot_11.
  ///
  /// In zh, this message translates to:
  /// **'绝怠灵度'**
  String get skill_dot_11;

  /// No description provided for @attr_hp.
  ///
  /// In zh, this message translates to:
  /// **'HP'**
  String get attr_hp;

  /// No description provided for @attr_life_steal.
  ///
  /// In zh, this message translates to:
  /// **'HP吸收'**
  String get attr_life_steal;

  /// No description provided for @attr_atk.
  ///
  /// In zh, this message translates to:
  /// **'物理攻击力'**
  String get attr_atk;

  /// No description provided for @attr_magic_str.
  ///
  /// In zh, this message translates to:
  /// **'魔法攻击力'**
  String get attr_magic_str;

  /// No description provided for @attr_def.
  ///
  /// In zh, this message translates to:
  /// **'物理防御力'**
  String get attr_def;

  /// No description provided for @attr_magic_def.
  ///
  /// In zh, this message translates to:
  /// **'魔法防御力'**
  String get attr_magic_def;

  /// No description provided for @attr_physical_critical.
  ///
  /// In zh, this message translates to:
  /// **'物理暴击'**
  String get attr_physical_critical;

  /// No description provided for @attr_magic_critical.
  ///
  /// In zh, this message translates to:
  /// **'魔法暴击'**
  String get attr_magic_critical;

  /// No description provided for @attr_physical_penetrate.
  ///
  /// In zh, this message translates to:
  /// **'物理穿透'**
  String get attr_physical_penetrate;

  /// No description provided for @attr_magic_penetrate.
  ///
  /// In zh, this message translates to:
  /// **'魔法穿透'**
  String get attr_magic_penetrate;

  /// No description provided for @attr_accuracy.
  ///
  /// In zh, this message translates to:
  /// **'命中'**
  String get attr_accuracy;

  /// No description provided for @attr_dodge.
  ///
  /// In zh, this message translates to:
  /// **'回避'**
  String get attr_dodge;

  /// No description provided for @attr_wave_hp_recovery.
  ///
  /// In zh, this message translates to:
  /// **'HP回复'**
  String get attr_wave_hp_recovery;

  /// No description provided for @attr_hp_recovery_rate.
  ///
  /// In zh, this message translates to:
  /// **'回复上升'**
  String get attr_hp_recovery_rate;

  /// No description provided for @attr_wave_energy_recovery.
  ///
  /// In zh, this message translates to:
  /// **'TP回复'**
  String get attr_wave_energy_recovery;

  /// No description provided for @attr_energy_recovery_rate.
  ///
  /// In zh, this message translates to:
  /// **'TP上升'**
  String get attr_energy_recovery_rate;

  /// No description provided for @attr_energy_reduce_rate.
  ///
  /// In zh, this message translates to:
  /// **'TP减少'**
  String get attr_energy_reduce_rate;

  /// No description provided for @attr_tp.
  ///
  /// In zh, this message translates to:
  /// **'TP'**
  String get attr_tp;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
