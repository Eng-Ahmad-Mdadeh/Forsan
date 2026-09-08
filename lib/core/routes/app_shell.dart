import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsetsDirectional.only(
            bottom: AppMarginHeight.m15,
            start: AppMarginWidth.m20,
            end: AppMarginWidth.m20,
          ),
          backgroundColor: AppColors.primary,
          content: SectionTitle(text: context.loc.tap_back_again_to_leave, color: AppColors.white),
        ),
        child: navigationShell,
      ),
      bottomNavigationBar: CustomBottomNavBar(navigationShell: navigationShell),
    );
  }
}
