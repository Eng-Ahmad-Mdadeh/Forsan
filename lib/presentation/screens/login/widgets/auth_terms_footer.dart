import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class AuthTermsFooter extends StatelessWidget {
  const AuthTermsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPaddingHeight.p3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _FooterLink(text: 'الشروط والأحكام', onTap: () => const TermsAndConditionsRoute().push(context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p8),
            child: BodyTitle(
              text: '•',
              color: AppColors.greyText,
              fontSize: AppFontSize.s12,
              fontWeight: AppFontWeight.regular,
            ),
          ),
          _FooterLink(text: 'سياسة الخصوصية', onTap: () => const PrivacyPolicyRoute().push(context)),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BodyTitle(
        text: text,
        color: AppColors.greyText,
        fontSize: AppFontSize.s12,
        fontWeight: AppFontWeight.regular,
      ),
    );
  }
}
