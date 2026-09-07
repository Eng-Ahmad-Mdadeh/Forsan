import 'package:flutter/material.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Size get preferredSize => Size.fromHeight(AppHeight.h98);

  @override
  Widget build(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: preferredSize.height,
    flexibleSpace: DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: AssetImage(AppAssets.appBackground),
          fit: BoxFit.cover,
          opacity: 0.025,
        ),
      ),
    ),
    titleSpacing: 0,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p16),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            CircleAvatar(
              radius: AppWidth.w24,
              backgroundColor: AppColors.primary,
              child: Icon(
                Icons.person_outline_rounded,
                color: AppColors.white,
                size: AppFontSize.s32,
                semanticLabel: 'الملف الشخصي',
              ),
            ),
            SizedBox(width: AppWidth.w12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'مرحباً سيد محمد',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.mainText,
                      fontSize: AppFontSize.s20,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppHeight.h2),
                  Text(
                    'كيف يمكننا مساعدتك اليوم ؟',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.blackCow,
                      fontSize: AppFontSize.s14,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppWidth.w12),
            Semantics(
              button: true,
              label: 'الإشعارات',
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(AppRadius.r12),
                child: Container(
                  width: AppWidth.w48,
                  height: AppHeight.h48,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.mainTextLightActive),
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                  ),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.lightBlack,
                    size: AppFontSize.s28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
