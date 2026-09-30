import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/presentation/widgets/custom_text_from_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class OrderPhoneField extends StatefulWidget {
  const OrderPhoneField({
    super.key,
    required this.label,
    required this.hint,
    this.initialCountryCode = 'SY',
    this.value,
    this.onChanged,
    this.isRequired = false,
  });

  final String label;
  final String hint;
  final String initialCountryCode;
  final String? value;
  final ValueChanged<String>? onChanged;
  final bool isRequired;

  @override
  State<OrderPhoneField> createState() => _OrderPhoneFieldState();
}

class _OrderPhoneFieldState extends State<OrderPhoneField> {
  late Country _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = Country.parse(widget.initialCountryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.mainText,
                  fontSize: AppFontSize.s14,
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              if (widget.isRequired)
                TextSpan(
                  text: ' *',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.red,
                    fontSize: AppFontSize.s18,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: AppHeight.h4),
        Directionality(
          textDirection: TextDirection.ltr,
          child: CustomTextFromField(
            maxLines: 1,
            textInputType: TextInputType.phone,
            textDirection: TextDirection.ltr,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.primary,
            cursorHeight: AppHeight.h20,
            fontSize: AppFontSize.s16,
            hintText: widget.hint,
            initialValue: widget.value,
            validator: widget.isRequired
                ? (value) => value == null || value.trim().isEmpty
                      ? context.loc.complete_profile_required_field
                      : null
                : null,
            reserveValidationSpace: false,
            onChanged: widget.onChanged,
            hintColor: AppColors.grey,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            contentPaddingTop: 0,
            contentPaddingBottom: 0,
            contentPaddingStart: AppPaddingWidth.p12,
            contentPaddingEnd: AppPaddingWidth.p12,
            prefixIcon: _CountryDialCode(
              country: _selectedCountry,
              onTap: _showCountryPicker,
            ),
            suffixIcon: Icon(
              LucideIcons.phone,
              size: AppFontSize.s16,
              color: AppColors.primaryDark,
            ),
            filled: true,
            color: AppColors.white,
            borderRadius: AppRadius.r7,
            enableInputBorder: _border(AppColors.lightGrey),
            focusedInputBorder: _border(AppColors.primary),
            errorInputBorder: _border(AppColors.red),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r7),
        borderSide: BorderSide(color: color),
      );

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: const ['SY'],
      onSelect: (country) => setState(() => _selectedCountry = country),
    );
  }
}

class _CountryDialCode extends StatelessWidget {
  const _CountryDialCode({required this.country, required this.onTap});

  final Country country;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPaddingWidth.p8,
          end: AppPaddingWidth.p8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(country.flagEmoji, style: TextStyle(fontSize: AppFontSize.s20)),
            SizedBox(width: AppWidth.w5),
            BodyTitle(
              text: '+${country.phoneCode}',
              fontSize: AppFontSize.s14,
              color: AppColors.mainText,
            ),
            SizedBox(width: AppWidth.w3),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: AppFontSize.s18,
              color: AppColors.greyText,
            ),
            SizedBox(width: AppWidth.w5),
            Container(width: 1, height: AppHeight.h24, color: AppColors.lightGrey),
          ],
        ),
      ),
    );
  }
}
