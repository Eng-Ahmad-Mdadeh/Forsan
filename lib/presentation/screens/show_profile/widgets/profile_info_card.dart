import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/show_profile/widgets/profile_info_raw.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:forsan/data/models/profile/profile_model.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key,  this.profile});

  final ProfileModel? profile;

  String _displayValue(String? value) {
    final text = value?.trim();
    return text == null || text.isEmpty ? 'غير متوفر' : text;
  }

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
      child: Column(
        children: [
          ProfileInfoRow(
            icon: Iconsax.user_bold,
            label: 'الاسم الكامل',
            value: _displayValue(profile?.fullName??''),
          ),
          ProfileInfoRow(
            icon: Iconsax.card_outline,
            label: 'الدولة',
            value: _displayValue(profile?.countryName??''),
          ),
          ProfileInfoRow(
            icon: Iconsax.card_outline,
            label: 'الجنسية',
            value: _displayValue(profile?.nationalityName??''),
          ),
          ProfileInfoRow(
            icon: Iconsax.call_outline,
            label: 'رقم الهاتف',
            value: _displayValue(profile?.phone??''),
          ),
          ProfileInfoRow(
            icon: Iconsax.sms_outline,
            label: 'البريد الالكتروني',
            value: _displayValue(profile?.email??''),
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
