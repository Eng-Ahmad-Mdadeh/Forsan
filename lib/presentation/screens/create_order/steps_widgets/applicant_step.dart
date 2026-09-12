import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:icons_plus/icons_plus.dart';

class ApplicantStep extends StatefulWidget {
  const ApplicantStep({super.key});

  @override
  State<ApplicantStep> createState() => _ApplicantStepState();
}

class _ApplicantStepState extends State<ApplicantStep> {
  Country _selectedCountry = Country.parse('SY');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomInputField(
            title: 'اسم الأب',
            hintText: 'ادخل اسم الأب',
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h10),
          _buildDropdown(label: 'الجنسية', items: const ['ذكر', 'أنثى']),
          SizedBox(height: AppHeight.h10),
          const CustomInputField(
            title: 'رقم جواز السفر (اختياري)',
            hintText: 'ادخل رقم جواز السفر',
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h10),
          const CustomInputField(
            title: 'الرقم الوطني / رقم الهوية',
            hintText: 'ادخل الرقم الوطني / رقم الهوية',
            textInputType: TextInputType.number,
            backgroundColor: AppColors.white,
          ),
          SizedBox(height: AppHeight.h10),
          _buildDropdown(label: 'الجنسية', items: const ['سورية', 'غير سورية']),
          SizedBox(height: AppHeight.h10),
          _buildPhoneField(label: 'رقم الجوال', hint: '000 000 000'),
          SizedBox(height: AppHeight.h10),
          _buildPhoneField(
            label: 'رقم واتساب',
            hint: 'اتركه فارغاً إذا كان نفس رقم الجوال',
          ),
          SizedBox(height: AppHeight.h10),
          const CustomInputField(
            title: 'البريد الإلكتروني',
            hintText: 'ادخل البريد الإلكتروني',
            textInputType: TextInputType.emailAddress,
            backgroundColor: AppColors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({required String label, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BodyTitle(
          text: label,
          textAlign: TextAlign.end,
          color: AppColors.mainText,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.medium,
        ),
        SizedBox(height: AppHeight.h4),
        CustomDropDownWidget(
          items: items,
          isStringList: true,
          hintText: 'يرجى الاختيار',
          color: AppColors.white,
          height: AppHeight.h50,
          borderRadius: AppRadius.r7,
          closedBorder: const Border.fromBorderSide(
            BorderSide(color: AppColors.greyDivider, width: .7),
          ),
          onChanged: (_) {},
        ),
      ],
    );
  }

  Widget _buildPhoneField({required String label, required String hint}) {
    return CustomInputField(
      title: label,
      hintText: hint,
      textInputType: TextInputType.phone,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      backgroundColor: AppColors.white,
      prefix: _CountryDialCode(
        country: _selectedCountry,
        onTap: _showCountryPicker,
      ),
      suffix: Icon(
        Iconsax.call_outline,
        color: AppColors.primary,
        size: AppSize.s18,
      ),
    );
  }

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
            SizedBox(width: AppWidth.w8),
            Container(width: 1, height: AppHeight.h24, color: AppColors.lightGrey),
          ],
        ),
      ),
    );
  }
}
