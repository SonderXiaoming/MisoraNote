// widgets/smart_cached_image.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/storage/cache.dart';

class LocalImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const LocalImage({
    super.key,
    required this.path,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final safePath = path.replaceAll('\\', '/');
    Widget image;
    if (safePath.toLowerCase().endsWith('.svg')) {
      image = SvgPicture.asset(
        safePath,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (ctx) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade100,
          child: Center(
            child: Icon(
              Icons.image,
              size: width * 0.3,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      );
    } else {
      image = Image.asset(
        safePath,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image_not_supported_outlined,
                size: width * 0.3,
                color: Colors.grey.shade400,
              ),
              if (height > 60) ...[
                const SizedBox(height: 4),
                Text(
                  '文件不存在',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: SizedBox(width: width, height: height, child: image),
      );
    }
    return SizedBox(width: width, height: height, child: image);
  }
}

class CachedImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const CachedImage({
    super.key,
    required this.url,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  static final Map<String, (Color, Color)> _cache = {};

  Future<(Color, Color)> getDominantColor() async {
    if (_cache.containsKey(url)) {
      return _cache[url]!;
    }
    try {
      final provider = CachedNetworkImageProvider(
        url,
        cacheManager: ImageCacheManager.instance,
      );
      final scheme = await ColorScheme.fromImageProvider(provider: provider);
      final res = (scheme.surfaceBright, scheme.primary);
      _cache[url] = res;
      return _cache[url]!;
    } catch (_) {
      return (Colors.transparent, Colors.transparent);
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: url,
      cacheManager: ImageCacheManager.instance,
      fit: fit,
      placeholder: (ctx, _) => Container(
        width: width,
        height: height,
        color: Colors.grey.shade100,
        child: const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
      errorWidget: (ctx, error, stackTrace) {
        // 根据错误类型显示不同的错误提示
        IconData iconData;
        String errorMsg;

        if (error.toString().contains('404') ||
            error.toString().contains('Not Found')) {
          iconData = Icons.image_not_supported_outlined;
          errorMsg = '图片不存在';
        } else if (error.toString().contains('timeout') ||
            error.toString().contains('network')) {
          iconData = Icons.wifi_off_outlined;
          errorMsg = '网络错误';
        } else {
          iconData = Icons.broken_image_outlined;
          errorMsg = '加载失败';
        }

        return Container(
          width: width,
          height: height,
          color: Colors.grey.shade50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: width * 0.3,
                color: Colors.grey.shade400,
              ),
              if (height > 60) ...[
                const SizedBox(height: 4),
                Text(
                  errorMsg,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: SizedBox(width: width, height: height, child: image),
      );
    }
    return SizedBox(width: width, height: height, child: image);
  }

  CachedImage copyWith({
    String? url,
    double? width,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius,
  }) {
    return CachedImage(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
