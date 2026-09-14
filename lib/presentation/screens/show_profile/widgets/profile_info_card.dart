import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/show_profile/widgets/profile_info_raw.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:icons_plus/icons_plus.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'المعلومات الشخصية',
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p16,
      ),
      trailing: Container(
        padding: EdgeInsets.all(AppPaddingWidth.p5),
        height: AppHeight.h30,
        width: AppWidth.w30,
        decoration: BoxDecoration(
          color: AppColors.profileAvatarBackground,
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        child: Icon(
          Icons.info_outline_rounded,
          color: AppColors.profileAvatarForeground,
          size: AppSize.s20,
        ),
      ),
      margin: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(AppRadius.r8),
      child: const Column(
        children: [
          ProfileInfoRow(
            icon: Iconsax.user_bold,
            label: 'الاسم الكامل',
            value: 'أحمد عيسى',
          ),
          ProfileInfoRow(
            icon: Iconsax.card_outline,
            label: 'الدولة',
            value: 'سوريا',
          ),
          ProfileInfoRow(
            icon: Iconsax.card_outline,
            label: 'الجنسية',
            value: 'سوري',
          ),
          ProfileInfoRow(
            icon: Iconsax.call_outline,
            label: 'رقم الهاتف',
            value: '+963938204147',
          ),
          ProfileInfoRow(
            icon: Iconsax.sms_outline,
            label: 'البريد الالكتروني',
            value: 'ahmadeassaa@gmail.com',
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
