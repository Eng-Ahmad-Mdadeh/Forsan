import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/more/widgets/more_menu_item.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:icons_plus/icons_plus.dart';

class MoreTile extends StatelessWidget {
  const MoreTile({
    super.key,
    required this.item,
    this.onTap,
    this.topPadding,
    this.bottomPadding,
  });

  final MoreMenuItem item;
  final VoidCallback? onTap;
  final double? topPadding;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.none,
      highlightColor: AppColors.none,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppPaddingWidth.p16,
          end: AppPaddingWidth.p16,
          top: topPadding ?? 0,
          bottom: bottomPadding ?? 0,
        ),
        child: Row(
          children: [
            if (!item.isDestructive) ...[
              Container(
                width: AppWidth.w48,
                height: AppHeight.h48,
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight,
                  borderRadius: BorderRadius.circular(AppRadius.r16),
                ),
                child: Icon(
                  item.icon,
                  size: AppFontSize.s22,
                  color: AppColors.secondaryNormal,
                ),
              ),
              SizedBox(width: AppWidth.w14),
            ],
            Expanded(
              child: Column(
                spacing: AppHeight.h2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyTitle(
                    text: item.title,
                    fontSize: AppFontSize.s17,
                    fontWeight: AppFontWeight.semiBold,
                    color: item.isDestructive ? AppColors.red : null,
                  ),
                  if (item.subtitle != null)
                    BodyTitle(
                      text: item.subtitle,
                      fontSize: AppFontSize.s13,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.greyText,
                    ),
                ],
              ),
            ),
            SizedBox(width: AppWidth.w10),
            Icon(
              item.isDestructive
                  ? Iconsax.logout_outline
                  : Icons.arrow_forward_ios_rounded,
              color: item.isDestructive
                  ? AppColors.red
                  : const Color(0xFF6E7781),
              size: AppSize.s20,
            ),
          ],
        ),
      ),
    );
  }
}
