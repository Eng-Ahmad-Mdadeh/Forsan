import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/bloc/auth/login/login_bloc.dart';
import 'package:forsan/presentation/screens/login/widgets/auth_terms_footer.dart';
import 'package:forsan/presentation/screens/login/widgets/continue_login_button.dart';
import 'package:forsan/presentation/screens/login/widgets/phone_number_section.dart';
import 'package:forsan/presentation/widgets/custom_snack_bar.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/routes/app_routes_imports.dart' show GoRouterHelper;

class LoginCard extends StatelessWidget {
  final GlobalKey<FormState> loginFormKey;

  const LoginCard({super.key, required this.loginFormKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, ILoginState>(
      listener: (context, state) {
        if (state is LoginFailed) {
          showCustomSnackBar(
            context: context,
            title: context.loc.contact_us,
            message: state.message,
            contentType: ContentType.failure,
          );
          context.pop();
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: AppHeight.h430),
          padding: EdgeInsetsDirectional.fromSTEB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p25,
            AppPaddingWidth.p16,
            AppPaddingHeight.p18,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.r18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _WelcomeMessage(),
              SizedBox(height: AppHeight.h42),
              const PhoneNumberSection(),
              SizedBox(height: AppHeight.h40),
              ContinueLoginButton(loginFormKey: loginFormKey),
              SizedBox(height: AppHeight.h50),
              SectionTitle(
                text: "بتسجيل الدخول انت توافق على",
                fontWeight: AppFontWeight.medium,
                fontSize: AppFontSize.s12,
                color: AppColors.mainText,
              ),
              SizedBox(height: AppHeight.h6),
              const AuthTermsFooter(),
            ],
          ),
        );
      },
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'أهلاً بعودتك',
          color: AppColors.primary,
          fontWeight: AppFontWeight.extraBold,
          fontSize: AppFontSize.s18,
        ),
        SizedBox(height: AppHeight.h6),
        BodyTitle(
          text: 'أدخل رقم الجوال للمتابعة',
          color: AppColors.greyText,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.regular,
        ),
      ],
    );
  }
}
