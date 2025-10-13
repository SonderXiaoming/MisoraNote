import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';

class LoadingDialog extends StatelessWidget {
  final String title;
  const LoadingDialog({super.key, required this.title});

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    Future<T?>? task,
    bool autoClose = true,
  }) async {
    BuildContext? dialogContext;
    // 显示弹窗
    showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        dialogContext = ctx; // 保存弹窗的上下文
        return LoadingDialog(title: title);
      },
    );
    // 执行任务
    try {
      final result = await task;
      // 任务完成，关闭弹窗
      if (autoClose && dialogContext != null && dialogContext!.mounted) {
        Navigator.of(dialogContext!).pop(result);
      }
      return result;
    } catch (e) {
      // 出错时关闭弹窗
      if (dialogContext != null && dialogContext!.mounted) {
        Navigator.of(dialogContext!).pop();
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Row(
        children: [
          CircularProgressIndicator(color: Color(CustomColors.colorPrimary)),
          SizedBox(width: 16),
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}

class ProgressDialog extends StatefulWidget {
  final String title;
  final double progress;
  final String? message;

  const ProgressDialog({
    super.key,
    required this.title,
    required this.progress,
    this.message,
  });

  @override
  State<ProgressDialog> createState() => _ProgressDialogState();

  /// 显示进度弹窗的工具方法
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Future<T> Function(
      void Function(double progress, String? message) updateProgress,
    )
    task,
  }) async {
    double currentProgress = 0.0;
    String? currentMessage;
    late StateSetter dialogSetState;
    BuildContext? dialogContext;

    // 显示弹窗
    showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        dialogContext = ctx; // 保存弹窗的上下文
        return StatefulBuilder(
          builder: (context, setState) {
            dialogSetState = setState;
            return PopScope(
              canPop: false,
              child: ProgressDialog(
                title: title,
                progress: currentProgress,
                message: currentMessage,
              ),
            );
          },
        );
      },
    );

    // 执行任务
    try {
      final result = await task((progress, message) {
        currentProgress = progress;
        currentMessage = message;
        // 使用 Future.microtask 确保在下一个事件循环中更新UI
        Future.microtask(() {
          if (dialogContext != null && dialogContext!.mounted) {
            dialogSetState(() {});
          }
        });
      });

      // 任务完成，关闭弹窗
      if (dialogContext != null && dialogContext!.mounted) {
        Navigator.of(dialogContext!).pop(result);
      }

      return result;
    } catch (e) {
      // 出错时关闭弹窗
      if (dialogContext != null && dialogContext!.mounted) {
        Navigator.of(dialogContext!).pop();
      }
      rethrow;
    }
  }
}

class _ProgressDialogState extends State<ProgressDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: widget.progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              Color(CustomColors.colorPrimary),
            ),
          ),
          SizedBox(height: 16),
          Text(
            widget.message ?? '${(widget.progress * 100).toStringAsFixed(1)}%',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
