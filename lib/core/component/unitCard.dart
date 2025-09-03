import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kanna_note/core/component/image.dart';
import 'package:kanna_note/core/component/shape.dart';
import 'package:kanna_note/core/db/model.dart';
import 'package:kanna_note/constants.dart';

class UnitCard extends StatelessWidget {
  final UnitInfo unitInfo;
  final bool isR6;
  final (double, double) size;
  const UnitCard({super.key, required this.unitInfo, this.isR6 = true, this.size = const (100, 150)});

  @override
  Widget build(BuildContext context) {
    final unitImage = CachedImage(
      url: FetchUrl.fullcardUrl(unitInfo.unitId, isR6 ? 6 : 5),
      width: size.$1,
      height: size.$2,
      borderRadius: BorderRadius.circular(8),
    );
    //预览时，默认为 true
    
    //主色
    var initColor = CustomColors.colorWhite;
    //主要字体颜色
    var textColor = Theme.of(context).colorScheme.onSurface;
    return Card(
      elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
      clipBehavior: Clip.hardEdge, // 确保圆角裁剪生效
      child: Stack(
        children: [
          unitImage,
          Positioned.fill(
              child: ClipPath(
                clipper: TrapezoidClipper(),
                child: Container(
                  color: await unitImage.getDominantColor(),
                  height: unitImage.height,
                  width: unitImage.width * (1 - ratioGolden),
                ),
              )
              
        ],
      ),
    );

    MainCard(
        modifier = modifier
            .placeholder(characterInfo?.id == -1)
            .then(
                if (MainActivity.animOnFlag) {
                    Modifier.sharedElement(
                        sharedContentState = rememberSharedContentState(
                            key = "${SharedElementKey.CHARACTER_ITEM}$unitId"
                        ),
                        animatedVisibilityScope = animatedVisibilityScope,
                    )
                } else {
                    Modifier
                }
            ),
        onClick = onClick
    ) {
        Box(modifier = Modifier.height(IntrinsicSize.Min)) {
            //图片
            MainImage(
                data = ImageRequestHelper.getInstance().getMaxCardUrl(unitId),
                ratio = RATIO,
                contentScale = ContentScale.FillHeight,
                onError = { imageLoadError = true }
            ) { result ->
                imageLoadSuccess = true
                //取色
                val bitmap = ((result.image) as BitmapImage).bitmap
                Palette.from(bitmap).generate { palette ->
                    palette?.let {
                        cardMaskColor = Color(it.getDominantColor(Color.Transparent.toArgb()))
                    }
                }
            }
            if (characterInfo != null) {
                //名称阴影效果
                if (imageLoadSuccess) {
                    CharacterName(
                        color = MaterialTheme.colorScheme.primary,
                        character = characterInfo,
                        isBorder = true,
                        modifier = Modifier.align(Alignment.BottomStart)
                    )
                }
                //名称
                CharacterName(
                    color = textColor,
                    character = characterInfo,
                    isBorder = false,
                    modifier = Modifier.align(Alignment.BottomStart)
                )
            } else {
                //暂未登场
                if (imageLoadSuccess) {
                    CharacterName(
                        color = MaterialTheme.colorScheme.primary,
                        character = null,
                        isBorder = true,
                        modifier = Modifier.align(Alignment.BottomStart)
                    )
                }
                //名称
                CharacterName(
                    color = textColor,
                    character = null,
                    isBorder = false,
                    modifier = Modifier.align(Alignment.BottomStart)
                )
            }


            //其它信息
            FadeAnimation(
                visible = imageLoadSuccess || imageLoadError || LocalInspectionMode.current,
                modifier = Modifier.align(Alignment.CenterEnd)
            ) {
                //年龄等
                if (characterInfo != null) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth(1 - RATIO_GOLDEN)
                            .fillMaxHeight()
                            .clip(TrapezoidShape)
                            .background(
                                brush = Brush.linearGradient(
                                    colors = listOf(
                                        cardMaskColor,
                                        cardMaskColor,
                                        MaterialTheme.colorScheme.primary,
                                    )
                                ),
                                alpha = 0.6f
                            ),
                        horizontalAlignment = Alignment.End,
                    ) {
                        if (BuildConfig.DEBUG) {
                            CaptionText(text = characterInfo.id.toString())
                        }

                        Column(
                            modifier = Modifier
                                .padding(
                                    horizontal = Dimen.mediumPadding,
                                    vertical = Dimen.smallPadding
                                ),
                            horizontalAlignment = Alignment.End,
                            verticalArrangement = Arrangement.SpaceAround
                        ) {
                            //年龄
                            Subtitle2(
                                text = characterInfo.age.fixedStr,
                                fontWeight = FontWeight.Bold,
                                color = textColor
                            )
                            //体重
                            Subtitle2(
                                text = "${characterInfo.weight.fixedStr} KG",
                                fontWeight = FontWeight.Bold,
                                color = textColor
                            )
                            //身高
                            Subtitle2(
                                text = "${characterInfo.height.fixedStr} CM",
                                fontWeight = FontWeight.Bold,
                                color = textColor
                            )
                            //生日
                            Subtitle2(
                                text = stringResource(
                                    id = R.string.date_m_d,
                                    characterInfo.birthMonth.fixedStr,
                                    characterInfo.birthDay.fixedStr
                                ),
                                fontWeight = FontWeight.Bold,
                                color = textColor
                            )
                        }

                        //获取方式等
                        Box(
                            modifier = Modifier
                                .padding(end = Dimen.smallPadding)
                                .weight(1f),
                            contentAlignment = Alignment.BottomEnd
                        ) {
                            CharacterTagRow(
                                characterInfo = characterInfo,
                                horizontalArrangement = Arrangement.End
                            )
                        }

                        //最近登场日期
                        CaptionText(
                            text = characterInfo.startTime.formatTime.toDate,
                            color = textColor,
                            modifier = Modifier.padding(
                                end = Dimen.mediumPadding,
                                top = Dimen.mediumPadding,
                                bottom = Dimen.smallPadding
                            )
                        )
                    }
                }
            }

            //收藏标识
            FadeAnimation(visible = favorite && (imageLoadSuccess || imageLoadError)) {
                MainIcon(
                    data = MainIconType.FAVORITE_FILL,
                    size = Dimen.textIconSize,
                    modifier = Modifier.padding(Dimen.mediumPadding)
                )
            }
        }
    }
  }
}
