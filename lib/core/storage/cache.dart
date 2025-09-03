import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCacheManager {
  static const _key = 'myImageCache';

  // 单例
  static final CacheManager instance = CacheManager(
    Config(
      _key,
      stalePeriod: const Duration(days: 15), // 缓存 15 天自动过期
      maxNrOfCacheObjects: 666, // 最多缓存 666 个文件（LRU 淘汰）
    ),
  );
}

class ImageCacheService {
  static CacheManager get _cm => ImageCacheManager.instance;

  /// 清空当前自定义缓存空间
  static Future<void> clearAll() async {
    await _cm.emptyCache();
  }

  /// 删除某个 URL 的缓存文件（如果存在）
  static Future<void> removeUrl(String url) async {
    await _cm.removeFile(url);
  }

  /// 预缓存（比如列表预加载）
  static Future<void> precache(BuildContext context, String url) async {
    final provider = CachedNetworkImageProvider(url, cacheManager: _cm);
    await precacheImage(provider, context);
  }

  /// 格式化显示大小
  static String fmtBytes(int bytes) {
    const units = ['B', 'KB', 'MB', 'GB'];
    double size = bytes.toDouble();
    int unit = 0;
    while (size >= 1024 && unit < units.length - 1) {
      size /= 1024;
      unit++;
    }
    return '${size.toStringAsFixed(1)} ${units[unit]}';
  }
}
