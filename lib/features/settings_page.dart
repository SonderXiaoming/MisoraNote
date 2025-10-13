import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/custom_dialog.dart';
import 'package:misora_note/features/component/drop_drown.dart';
import 'package:misora_note/features/component/update/app_check_update.dart';
import 'package:misora_note/features/component/update/database_update.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/tag.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:misora_note/core/di/di.dart";

class DropDownSettings<T> extends StatelessWidget {
  final List<(T?, String)> items;
  final String title;
  final T? currentValue;
  final Future<void> Function(T) onSelected;

  const DropDownSettings({
    super.key,
    required this.title,
    required this.items,
    required this.onSelected,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaWidth = MediaQuery.of(context).size.width;

    return ListTile(
      title: Text(title, style: textTheme.titleMedium),
      trailing: SizedBox(
        width: mediaWidth / 6,
        child: DropdownWithRadio<T>(
          showLeadingDot: false,
          label: title,
          value: currentValue,
          items: items,
          onChanged: (value) async {
            if (value != null) {
              await onSelected(value);
            }
          },
        ),
      ),
    );
  }
}

class SwitchSettings extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchSettings({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(title, style: textTheme.titleMedium),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Color(CustomColors.colorPrimary),
      ),
    );
  }
}

class CheckSettings extends StatelessWidget {
  final String title;
  final Widget child;

  const CheckSettings({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(title, style: textTheme.titleMedium),
      trailing: child,
    );
  }
}

class SubSettingsPage extends ConsumerStatefulWidget {
  final String title;
  final List<Widget> children;
  const SubSettingsPage({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubSettingsPageState();
}

class _SubSettingsPageState extends ConsumerState<SubSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
          child: Text(
            widget.title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Color(CustomColors.colorPrimary),
            ),
          ),
        ),
        BaseCard(
          border: Border.all(
            color: Color(CustomColors.colorGray).withAlpha(50),
          ),
          child: Column(
            children: widget.children.map((child) {
              return Column(
                children: [
                  SizedBox(height: 8),
                  child,
                  child != widget.children.last
                      ? Divider(
                          height: 1,
                          thickness: 0.5,
                          color: Color(CustomColors.colorGray).withAlpha(80),
                          indent: 16,
                        )
                      : SizedBox(height: 8),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final packageInfo = ref.watch(packageInfoProvider);
    final appAutoUpdate = ref.watch(appAutoUpdateProvider);
    final language = ref.watch(languageProvider);
    final area = ref.watch(databaseAreaProvider);
    final dbVersion = ref.watch(currentDbVersionProvider);
    final autoUpdate = ref.watch(databaseAutoUpdateProvider);
    final useOldVersion = ref.watch(useOldVersionProvider);
    if (packageInfo.isLoading ||
        language.isLoading ||
        area.isLoading ||
        dbVersion.isLoading ||
        autoUpdate.isLoading ||
        useOldVersion.isLoading ||
        appAutoUpdate.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final version = packageInfo.value?.version ?? t.unknown;

    return Scaffold(
      body: ListView(
        children: [
          // 应用信息区域
          Container(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Text(
                  '${t.app_name} v$version',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color(CustomColors.colorPrimary),
                  ),
                ),
                SizedBox(height: 12),
                LocalImage(path: '${FilePath.img}/icon.png'),
              ],
            ),
          ),

          SizedBox(height: 16),

          SubSettingsPage(
            title: t.app_settings,
            children: [
              DropDownSettings<String>(
                title: t.language,
                items: Language.values
                    .map((lang) => (lang.code, Language.getDisplayName(lang)))
                    .toList(),
                onSelected: (value) async {
                  await ref.read(languageProvider.notifier).set(value);
                },
                currentValue: language.value,
              ),
              CheckSettings(
                title: "${t.version}: $version",
                child: IconButton(
                  onPressed: () async {
                    // 显示加载提示
                    final newer = await LoadingDialog.show(
                      context,
                      title: t.checking_update,
                      task: fetchLatestRelease(),
                    );
                    await showDialog<Widget>(
                      context: context,
                      builder: (BuildContext context) {
                        return GithubUpdateService(newer: newer);
                      },
                    );
                  },
                  icon: Icon(Icons.update),
                ),
              ),
              SwitchSettings(
                title: t.app_check_auto_update,
                value: appAutoUpdate.value!,
                onChanged: (bool newValue) {
                  ref.read(appAutoUpdateProvider.notifier).set(newValue);
                },
              ),
            ],
          ),

          SizedBox(height: 16),

          SubSettingsPage(
            title: t.database_settings,
            children: [
              DropDownSettings<Area>(
                title: t.database_area,
                items: [
                  (Area.cn, t.cn_server),
                  (Area.tw, t.tw_server),
                  (Area.jp, t.jp_server),
                ],
                onSelected: (value) async {
                  ref.read(databaseAreaProvider.notifier).set(value);
                },
                currentValue: area.value,
              ),
              CheckSettings(
                title: "${t.database_last_update} ${dbVersion.value ?? ''}",
                child: IconButton(
                  onPressed: () async {
                    final latestVersion = await LoadingDialog.show(
                      context,
                      title: t.checking_update,
                      task: checkDatabaseUpdate(area.value!),
                    );
                    if (latestVersion == null) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.checking_update_failed)),
                        );
                      }
                      return;
                    }
                    await showDialog<Widget>(
                      context: context,
                      builder: (BuildContext context) {
                        return DatabaseUpdateService(newVersion: latestVersion);
                      },
                    );
                  },

                  icon: Icon(Icons.refresh),
                ),
              ),
              CheckSettings(
                title: t.force_update,
                child: IconButton(
                  onPressed: () async {
                    final latestVersion = await LoadingDialog.show(
                      context,
                      title: t.checking_update,
                      task: checkDatabaseUpdate(area.value!),
                    );
                    if (latestVersion == null) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.checking_update_failed)),
                        );
                      }
                      return;
                    }
                    await updateDatabase(ref, context, latestVersion);
                  },
                  icon: Icon(Icons.refresh),
                ),
              ),
              /*
              SwitchSettings(
                title: "启用历史版本",
                value: useOldVersion.value!,
                onChanged: (bool newValue) {
                  ref.read(useOldVersionProvider.notifier).set(newValue);
                },
              ),
              */
              useOldVersion.value!
                  ? DropDownSettings<String>(
                      title: "历史版本",
                      items: [
                        ("v1.0", "v1.0"),
                        ("v1.1", "v1.1"),
                        ("v2.0", "v2.0"),
                      ],
                      onSelected: (value) async {
                        // TODO: handle version selection
                      },
                      currentValue: null,
                    )
                  : SwitchSettings(
                      title: t.auto_check_update,
                      value: autoUpdate.value!,
                      onChanged: (bool newValue) {
                        ref
                            .read(databaseAutoUpdateProvider.notifier)
                            .set(newValue);
                      },
                    ),
              // Example data for "历史版本" dropdown
            ],
          ),

          SizedBox(height: 16),

          SubSettingsPage(
            title: t.restore,
            children: [
              CheckSettings(
                title: t.restore_settings,
                child: IconButton(
                  onPressed: () async {
                    await ref.read(resetPrefsProvider);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(t.restore_settings_success)),
                      );
                    }
                  },
                  icon: Icon(Icons.settings_backup_restore),
                ),
              ),
            ],
          ),

          SizedBox(height: 32),
        ],
      ),
    );
  }
}
