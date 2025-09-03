// widgets/smart_cached_image.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import '../storage/cache.dart';

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

  Future<Color> getDominantColor() async {
    try {
      final provider = CachedNetworkImageProvider(
        url,
        cacheManager: ImageCacheManager.instance,
      );
      final palette = await PaletteGenerator.fromImageProvider(
        provider,
        size: Size(width, height),
      );
      return palette.dominantColor?.color ?? Colors.transparent;
    } catch (_) {
      return Colors.transparent;
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
          (ctx, _, __) =>
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
}
