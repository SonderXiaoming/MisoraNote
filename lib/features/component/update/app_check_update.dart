import 'dart:io';

import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/network/base.dart';
import 'package:misora_note/core/network/response_model.dart';
import 'package:misora_note/features/component/update/app_update_installer.dart';
import 'package:misora_note/features/component/update/app_version.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

const githubLatestReleaseUrl =
    'https://api.github.com/repos/$githubOwner/$githubRepo/releases/latest';

Future<LatestAppVersionResponse?> fetchLatestRelease() async {
  try {
    return await apiClient.get(
      githubLatestReleaseUrl,
      headers: const {
        'User-Agent': 'flutter-app-update-checker',
        'Accept': 'application/vnd.github+json',
      },
      fromJson: LatestAppVersionResponse.fromJson,
    );
  } catch (_) {
    return null;
  }
}

enum UpdatePlatform { android, windows, macOS, linux, iOS, unsupported }

UpdatePlatform get currentUpdatePlatform {
  if (Platform.isAndroid) return UpdatePlatform.android;
  if (Platform.isWindows) return UpdatePlatform.windows;
  if (Platform.isMacOS) return UpdatePlatform.macOS;
  if (Platform.isLinux) return UpdatePlatform.linux;
  if (Platform.isIOS) return UpdatePlatform.iOS;
  return UpdatePlatform.unsupported;
}

class GithubUpdateService extends StatefulWidget {
  final LatestAppVersionResponse? newer;

  const GithubUpdateService({super.key, required this.newer});

  bool checkUpdate(String? currentVersion) {
    if (newer == null) return false;
    final version = newer!.tagName.isNotEmpty ? newer!.tagName : newer!.name;
    return hasAppUpdate(currentVersion, version);
  }

  static bool pick(
    AppAsset asset,
    List<String> extensions, {
    List<String> nameHints = const [],
  }) {
    final lower = asset.name.toLowerCase();
    final matchesExtension = extensions.any(
      (extension) => lower.endsWith(extension.toLowerCase()),
    );
    final matchesHint =
        nameHints.isEmpty ||
        nameHints.any((hint) => lower.contains(hint.toLowerCase()));
    return matchesExtension && matchesHint;
  }

  static AppAsset? _find(
    List<AppAsset> assets,
    List<String> extensions, {
    List<String> nameHints = const [],
  }) {
    for (final asset in assets) {
      if (pick(asset, extensions, nameHints: nameHints)) return asset;
    }
    return null;
  }

  static AppAsset? chooseForPlatform(
    List<AppAsset> assets,
    UpdatePlatform platform,
  ) {
    switch (platform) {
      case UpdatePlatform.android:
        return _find(assets, const ['.apk'], nameHints: const ['_android']) ??
            _find(assets, const ['.apk'], nameHints: const ['arm64-v8a']) ??
            _find(assets, const ['.apk']);
      case UpdatePlatform.windows:
        return _find(assets, const ['.exe'], nameHints: const ['setup']) ??
            _find(assets, const ['.exe']) ??
            _find(assets, const ['.msi']) ??
            _find(assets, const ['.zip'], nameHints: const ['windows']);
      case UpdatePlatform.macOS:
        return _find(assets, const ['.dmg']) ?? _find(assets, const ['.pkg']);
      case UpdatePlatform.linux:
        return _find(assets, const [
          '.appimage',
          '.deb',
          '.rpm',
          '.tar.gz',
          '.tar.xz',
        ]);
      case UpdatePlatform.iOS:
        return _find(
              assets,
              const ['.ipa'],
              nameHints: const ['ios_unsigned'],
            ) ??
            _find(assets, const ['.ipa']);
      case UpdatePlatform.unsupported:
        return null;
    }
  }

  static AppAsset? choose(List<AppAsset> assets) =>
      chooseForPlatform(assets, currentUpdatePlatform);

  static Future<String?> getDownloadUrl(LatestAppVersionResponse newer) async {
    return choose(newer.assets)?.browserDownloadUrl;
  }

  @override
  State<GithubUpdateService> createState() => _GithubUpdateServiceState();
}

class _GithubUpdateServiceState extends State<GithubUpdateService> {
  bool _downloading = false;
  int _received = 0;
  int _total = 0;

  Future<void> _startUpdate() async {
    final t = AppLocalizations.of(context)!;
    final newer = widget.newer;
    if (newer == null) return;

    final asset = GithubUpdateService.choose(newer.assets);
    if (asset == null) {
      _showMessage(t.no_update_package);
      return;
    }

    if (Platform.isIOS) {
      try {
        final opened = await launchUrl(
          Uri.parse(asset.browserDownloadUrl),
          mode: LaunchMode.externalApplication,
        );
        if (!opened && mounted) {
          _showMessage('${t.can_not_launch_url}: ${asset.browserDownloadUrl}');
        }
      } catch (error) {
        if (mounted) _showMessage('${t.can_not_launch_url}: $error');
      }
      return;
    }

    setState(() {
      _downloading = true;
      _received = 0;
      _total = 0;
    });

    try {
      await downloadAndOpenUpdate(
        asset,
        onProgress: (received, total) {
          if (!mounted) return;
          setState(() {
            _received = received;
            _total = total;
          });
        },
      );
      if (mounted) _showMessage(t.opening_installer);
    } catch (error) {
      if (mounted) _showMessage('${t.download_failed}: $error');
    } finally {
      if (mounted) setState(() => _downloading = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final newer = widget.newer;
    if (newer == null) {
      return AlertDialog(
        title: Text(t.check_update),
        content: Text(t.latest_version),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.close),
          ),
        ],
      );
    }

    final version = newer.tagName.isNotEmpty ? newer.tagName : newer.name;
    final progress = _total > 0 ? _received / _total : null;
    return AlertDialog(
      title: Text(t.find_new_version(version)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (newer.body.trim().isNotEmpty)
              Text(newer.body.trim())
            else
              Text(t.new_version_log),
            if (Platform.isIOS) ...[
              const SizedBox(height: 16),
              Text(t.ios_unsigned_update_hint),
            ],
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _downloading ? null : _startUpdate,
              icon: const Icon(Icons.download_rounded),
              label: Text(Platform.isIOS ? t.download : t.download_and_update),
            ),
            if (_downloading) ...[
              const SizedBox(height: 16),
              LinearProgressIndicator(value: progress),
              const SizedBox(height: 8),
              Text(
                progress == null
                    ? t.downloading_update
                    : t.download_progress((progress * 100).round()),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _downloading ? null : () => Navigator.of(context).pop(),
          child: Text(t.close),
        ),
      ],
    );
  }
}
