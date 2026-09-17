import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/more/widgets/more_menu_item.dart';

class MoreTile extends StatelessWidget {
  const MoreTile({super.key, required this.item, this.onTap});

  final MoreMenuItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = item.isDestructive
        ? const Color(0xFFFF3158)
        : AppColors.mainText;
    final iconBackgroundColor = item.isDestructive
        ? const Color(0xFFFFF4F6)
        : AppColors.goldBackGround;
    final iconColor = item.isDestructive
        ? const Color(0xFFFF3158)
        : AppColors.secondaryNormal;

    return ListTile(
      minTileHeight: item.subtitle == null ? 45 : 45,
      contentPadding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p5),
      leading: Container(
        width: AppWidth.w45,
        height: AppWidth.w45,
        margin:EdgeInsetsDirectional.only(start: AppPaddingWidth.p5),
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        alignment: Alignment.center,
        child: Icon(item.icon, color: iconColor, size: AppSize.s24),
      ),
      title: Text(
        item.title,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: foregroundColor,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.bold,
        ),
      ),
      subtitle: item.subtitle == null
          ? null
          : Text(
        item.subtitle!,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: AppColors.greyText,
          fontSize: AppFontSize.s12,
          fontWeight: AppFontWeight.regular,
        ),
      ),
      trailing: Icon(
       // item.isDestructive
            //? Icons.arrow_forward_rounded
             Icons.chevron_right_rounded,
        color: AppColors.black,
        size: AppSize.s24,
      ),
      onTap: onTap,
    );
  }
}