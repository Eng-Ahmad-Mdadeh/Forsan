import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_avatar.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class ShowProfileScreen extends StatelessWidget {
  const ShowProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الملف الشخصي',
        showBackButton: true,
        backgroundColor: AppColors.white,
        showScrolledUnderElevation: false,
        toolbarHeight: AppHeight.h70,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p8,
            AppPaddingWidth.p16,
            AppPaddingHeight.p16,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                        ),
                      ),
                      SizedBox(height: AppHeight.h8),
                      SectionTitle(
                        text: 'أحمد عيسى',
                        color: AppColors.mainText,
                        fontSize: AppFontSize.s16,
                        fontWeight: AppFontWeight.bold,
                      ),
                      SizedBox(height: AppHeight.h20),
                      SectionCard(
                        title: 'المعلومات الشخصية',
                        trailing: Container(
                          padding: EdgeInsets.all(AppPaddingWidth.p5),
                          decoration: const BoxDecoration(
                            color: AppColors.profileAvatarBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: AppColors.profileAvatarForeground,
                            size: AppSize.s20,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPaddingWidth.p16,
                          vertical: AppPaddingHeight.p16,
                        ),
                        margin: EdgeInsets.zero,
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                        child: const Column(
                          children: [
                            _ProfileInfoRow(
                              icon: Iconsax.user_square_outline,
                              label: 'الاسم الكامل',
                              value: 'أحمد عيسى',
                            ),
                            _ProfileInfoRow(
                              icon: Iconsax.card_outline,
                              label: 'الدولة',
                              value: 'سوريا',
                            ),
                            _ProfileInfoRow(
                              icon: Iconsax.card_outline,
                              label: 'الجنسية',
                              value: 'سوري',
                            ),
                            _ProfileInfoRow(
                              icon: Iconsax.call_outline,
                              label: 'رقم الهاتف',
                              value: '+963938204147',
                            ),
                            _ProfileInfoRow(
                              icon: Iconsax.sms_outline,
                              label: 'البريد الالكتروني',
                              value: 'ahmadeassaa@gmail.com',
                              showDivider: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomSubmitButton(
                text: 'تعديل   ✎',
                useGradient: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: AppPaddingHeight.p12),
        child: Row(
          children: [
            Icon(icon, color: AppColors.secondaryText, size: AppSize.s18),
            SizedBox(width: AppWidth.w8),
            Expanded(
              child: BodyTitle(
                text: label,
                color: AppColors.greyText,
                fontSize: AppFontSize.s13,
                fontWeight: AppFontWeight.regular,
              ),
            ),
            Flexible(
              child: BodyTitle(
                text: value,
                color: AppColors.mainText,
                fontSize: AppFontSize.s13,
                fontWeight: AppFontWeight.medium,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
      if (showDivider)
        Divider(
          height: AppHeight.h1,
          thickness: AppHeight.h1,
          color: AppColors.greyDivider.withValues(alpha: .35),
        ),
    ],
  );
}
