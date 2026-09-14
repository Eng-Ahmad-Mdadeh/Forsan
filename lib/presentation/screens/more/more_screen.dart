import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/screens/more/widgets/more_menu.dart';
import 'package:forsan/presentation/widgets/custom_avatar.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: CustomAppBar(
      title: 'المزيد',
      backgroundColor: AppColors.white,
      toolbarHeight: AppHeight.h70,
      showScrolledUnderElevation: false,
      titleSpacing: AppPaddingWidth.p16,
      titleWidget: SectionTitle(
        text: 'المزيد',
        color: AppColors.mainText,
        fontSize: AppFontSize.s18,
        fontWeight: AppFontWeight.bold,
      ),
      customActions: [
        HeaderIconButton(icon: Iconsax.notification_outline, onTap: () {}),
      ],
    ),
    body: ListView(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p1,
      ),
      children: [
        _ProfileCard(),
        SizedBox(height: AppHeight.h20),
        MoreMenu(),
        SizedBox(height: AppHeight.h150),
      ],
    ),
  );
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) => SizedBox(
    height: AppHeight.h150,
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.profileBannerStart, AppColors.profileBannerEnd],
        ),
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddingWidth.p16,
          vertical: AppPaddingHeight.p10,
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            SizedBox(
              width: AppWidth.w100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: AppWidth.w100,
                    height: AppHeight.h100,
                    child: CustomAvatar(
                      name: 'أحمد عيسى',
                      backgroundColor: AppColors.profileAvatarBackground,
                      foregroundColor: AppColors.profileAvatarForeground,
                      icon: Icons.person_outline_rounded,
                      iconSize: AppSize.s58,
                      border: Border.all(
                        color: AppColors.white,
                        width: AppWidth.w6,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SectionTitle(
                      text: 'أحمد عيسى',
                      maxLines: 1,
                      color: AppColors.white,
                      fontSize: AppFontSize.s16,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppWidth.w70),
            Expanded(
              child: ImageView(
                imagePath: AppAssets.fullLogo,
                key: const Key('more-full-logo'),
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
                semanticLabel: 'شعار فرسان للخدمات',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
