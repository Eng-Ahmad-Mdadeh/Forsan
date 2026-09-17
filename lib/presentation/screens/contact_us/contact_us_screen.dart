import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/contact_us/widgets/contact_us_form.dart';
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
        child: const ContactUsForm(),
      ),
    );
  }
}

