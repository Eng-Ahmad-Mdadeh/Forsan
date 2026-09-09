import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/body_title.dart';

class OrderSummaryRow extends StatelessWidget {
  const OrderSummaryRow({
    super.key,
    required this.icon,
    required this.label,
    this.value,
    this.valueWidget,
    this.showDivider = true,
  }) : assert(value != null || valueWidget != null);

  final IconData icon;
  final String label;
  final String? value;
  final Widget? valueWidget;
  final bool showDivider;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(
        height: AppHeight.h55,
        child: Row(
          children: [
            Icon(icon, color: AppColors.secondary, size: AppSize.s20),
            SizedBox(width: AppWidth.w10),
            BodyTitle(
              text: label,
              color: AppColors.blackCow,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.regular,
            ),
            SizedBox(width: AppWidth.w10),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child:
                    valueWidget ??
                    BodyTitle(
                      text: value,
                      textAlign: TextAlign.end,
                      color: AppColors.blackCow,
                      fontSize: AppFontSize.s13,
                      fontWeight: AppFontWeight.bold,
                      maxLines: 2,
                    ),
              ),
            ),
          ],
        ),
      ),
      if (showDivider)
        Divider(height: AppHeight.h1, color: AppColors.secondaryLightActive),
    ],
  );
}
