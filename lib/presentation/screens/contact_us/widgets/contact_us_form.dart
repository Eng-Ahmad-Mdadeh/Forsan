import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/contact_us/widgets/contact_us_text_field.dart';
import 'package:forsan/presentation/screens/contact_us/widgets/contact_us_phone_field.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsetsDirectional.fromSTEB(
        AppPaddingWidth.p16,
        AppPaddingHeight.p16,
        AppPaddingWidth.p16,
        AppPaddingHeight.p24,
      ),
      children: [
        ContactUsTextField(
          title: context.loc.contact_name,
          hintText: context.loc.contact_name_hint,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: AppHeight.h8),
        ContactUsTextField(
          title: context.loc.contact_email,
          hintText: context.loc.contact_subject_hint,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: AppHeight.h8),
        const ContactUsPhoneField(),
        SizedBox(height: AppHeight.h8),
        ContactUsTextField(
          title: context.loc.contact_message,
          hintText: context.loc.contact_message_hint,
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(height: AppHeight.h350),
        CustomSubmitButton(
          key: const Key('contact-us-submit-button'),
          text:'ارسال',
          useGradient: false,
          onPressed: () {},
        ),
      ],
    );
  }
}
