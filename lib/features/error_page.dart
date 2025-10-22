import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/custom_icon.dart';

/// 通用错误页面
class ErrorPage extends StatelessWidget {
  final String title;
  final String? message;
  final IconData icon;

  const ErrorPage({
    super.key,
    required this.title,
    this.message,
    this.icon = Icons.error_outline,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CustomIconButton(
          backgroundColor: HSLColor.fromColor(
            Color(CustomColors.colorPink),
          ).withLightness(0.95).toColor(),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
                color: Color(CustomColors.colorGray).withAlpha(150),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(CustomColors.colorPrimary),
                ),
                textAlign: TextAlign.center,
              ),
              if (message != null) ...[
                const SizedBox(height: 16),
                Text(
                  message!,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Color(CustomColors.colorGray),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
