import 'package:flutter/material.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/required_action_card.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_values.dart';
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

          SizedBox(height: AppHeight.h16),
          const HomeStatisticsSection(),
          SizedBox(height: AppHeight.h16),
          const LatestOrderCard(),
          SizedBox(height: AppHeight.h20),
          const QuickActionsSection(),
        ],
      ),
    ),
  );
}
