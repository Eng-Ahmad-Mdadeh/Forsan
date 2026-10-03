import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_check_box.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class ReviewConfirmationCard extends StatelessWidget {
  const ReviewConfirmationCard({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
    this.onPrivacyPressed,
    this.onTermsPressed,
  });

  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onPrivacyPressed;
  final VoidCallback? onTermsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p8,
        vertical: AppPaddingHeight.p10,
      ),
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.circular(AppRadius.r8),
        boxShadow: [
          BoxShadow(
            color: AppColors.light.withOpacity(0.9),
            blurRadius: AppRadius.r7,
            offset: Offset(0, AppHeight.h2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCheckBox(
            value: value,
            onChanged: (value) {
              if (value != null) onChanged(value);
            },
          ),
          SizedBox(width: AppWidth.w4),
          Expanded(
            child: onPrivacyPressed != null && onTermsPressed != null
                ? _AgreementText(
                    onPrivacyPressed: onPrivacyPressed!,
                    onTermsPressed: onTermsPressed!,
                  )
                : BodyTitle(
                    text: text,
                    textAlign: TextAlign.start,
                    color: AppColors.primaryDark,
                    fontSize: AppFontSize.s14,
                    fontWeight: AppFontWeight.regular,
                    maxLines: 4,
                  ),
          ),
        ],
      ),
    );
  }
}

class _AgreementText extends StatelessWidget {
  const _AgreementText({
    required this.onPrivacyPressed,
    required this.onTermsPressed,
  });

  final VoidCallback onPrivacyPressed;
  final VoidCallback onTermsPressed;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: AppColors.primaryDark,
      fontSize: AppFontSize.s14,
      fontWeight: AppFontWeight.regular,
    );
    final linkStyle = style.copyWith(
      fontWeight: AppFontWeight.semiBold,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primaryDark,
    );

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppWidth.w4,
      children: [
        Text('أوافق على', style: style),
        _AgreementLink(
          key: const Key('new_order_privacy_policy_link'),
          text: 'سياسة الخصوصية',
          style: linkStyle,
          onPressed: onPrivacyPressed,
        ),
        Text('و', style: style),
        _AgreementLink(
          key: const Key('new_order_terms_of_use_link'),
          text: 'شروط استخدام منصة فرسان.',
          style: linkStyle,
          onPressed: onTermsPressed,
        ),
      ],
    );
  }
}

class _AgreementLink extends StatelessWidget {
  const _AgreementLink({
    super.key,
    required this.text,
    required this.style,
    required this.onPressed,
  });

  final String text;
  final TextStyle style;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.r4),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p4),
        child: Text(text, style: style),
      ),
    );
  }
}
