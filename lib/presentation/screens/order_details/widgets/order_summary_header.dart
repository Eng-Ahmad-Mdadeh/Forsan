import 'package:flutter/material.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/section_title.dart';

class OrderSummaryHeader extends StatelessWidget {
  const OrderSummaryHeader({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: AppHeight.h55,
    color: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p16),
    child: Row(
      children: [
        SectionTitle(
          text: context.loc.order_summary,
          color: AppColors.white,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.bold,
        ),
        const Spacer(),
        Icon(
          Icons.bookmark_rounded,
          color: AppColors.white,
          size: AppSize.s20,
        ),
      ],
    ),
  );
}
