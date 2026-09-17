import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class ContactUsPhoneField extends StatelessWidget {
  const ContactUsPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppHeight.h4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyTitle(
          text: context.loc.contact_phone,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.medium,
          color: AppColors.mainText,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: CustomInputField(
            hintText: context.loc.contact_phone_hint,
            height: AppHeight.h52,
            backgroundColor: AppColors.white,
            textInputType: TextInputType.phone,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            fontSize: AppFontSize.s14,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            prefix: const _SyriaDialCode(),
          ),
        ),
      ],
    );
  }
}

class _SyriaDialCode extends StatelessWidget {
  const _SyriaDialCode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: AppPaddingWidth.p8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🇸🇾', style: TextStyle(fontSize: AppFontSize.s20)),
          SizedBox(width: AppWidth.w5),
          BodyTitle(
            text: '+963',
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
            color: AppColors.mainText,
          ),
          SizedBox(width: AppWidth.w8),
          Container(
            width: AppWidth.w1,
            height: AppHeight.h24,
            color: AppColors.lightGrey,
          ),
          SizedBox(width: AppWidth.w8),
        ],
      ),
    );
  }
}
