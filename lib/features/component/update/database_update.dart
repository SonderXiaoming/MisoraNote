import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/custom_dialog.dart';
import 'package:misora_note/l10n/app_localizations.dart';

String? normalizeDatabaseVersion(String? version) {
  final normalized = version?.trim();
  return normalized == null || normalized.isEmpty ? null : normalized;
}

bool hasDatabaseUpdate(String? currentVersion, String? latestVersion) {
  final latest = normalizeDatabaseVersion(latestVersion);
  if (latest == null) return false;
  return normalizeDatabaseVersion(currentVersion) != latest;
}

bool _databaseUpdateInProgress = false;

Future<void> updateDatabase(
  WidgetRef ref,
  BuildContext context,
  String? newVersion,
) async {
  if (_databaseUpdateInProgress) return;
  _databaseUpdateInProgress = true;
  final t = AppLocalizations.of(context)!;
  var connectionClosed = false;
  try {
    await ProgressDialog.show(
      context,
      title: t.database_updating,
      task: (updateProgress) async {
        // 等待 area 加载完成
        final area = await ref.read(databaseAreaProvider.future);
        final downloadedVersion = await updatePcrDatabase(
          area,
          beforeReplace: () async {
            await ref.read(dbProvider).close();
            connectionClosed = true;
          },
          afterReplace: () async {
            ref.invalidate(dbProvider);
            final replacement = ref.read(dbProvider);
            try {
              await replacement.init();
            } catch (_) {
              await replacement.close();
              rethrow;
            }
          },
          onProgress: (received, total) {
            if (total > 0) {
              final progress = received / total;
              updateProgress(progress, null);
            }
          },
        );
        // Metadata may have changed since the update dialog was opened.
        await ref
            .read(currentDbVersionProvider.notifier)
            .set(downloadedVersion);
      },
    );

    // 显示成功信息
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.database_update_success)));
    }
  } catch (e) {
    // installDatabaseFile has restored the old file if activation failed.
    if (connectionClosed) {
      ref.invalidate(dbProvider);
      try {
        await ref.read(dbProvider).init();
      } catch (_) {
        // The original file may already have been corrupt. Keep the update
        // error so the user can retry downloading it.
      }
    }
    // 显示错误信息
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${t.database_update_fail} $e')));
    }
    rethrow;
  } finally {
    _databaseUpdateInProgress = false;
  }
}

class DatabaseUpdateService extends ConsumerWidget {
  final String? newVersion;

  const DatabaseUpdateService({super.key, required this.newVersion});

  bool checkUpdate(String? currentVersion) {
    return hasDatabaseUpdate(currentVersion, newVersion);
  }

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
        data: (currentVersion) {
          final needsUpdate = hasDatabaseUpdate(currentVersion, newVersion);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t.database_current_version(currentVersion ?? t.unknown)),
              Text(t.database_new_version(newVersion ?? t.unknown)),
              const SizedBox(height: 12),
              Text(t.database_server(area.value?.name ?? t.unknown)),
              const SizedBox(height: 12),
              Text(
                needsUpdate ? t.database_update_hint : t.already_latest_version,
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.close),
        ),
        dbVersion.when(
          loading: () => const SizedBox.shrink(),
          error: (_, _) => const SizedBox.shrink(),
          data: (currentVersion) =>
              !hasDatabaseUpdate(currentVersion, newVersion)
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
