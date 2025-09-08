// widgets/smart_cached_image.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../core/storage/cache.dart';

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
      final palette = await PaletteGenerator.fromImageProvider(
        provider,
        size: Size(width, height),
      );
      _cache[url] = (
        palette.dominantColor?.color ?? Colors.transparent,
        palette.vibrantColor?.color ?? Colors.transparent,
      );
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
      placeholder:
          (ctx, _) => const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
      errorWidget:
          (ctx, _, _) => const Center(child: Icon(Icons.broken_image_outlined)),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: SizedBox(width: width, height: height, child: image),
      );
    }
    return SizedBox(width: width, height: height, child: image);
  }
}
