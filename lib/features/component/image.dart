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
        placeholderBuilder: (ctx) =>
            Center(child: Icon(Icons.image, size: width * 0.7)),
      );
    } else {
      image = Image.asset(
        safePath,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            Center(child: Icon(Icons.broken_image_outlined, size: width * 0.7)),
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
      placeholder: (ctx, _) => const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      errorWidget: (ctx, error, stackTrace) =>
          const Center(child: Icon(Icons.broken_image_outlined)),
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
