import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: context.loc.contact_us,
        backgroundColor: AppColors.white,
        titleSpacing:AppPaddingWidth.p16,
        showBackButton: true,
        showScrolledUnderElevation: false,
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsetsDirectional.fromSTEB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p16,
            AppPaddingWidth.p16,
            AppPaddingHeight.p24,
          ),
          children: [
            _ContactField(
              title: context.loc.contact_name,
              hintText: context.loc.contact_name_hint,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: AppHeight.h8),
            _ContactField(
              title: context.loc.contact_email,
              hintText: context.loc.contact_subject_hint,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: AppHeight.h8),
            const _PhoneField(),
            SizedBox(height: AppHeight.h8),
            _ContactField(
              title: context.loc.contact_message,
              hintText: context.loc.contact_message_hint,
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactField extends StatelessWidget {
  const _ContactField({
    required this.title,
    required this.hintText,
    required this.keyboardType,
  });

  final String title;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      title: title,
      fontWeight:AppFontWeight.bold,
      hintText: hintText,
      height: AppHeight.h52,
      backgroundColor: AppColors.white,
      textInputType: keyboardType,
      fontSize: AppFontSize.s14,
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppHeight.h4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyTitle(
          text: context.loc.contact_phone,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.bold,
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
