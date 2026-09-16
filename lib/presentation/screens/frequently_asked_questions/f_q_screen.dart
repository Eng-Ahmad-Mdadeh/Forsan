import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class FQScreen extends StatelessWidget {
  const FQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الأسئلة الشائعة',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showScrolledUnderElevation: false,
        showBackButton: true,
        titleSpacing: AppPaddingWidth.p8,
        titleWidget: SectionTitle(
          text: 'الأسئلة الشائعة',
          color: AppColors.mainText,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.bold,
        ),
      ),
    );
  }
}
