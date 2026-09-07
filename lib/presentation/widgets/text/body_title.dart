import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';

class BodyTitle extends StatelessWidget {
  const BodyTitle({
    super.key,
    this.text,
    this.textSpan,
    this.textAlign,
    this.color,
    this.fontSize,
    this.overflow,
    this.fontWeight,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
    this.maxLines,
    this.height,
  });

  final String? text;
  final InlineSpan? textSpan;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final Color? decorationColor;
  final double? decorationThickness;
  final int? maxLines;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: color ?? AppColors.blackText,
      fontSize: fontSize ?? AppFontSize.s14,
      fontWeight: fontWeight ?? AppFontWeight.medium,
      decoration: decoration,
      decorationStyle: decorationStyle,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness,
      height: height,
    );

    if (textSpan != null) {
      return Text.rich(
        textSpan!,
        softWrap: true,
        textAlign: textAlign,
        overflow: overflow ?? TextOverflow.ellipsis,
        maxLines: maxLines,
        style: style,
      );
    }

    return Text(
      text ?? '',
      softWrap: true,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      style: style,
    );
  }
}
