import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/network/download.dart';
import 'package:misora_note/features/component/progress_dialog.dart';

Future<void> updateDatabase(
  WidgetRef ref,
  BuildContext context,
  String? newVersion,
) async {
  try {
    await ProgressDialog.show(
      context,
      title: '正在更新数据库',
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
          ref.read(currentDbVersionProvider.notifier).setVersion(newVersion);
        } else {
          ref.invalidate(currentDbVersionProvider);
        }
      },
    );

    // 显示成功信息
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('数据库更新成功')));
    }
  } catch (e) {
    // 显示错误信息
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('数据库更新失败: $e')));
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

    return AlertDialog(
      title: const Text('数据库更新'),
      content: dbVersion.when(
        loading: () => const SizedBox(
          height: 80,
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (error, _) => const Text('无法获取版本信息，请检查网络连接'),
        data: (currentVersion) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('当前版本: $currentVersion'),
            Text('最新版本: $newVersion'),
            const SizedBox(height: 12),
            Text('服务器: ${area.value?.name ?? "未知"}'),
            const SizedBox(height: 12),
            Text(
              currentVersion == newVersion ? '当前已是最新版本' : '有新版本可用，建议更新以获取最新数据',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('关闭'),
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
                  child: const Text('更新数据库'),
                ),
        ),
      ],
    );
  }
}
