import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/utils/enums/enum_utils.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class CompleteProfileDropdownField extends StatelessWidget {
  const CompleteProfileDropdownField({
    super.key,
    required this.title,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  final String title;
  final String hint;
  final List<CountryCode> items;
  final ValueChanged<CountryCode?> onChanged;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final itemNames = items
        .map((country) => country.displayName(isArabic: isArabic))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BodyTitle(
          text: title,
          textAlign: TextAlign.start,
          fontSize: AppFontSize.s15,
          fontWeight: AppFontWeight.bold,
          color: AppColors.primaryDark,
        ),
        SizedBox(height: AppHeight.h4),
        CustomDropDownWidget(
          items: itemNames,
          isStringList: true,
          hintText: hint,
          color: AppColors.white,
          height: AppHeight.h50,
          borderRadius: AppRadius.r7,
          closedBorder: const Border.fromBorderSide(
            BorderSide(color: AppColors.greyDivider, width: .7),
          ),
          onChanged: (value) {
            final selectedName = value as String?;
            onChanged(
              selectedName == null
                  ? null
                  : items.firstWhere(
                      (country) =>
                          country.displayName(isArabic: isArabic) ==
                          selectedName,
                    ),
            );
          },
        ),
      ],
    );
  }
}
