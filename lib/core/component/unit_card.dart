import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanna_note/core/component/image.dart';
import 'package:kanna_note/core/component/shape.dart';
import 'package:kanna_note/core/db/model.dart';
import 'package:kanna_note/constants.dart';
import 'package:kanna_note/core/utils/util.dart';

class UnitCard extends StatefulWidget {
  final UnitInfo unitInfo;
  final bool isR6;
  final (double, double) size;
  const UnitCard({
    super.key,
    required this.unitInfo,
    this.isR6 = true,
    this.size = const (1408, 792),
  });

  @override
  State<UnitCard> createState() => _UnitCardState();
}

class _UnitCardState extends State<UnitCard> {
  late final CachedImage unitImage;
  late final String imageUrl;
  Color colorDomain = Colors.transparent;
  Color colorVibrant = Colors.transparent;

  @override
  void initState() {
    super.initState();
    imageUrl = FetchUrl.fullcardUrl(
      longUnitId2Short(widget.unitInfo.unitId),
      widget.isR6 ? 6 : 3,
    );
    unitImage = CachedImage(
      url: imageUrl,
      width: widget.size.$1,
      height: widget.size.$2,
      borderRadius: BorderRadius.circular(8),
    );
    Future.microtask(() async {
      final (domain, vibrant) = await unitImage.getDominantColor();
      if (mounted) {
        setState(() {
          colorDomain = domain;
          colorVibrant = vibrant;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var textColor = Color(CustomColors.colorWhite);
    final textStyle = TextStyle(
      fontSize: widget.size.$2 * 0.06,
      fontWeight: FontWeight.w500,
      color: textColor,
    );
    return GestureDetector(
      onTap: () {
        context.push('/unit/${widget.unitInfo.unitId}', extra: widget.unitInfo);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: widget.size.$1,
          height: widget.size.$2,
          child: Stack(
            children: [
              unitImage,
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: ClipPath(
                  clipper: TrapezoidClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft, // 渐变开始方向
                        end: Alignment.bottomRight, // 渐变结束方向
                        colors: [
                          colorDomain.withAlpha(100),
                          colorVibrant.withAlpha(200),
                        ],
                      ),
                    ),
                    height: unitImage.height,
                    width: unitImage.width * (1 - ratioGolden),
                  ),
                ),
              ),
              //名称
              Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  widget.unitInfo.unitName,
                  style: TextStyle(
                    fontSize: widget.size.$2 * 0.1,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 6,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: widget.size.$1 * 0.03,
                top: widget.size.$2 * 0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // 整列右对齐
                  children: [
                    Text(
                      "${widget.unitInfo.ageInt == -1 ? "???" : widget.unitInfo.ageInt}",
                      style: textStyle,
                    ),
                    Text(
                      "${widget.unitInfo.weightInt == -1 ? "?" : widget.unitInfo.weightInt} KG",
                      style: textStyle,
                    ),
                    Text(
                      "${widget.unitInfo.heightInt == -1 ? "?" : widget.unitInfo.heightInt} CM",
                      style: textStyle,
                    ),
                    Text(
                      widget.unitInfo.birthMonthInt == -1 ||
                              widget.unitInfo.birthDayInt == -1
                          ? "???"
                          : "${widget.unitInfo.birthMonthInt} 月 ${widget.unitInfo.birthDayInt} 日",
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: widget.size.$1 * 0.03,
                top: widget.size.$2 * 0.8,
                child: Text(
                  widget.unitInfo.unitStartTime.split(" ").first,
                  style: textStyle.copyWith(
                    fontSize: widget.size.$2 * 0.05,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
