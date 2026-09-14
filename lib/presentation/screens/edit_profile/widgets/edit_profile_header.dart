import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_avatar.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({
    super.key,
    this.name = 'أحمد عيسى',
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: AppWidth.w100,
          height: AppHeight.h100,
          child: CustomAvatar(
            name: name,
            backgroundColor: AppColors.profileAvatarBackground,
            foregroundColor: AppColors.profileAvatarForeground,
            icon: Icons.person_outline_rounded,
            iconSize: AppSize.s58,
          ),
        ),
        SizedBox(height: AppHeight.h8),
        BodyTitle(
          text: name,
          textAlign: TextAlign.center,
          color: AppColors.mainText,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.bold,
        ),
      ],
    );
  }
}
