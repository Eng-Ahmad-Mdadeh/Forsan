import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/presentation/screens/contact_us/widgets/contact_us_form.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          title: context.loc.contact_us,
          backgroundColor: AppColors.white,
          showBackButton: true,
          showScrolledUnderElevation: false,
          onTapBackButton: () => Navigator.maybePop(context),
        ),
        body: SafeArea(
          top: false,
          child: const ContactUsForm(),
        ),
      ),
    );
  }
}
