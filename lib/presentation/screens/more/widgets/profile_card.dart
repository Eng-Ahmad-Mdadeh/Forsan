import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_avatar.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: AppHeight.h150,
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.04, 0.82),
          end: Alignment(-1.09, 0.1),
          colors: [Color(0xFF0D3D35), Color(0xFF187061)],
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
