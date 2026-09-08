import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
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
          const _FooterLink(text: 'الشروط والأحكام'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p8),
            child: BodyTitle(
              text: '•',
              color: AppColors.greyText,
              fontSize: AppFontSize.s12,
              fontWeight: AppFontWeight.regular,
            ),
          ),
          const _FooterLink(text: 'سياسة الخصوصية'),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return BodyTitle(
      text: text,
      color: AppColors.greyText,
      fontSize: AppFontSize.s12,
      fontWeight: AppFontWeight.regular,
    );
  }
}
