import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/presentation/screens/show_profile/widgets/profile_info_card.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_avatar.dart';
import 'package:forsan/presentation/widgets/custom_submit_button.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

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
                      ProfileInfoCard(),
                    ],
                  ),
                ),
              ),
              CustomSubmitButton(
                key: const Key('show-profile-edit-button'),
                text: 'تعديل   ✎',
                useGradient: false,
                onPressed: () => const EditProfileRoute().go(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

