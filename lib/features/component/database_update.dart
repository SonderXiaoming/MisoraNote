import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/custom_dialog.dart';
import 'package:misora_note/l10n/app_localizations.dart';

Future<void> updateDatabase(
  WidgetRef ref,
  BuildContext context,
  String? newVersion,
) async {
  final t = AppLocalizations.of(context)!;
  try {
    await ProgressDialog.show(
      context,
      title: t.database_updating,
      task: (updateProgress) async {
        final area = ref.read(databaseAreaProvider);
        final db = ref.read(dbProvider);
        await db.close(); // 关闭现有数据库连接
        await updatePcrDatabase(
          area.value!,
          onProgress: (received, total) {
            if (total > 0) {
              final progress = received / total;
              updateProgress(progress, null);
            }
          },
        );
        ref.invalidate(dbProvider); // 使 dbProvider 重新创建数据库实例
        await ref.read(dbProvider).init();

        // 更新完成，设置版本号
        if (newVersion != null) {
          ref.read(currentDbVersionProvider.notifier).set(newVersion);
        } else {
          ref.invalidate(currentDbVersionProvider);
        }
      },
    );

    // 显示成功信息
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.database_update_success)));
    }
  } catch (e) {
    // 显示错误信息
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${t.database_update_fail} $e')));
    }
    rethrow;
  }
}

class DatabaseUpdateDialog extends ConsumerWidget {
  final String? newVersion;

  const DatabaseUpdateDialog({super.key, required this.newVersion});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbVersion = ref.watch(currentDbVersionProvider);
    final area = ref.watch(databaseAreaProvider);
    final t = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(t.database_update),
      content: dbVersion.when(
        loading: () => const SizedBox(
          height: 80,
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (error, _) => Text(t.database_version_fetch_failed),
        data: (currentVersion) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.database_current_version(currentVersion ?? t.unknown)),
            Text(t.database_new_version(newVersion ?? t.unknown)),
            const SizedBox(height: 12),
            Text(t.database_server(area.value?.name ?? t.unknown)),
            const SizedBox(height: 12),
            Text(
              currentVersion == newVersion
                  ? t.already_latest_version
                  : t.database_update_hint,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.close),
        ),
        dbVersion.when(
          loading: () => const SizedBox.shrink(),
          error: (_, _) => const SizedBox.shrink(),
          data: (currentVersion) => currentVersion == newVersion
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: () async {
                    await updateDatabase(ref, context, newVersion);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(t.database_update),
                ),
        ),
      ],
    );
  }
}
