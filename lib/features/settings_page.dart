import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/tag.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:misora_note/core/di/di.dart";
import 'package:misora_note/core/network/download.dart';
import 'package:misora_note/features/component/progress_dialog.dart';

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

  // 获取当前值的显示文本
  String getCurrentDisplayText() {
    final currentItem = items.firstWhere(
      (item) => item.$1 == currentValue,
      orElse: () => (currentValue, '未知'),
    );
    return currentItem.$2;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaWidth = MediaQuery.of(context).size.width;

    return ListTile(
      title: Text(title, style: textTheme.titleMedium),
      trailing: PopupMenuButton<T?>(
        onSelected: (T? value) async {
          if (value != null) {
            await onSelected(value);
          }
        },
        offset: Offset(0, 45),
        color: Color(CustomColors.colorWhite),
        itemBuilder: (BuildContext context) => items.map((child) {
          return PopupMenuItem<T?>(
            value: child.$1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  child.$2,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: child.$1 == currentValue
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: child.$1 == currentValue
                        ? Color(CustomColors.colorPrimary)
                        : null,
                  ),
                ),
                SizedBox(width: mediaWidth / 7),
              ],
            ),
          );
        }).toList(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(getCurrentDisplayText(), style: textTheme.bodyMedium),
              SizedBox(width: mediaWidth / 7),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey[600],
                size: 18,
              ),
            ],
          ),
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
  bool _isUpdating = false;

  Future<void> _startUpdateWithDialog(String? newVersion) async {
    if (_isUpdating) return;

    setState(() {
      _isUpdating = true;
    });

    try {
      await ProgressDialog.show(
        context,
        title: '正在更新数据库',
        task: (updateProgress) async {
          final area = ref.read(databaseAreaProvider);

          await updatePcrDatabase(
            area.value!,
            onProgress: (received, total) {
              if (total > 0 && mounted) {
                final progress = received / total;
                updateProgress(progress, null);
              }
            },
          );

          await ref.read(dbProvider).init();

          // 更新完成，设置版本号
          if (newVersion != null) {
            ref.read(currentDbVersionProvider.notifier).setVersion(newVersion);
          } else {
            // 强制更新情况，刷新版本信息
            ref.invalidate(currentDbVersionProvider);
          }
        },
      );

      // 显示成功信息
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('数据库更新成功')));
      }
    } catch (e) {
      // 显示错误信息
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('数据库更新失败: $e')));
      }
    } finally {
      setState(() {
        _isUpdating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final packageInfo = ref.watch(packageInfoProvider);
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
        useOldVersion.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final version = packageInfo.value?.version ?? 'Unknown';

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
            title: "应用设置",
            children: [
              DropDownSettings<String>(
                title: "语言",
                items: [("zh", "中文"), ("en", "英文")],
                onSelected: (value) async {
                  await ref.read(languageProvider.notifier).setLanguage(value);
                },
                currentValue: language.value,
              ),
            ],
          ),

          SizedBox(height: 16),

          SubSettingsPage(
            title: "数据库设置",
            children: [
              DropDownSettings<Area>(
                title: "数据库区域",
                items: [(Area.cn, "国服"), (Area.tw, "台服"), (Area.jp, "日服")],
                onSelected: (value) async {
                  ref.read(databaseAreaProvider.notifier).setArea(value);
                },
                currentValue: area.value,
              ),
              CheckSettings(
                title: "版本 ${dbVersion.value ?? ''}",
                child: IconButton(
                  onPressed: !_isUpdating
                      ? () async {
                          final latestVersion = await checkDatabaseUpdate(
                            area.value!,
                          );
                          if (latestVersion == null) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text('检查更新失败')));
                            }
                            return;
                          }
                          if (latestVersion != dbVersion.value) {
                            // 有新版本，显示弹窗询问是否更新
                            final shouldUpdate = await showDialog<bool>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('发现新版本'),
                                  content: Text(
                                    '发现新版本: $latestVersion\n当前版本: ${dbVersion.value}\n\n是否立即更新数据库？',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: Text('取消'),
                                    ),
                                    FilledButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Color(
                                          CustomColors.colorPrimary,
                                        ),
                                      ),
                                      child: Text('更新'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (shouldUpdate == true) {
                              _startUpdateWithDialog(latestVersion);
                            }
                          } else {
                            // 已是最新版本，显示弹窗询问是否强制更新
                            final shouldForceUpdate = await showDialog<bool>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('当前已是最新版本'),
                                  content: Text(
                                    '当前版本: ${dbVersion.value}\n\n是否强制重新下载数据库？',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: Text('取消'),
                                    ),
                                    FilledButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Color(
                                          CustomColors.colorPrimary,
                                        ),
                                      ),
                                      child: Text('强制更新'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (shouldForceUpdate == true) {
                              _startUpdateWithDialog(latestVersion);
                            }
                          }
                        }
                      : null,
                  icon: Icon(Icons.refresh),
                  tooltip: '检查更新',
                ),
              ),
              CheckSettings(
                title: "强制刷新",
                child: IconButton(
                  onPressed: !_isUpdating
                      ? () async {
                          _startUpdateWithDialog(null);
                        }
                      : null,
                  icon: Icon(Icons.refresh),
                ),
              ),
              SwitchSettings(
                title: "启用历史版本",
                value: useOldVersion.value!,
                onChanged: (bool newValue) {
                  ref.read(useOldVersionProvider.notifier).set(newValue);
                },
              ),
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
                      title: "自动检测更新",
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

          SizedBox(height: 32),
        ],
      ),
    );
  }
}
