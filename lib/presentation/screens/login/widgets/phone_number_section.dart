import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/extension/validation_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes_imports.dart';
import 'package:forsan/presentation/cubit/auth/login/login_cubit.dart';
import 'package:forsan/presentation/cubit/code_check/code_check_cubit.dart';
import 'package:forsan/presentation/widgets/custom_text_from_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:iconamoon/iconamoon.dart';

class PhoneNumberSection extends StatefulWidget {
  const PhoneNumberSection({super.key});

  @override
  State<PhoneNumberSection> createState() => _PhoneNumberSectionState();
}

class _PhoneNumberSectionState extends State<PhoneNumberSection> {
  Country _selectedCountry = Country.parse('SY');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<CodeCheckCubit>().setType('sms', '+${_selectedCountry.phoneCode}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BodyTitle(text: 'رقم الجوال'),
        SizedBox(height: AppHeight.h8),
        Directionality(
          textDirection: TextDirection.ltr,
          child: CustomTextFromField(
            onChanged: (p0) {
              context.read<LoginCubit>().phoneChanged(p0);
              context.read<CodeCheckCubit>().setPhone(p0);
            },
            maxLines: 1,
            textInputType: TextInputType.phone,
            textDirection: TextDirection.ltr,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.primary,
            cursorHeight: AppHeight.h20,
            fontSize: AppFontSize.s16,
            hintText: '949 594 190',
            hintColor: AppColors.grey,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            contentPaddingTop: 0,
            contentPaddingBottom: 0,
            contentPaddingStart: AppPaddingWidth.p12,
            contentPaddingEnd: AppPaddingWidth.p12,
            prefixIcon: CountryDialCodePicker(country: _selectedCountry, onTap: _showCountryPicker),
            suffixIcon: Icon(Icons.phone, size: AppFontSize.s20,color: AppColors.primaryDark),
            filled: true,
            validator: (value) {
              if (value == null || value == '') {
                return context.loc.enter_valid_phone;
              } else if (!value.isValidPhone) {
                return context.loc.enter_valid_phone;
              }
              return null;
            },
            color: AppColors.white,
            borderRadius: AppRadius.r7,
            enableInputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.r7),
              borderSide: const BorderSide(color: AppColors.lightGrey),
            ),
            focusedInputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.r7),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorInputBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.r7),
              borderSide: const BorderSide(color: AppColors.red),
            ),
          ),
        ),
      ],
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: const ['SY'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: MediaQuery.sizeOf(context).height * .72,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        inputDecoration: InputDecoration(
          hintText: 'ابحث باسم الدولة أو رمز الاتصال',
          prefixIcon: const Icon(Icons.search_rounded),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.r10)),
        ),
      ),
      onSelect: (country) {
        setState(() => _selectedCountry = country);
        context.read<CodeCheckCubit>().setType('sms', '+${country.phoneCode}');
      },
    );
  }
}

class CountryDialCodePicker extends StatelessWidget {
  const CountryDialCodePicker({super.key, required this.country, required this.onTap});

  final Country country;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.r7),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: AppPaddingWidth.p8, end: AppPaddingWidth.p8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BodyTitle(text: country.flagEmoji, fontSize: AppFontSize.s20, overflow: TextOverflow.visible),
            SizedBox(width: AppWidth.w5),
            Padding(
              padding: EdgeInsets.only(top: AppPaddingHeight.p4),
              child: SectionTitle(text: '+${country.phoneCode}', fontSize: AppFontSize.s16, color: AppColors.greyText),
            ),
            SizedBox(width: AppWidth.w3),
            Icon(Icons.keyboard_arrow_down_rounded, size: AppFontSize.s18, color: AppColors.greyText),
            SizedBox(width: AppWidth.w5),
            Container(width: AppWidth.w1, height: AppHeight.h24, color: AppColors.lightGrey),
          ],
        ),
      ),
    );
  }
}
