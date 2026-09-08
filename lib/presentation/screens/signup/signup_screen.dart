import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/signup/widgets/signup_form.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
          title: context.loc.signup_account_information,
          backgroundColor: AppColors.white,
          showBackButton: true,
          showScrolledUnderElevation: false,
          onTapBackButton: () => Navigator.maybePop(context),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppPaddingWidth.p16,
              AppPaddingHeight.p12,
              AppPaddingWidth.p16,
              AppPaddingHeight.p24,
            ),
            child: const SignupForm(),
          ),
        ),
      ),
    );
  }
}
