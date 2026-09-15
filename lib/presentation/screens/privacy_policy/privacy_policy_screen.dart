import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'سياسة الخصوصية',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showScrolledUnderElevation: false,
        titleSpacing: AppPaddingWidth.p16,
        titleWidget: SectionTitle(
          text: 'سياسة الخصوصية',
          color: AppColors.mainText,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.bold,
        ),
      ),
    );
  }
}
