import 'package:flutter/material.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/required_action_card.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../../core/routes/app_routes.dart';
import 'widgets/home_header.dart';
import 'widgets/home_statistics_section.dart';
import 'widgets/latest_order_card.dart';
import 'widgets/quick_actions_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const HomeHeader(),
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.fromLTRB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p20,
          AppPaddingWidth.p16,
          AppPaddingHeight.p24,
        ),
        children: [
          Semantics(
            image: true,
            label: 'الصورة الرئيسية',
            child: ImageView(
              imagePath: AppAssets.appBanner,
              key: const Key('home-main-image'),
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: AppHeight.h16),
          RequiredActionCard(
            titleSpan: TextSpan(
              children: [
                TextSpan(
                  text: 'إجراء مطلوب على الطلب ',
                  style: TextStyle(
                    color: AppColors.mainText,
                    fontSize: AppFontSize.s12,
                    fontWeight: AppFontWeight.regular,
                  ),
                ),
                TextSpan(
                  text: 'FR-2026-001259',
                  style: TextStyle(
                    color: AppColors.mainText,
                    fontSize: AppFontSize.s12,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ],
            ),
            message:
                'يرجى إرفاق المستندات المطلوبة لاستكمال\nمراجعة طلب تأسيس الشركة.',
            buttonText: 'استكمال المتطلبات',
            buttonColor: AppColors.primary,
            compact: true,
            semanticsLabel:
                'إجراء مطلوب على الطلب FR-2026-001259',
            illustration: ImageView(
              imagePath: AppAssets.addFile,
              width: AppWidth.w65,
              fit: BoxFit.contain,
              excludeFromSemantics: true,
            ),
            onPressed: () => const CompleteRequirementsRoute().push(context),
          ),
          SizedBox(height: AppHeight.h20),
          const HomeStatisticsSection(),
          SizedBox(height: AppHeight.h20),
          const LatestOrderCard(),
          SizedBox(height: AppHeight.h20),
          const QuickActionsSection(),
        ],
      ),
    ),
  );
}
