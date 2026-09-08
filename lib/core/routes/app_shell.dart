import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tamalok/core/extension/localization_extension.dart';
import 'package:tamalok/core/resources/app_colors.dart';
import 'package:tamalok/core/resources/app_values.dart';
import 'package:tamalok/core/routes/app_routes.dart';
import 'package:tamalok/presentation/cubit/bottom_bar/bottom_bar_cubit.dart';
import 'package:tamalok/presentation/widgets/bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:tamalok/presentation/widgets/text/section_title.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final currentPath = navigationShell.shellRouteContext.routerState.fullPath;
    final shouldShowBottomBar = <String>{
      const HomeRoute().location,
      const FavoritesRoute().location,
      // const AddPropertyRoute().location,
      const PropertiesRoute().location,
      const MoreRoute().location,
    }.contains(currentPath);

    final bottomBarCubit = context.read<BottomBarCubit>();
    if (bottomBarCubit.state != shouldShowBottomBar) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!bottomBarCubit.isClosed) {
          bottomBarCubit.setBottomBarVisibility(shouldShowBottomBar);
        }
      });
    }

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
