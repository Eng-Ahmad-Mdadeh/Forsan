import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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

            ],
          ),
        ),
      ),
    );
  }
}
