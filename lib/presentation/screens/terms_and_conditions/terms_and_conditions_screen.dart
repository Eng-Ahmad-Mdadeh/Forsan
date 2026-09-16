import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/terms_and_conditions/widgets/terms_and_conditions_card.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الشروط والأحكام',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showScrolledUnderElevation: false,
        showBackButton:true,
        titleSpacing: AppPaddingWidth.p8,
        titleWidget: SectionTitle(
          text: 'الشروط والأحكام',
          color: AppColors.mainText,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.bold,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddingWidth.p16,
        ),
        children: const [
          TermsAndConditionsCard(),
          TermsAndConditionsCard(),
        ],
      ),
    );
  }
}
