import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.title,
    required this.assetPath,
    this.onTap,
  });

  final String title;
  final String assetPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: title,
      child: SectionCard(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.r16),
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: AppPaddingWidth.p20,
          vertical: AppPaddingHeight.p20,
        ),
        margin: EdgeInsets.zero,
        child: SizedBox(
          height: AppHeight.h52,
          child: Row(
            children: [
              SizedBox(
                width: AppWidth.w52,
                height: AppHeight.h52,
                child: SvgPicture.asset(assetPath, fit: BoxFit.contain),
              ),
              SizedBox(width: AppWidth.w16),
              Expanded(
                child: SectionTitle(
                  text: title,
                  fontSize: AppFontSize.s18,
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.mainText,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
              SizedBox(width: AppWidth.w12),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.lightBlack,
                size: AppSize.s20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
