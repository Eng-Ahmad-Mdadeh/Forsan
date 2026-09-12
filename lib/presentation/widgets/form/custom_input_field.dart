import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes_imports.dart';
import 'package:forsan/presentation/widgets/custom_text_from_field.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class CustomInputField extends StatelessWidget {
  final bool req;
  final bool readOnly;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final bool unFocus;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onTapOutside;
  final String hintText;
  final String? title;
  final String? initialValue;
  final TextEditingController? controller;
  final bool showRiyal;
  final bool showPercentage;
  final bool showFlag;
  final bool showClock;
  final bool? isExpanded;
  final TextInputType? textInputType;
  final Widget? suffix;
  final int? maxLines;
  final int? maxLength;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? backgroundColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    this.req = false,
    this.readOnly = false,
    this.unFocus = false,
    this.validator,
    this.textDirection,
    this.textAlign,
    required this.hintText,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.title,
    this.initialValue,
    this.controller,
    this.showRiyal = false,
    this.showPercentage = false,
    this.showFlag = false,
    this.showClock = false,
    this.textInputType,
    this.suffix,
    this.maxLines,
    this.maxLength,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.backgroundColor,
    this.inputFormatters,
    this.isExpanded,
  }) : assert(
         (showRiyal ? 1 : 0) + (showPercentage ? 1 : 0) + (showClock ? 1 : 0) <= 1,
         'Only one of showRiyal, showPercentage, or showClock can be true',
       );

  @override
  Widget build(BuildContext context) {
    final inputHeight = height ?? (isExpanded ?? false ? null : AppHeight.h48);
    final minimumFieldHeight = inputHeight == null
        ? null
        : inputHeight + (validator == null ? 0 : AppHeight.h20);

    return Column(
      spacing: AppHeight.h4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          RichText(
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.medium,
                    color: AppColors.mainText,
                  ),
                ),
                if (req)
                  TextSpan(
                    text: ' *',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColors.red, fontSize: AppFontSize.s18),
                  ),
              ],
            ),
          ),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: minimumFieldHeight ?? 0, maxHeight: minimumFieldHeight ?? 0),
          child: showFlag
              ? Directionality(textDirection: TextDirection.ltr, child: _buildTextField())
              : _buildTextField(),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return CustomTextFromField(
      onTapOutside: onTapOutside,
      onFieldSubmitted: onFieldSubmitted,
      textDirection: textDirection,
      textAlign: textAlign,
      fontSize: fontSize,
      onChanged: onChanged,
      unFocus: unFocus,
      maxLines: maxLines,
      maxLength: maxLength,
      initialValue: initialValue,
      inputFormatters: inputFormatters ?? (showPercentage ? [PercentageInputFormatter()] : null),
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      color: backgroundColor ?? AppColors.backGround,
      contentPaddingTop: AppPaddingHeight.p10,
      contentPaddingStart: AppPaddingWidth.p10,
      contentPaddingEnd: AppPaddingWidth.p10,
      textInputType: showRiyal ? TextInputType.number : (textInputType ?? TextInputType.text),
      hintText: hintText,
      validator: validator,
      enableInputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.r7),
        borderSide: const BorderSide(color: AppColors.greyDivider, width: 0.7),
      ),
      focusedInputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.r7),
        borderSide: const BorderSide(color: AppColors.primary, width: 0.7),
      ),
      errorInputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r7),
        borderSide: const BorderSide(color: AppColors.red),
      ),
      borderRadius: borderRadius ?? AppRadius.r7,
      prefixIcon: showFlag
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: AppPaddingWidth.p12,
                    end: AppPaddingWidth.p7,
                    top: AppPaddingHeight.p12,
                    bottom: AppPaddingHeight.p12,
                  ),
                  child: ImageView(
                    imagePath: AppAssets.saudiFlag,
                    height: AppHeight.h25,
                    width: AppWidth.w25,
                    fit: BoxFit.cover,
                  ),
                ),
                BodyTitle(
                  text: "+966",
                  fontSize: AppFontSize.s14,
                  fontWeight: AppFontWeight.regular,
                  color: AppColors.greyText,
                ),
                SizedBox(width: AppWidth.w10),
              ],
            )
          : null,
      suffixIcon:
          suffix ??
          (showRiyal
              ? Transform.scale(
                  scale: .4,
                  child: ImageView(
                    imagePath: AppAssets.riyal,
                    color: AppColors.secondary,
                    width: AppWidth.w3,
                    fit: BoxFit.cover,
                  ),
                )
              : showPercentage
              ? Icon(Iconsax.percentage_circle_outline, color: AppColors.primary, size: AppSize.s27)
              : showClock
              ? Icon(Iconsax.clock_outline, color: AppColors.primary, size: AppSize.s27)
              : null),
    );
  }
}

class PercentageInputFormatter extends TextInputFormatter {
  static const arabicToEnglishDigits = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  String convertToEnglishDigits(String input) {
    return input.split('').map((char) => arabicToEnglishDigits[char] ?? char).join();
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (text.isEmpty) return newValue;

    // استبدال الأرقام العربية أو الهندية
    text = convertToEnglishDigits(text);

    // السماح برقم عشري واحد فقط
    if (RegExp(r'^(\d+)([.,])?(\d{0,2})?$').hasMatch(text)) {
      final normalized = text.replaceAll(',', '.');
      final double? value = double.tryParse(normalized);
      if (value != null && value >= 0 && value <= 100) {
        return newValue.copyWith(text: text);
      }
    }

    return oldValue;
  }
}
