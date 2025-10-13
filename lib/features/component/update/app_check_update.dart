// update_service.dart
import 'dart:io';
import 'package:misora_note/core/network/response_model.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/network/base.dart';
import 'package:flutter/material.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://api.github.com/repos/$githubOwner/$githubRepo/latest';

Future<LatestAppVersionResponse?> fetchLatestRelease() async {
  try {
    final response = await apiClient.get(
      url,
      headers: {
        // GitHub 要求带一个 User-Agent
        'User-Agent': 'flutter-app-update-checker',
        'Accept': 'application/vnd.github+json',
      },
      fromJson: LatestAppVersionResponse.fromJson,
    );
    return response;
  } catch (e) {
    return null;
  }
}

class GithubUpdateService extends StatelessWidget {
  final LatestAppVersionResponse? newer;
  const GithubUpdateService({super.key, required this.newer});

  bool checkUpdate(String? currentVersion) {
    if (newer == null) return false;
    final version = newer!.tag_name.isNotEmpty ? newer!.tag_name : newer!.name;
    return version != currentVersion;
  }

  // 你也可以根据 CPU 架构进一步区分：Platform.version / Platform.environment
  static bool pick(
    AppAsset a,
    List<String> exts, {
    List<String> nameHints = const [],
  }) {
    final lower = a.name.toLowerCase();
    final matchExt = exts.any((e) => lower.endsWith(e));
    final matchHint =
        nameHints.isEmpty || nameHints.any((h) => lower.contains(h));
    return matchExt && matchHint;
  }

  static AppAsset? choose(List<AppAsset> assets) {
    final isWin = Platform.isWindows;
    final isMac = Platform.isMacOS;
    final isAndroid = Platform.isAndroid;
    final isLinux = Platform.isLinux;

    if (isAndroid) {
      // 优先 .apk；如果你也发 .aab，这里仍建议给 .apk 直链
      return assets.firstWhere((a) => pick(a, ['.apk']));
    }

    if (isWin) {
      // 先找 .msi，再找 .exe（看你的发布习惯）
      final msi = assets.where((a) => pick(a, ['.msi'])).toList();
      if (msi.isNotEmpty) return msi.first;
      final exe = assets.where((a) => pick(a, ['.exe'])).toList();
      if (exe.isNotEmpty) return exe.first;
      // 兜底：zip 便携版
      final zip = assets.where((a) => pick(a, ['.zip'])).toList();
      if (zip.isNotEmpty) return zip.first;
    }

    if (isMac) {
      // 先 .dmg，再 .pkg；如果你发了架构区分，可在 nameHints 带上 'arm64'/'x64'
      final dmg = assets.where((a) => pick(a, ['.dmg'])).toList();
      if (dmg.isNotEmpty) return dmg.first;
      final pkg = assets.where((a) => pick(a, ['.pkg'])).toList();
      if (pkg.isNotEmpty) return pkg.first;
    }

    if (isLinux) {
      // 常见：.AppImage / .deb / .rpm / .tar.gz
      for (final ext in ['.AppImage', '.deb', '.rpm', '.tar.gz', '.tar.xz']) {
        final hit = assets.firstWhere((a) => a.name.endsWith(ext));
        return hit;
      }
    }
    return null;
  }

  static Future<String?> getDownloadUrl(LatestAppVersionResponse newer) async {
    final asset = choose(newer.assets);
    return asset?.browser_download_url;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    if (newer != null) {
      final version = newer!.tag_name.isNotEmpty
          ? newer!.tag_name
          : newer!.name;
      return AlertDialog(
        title: Text(t.find_new_version(version)),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (newer!.body.trim().isNotEmpty)
                Text(newer!.body.trim())
              else
                Text(t.new_version_log),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final url = await GithubUpdateService.getDownloadUrl(newer!);
                  if (url != null) {
                    // 使用 url_launcher 打开下载链接
                    final Uri uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      // 如果无法打开链接，显示错误信息
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${t.can_not_launch_url}: $url"),
                        ),
                      );
                    }
                  }
                },
                child: Text(t.download),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(t.close),
          ),
        ],
      );
    }
    return AlertDialog(
      title: Text(t.check_update),
      content: Text(t.latest_version),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(t.close),
        ),
      ],
    );
  }
}
