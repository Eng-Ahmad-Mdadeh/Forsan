import 'package:icons_plus/icons_plus.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/app_values.dart';
import 'text/body_title.dart';
import 'text/section_title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showSkipButton;
  final bool centerTitle;
  final bool showScrolledUnderElevation;
  final Function()? onTapSkipButton;
  final Function()? onTapBackButton;
  final String title;
  final String? subTitle;
  final Widget? titleWidget;
  final Color? backgroundColor;
  final VoidCallback? onBack;
  final double? toolbarHeight;
  final Widget? flexibleSpace;
  final double? titleSpacing;

  final List<Widget>? customActions;

  const CustomAppBar({
    super.key,
    this.backgroundColor = AppColors.backGround,
    this.showBackButton = false,
    this.showSkipButton = false,
    this.showScrolledUnderElevation = true,
    this.centerTitle = false,
    this.onBack,
    this.title = '',
    this.subTitle,
    this.titleWidget,
    this.onTapSkipButton,
    this.onTapBackButton,
    this.customActions,
    this.toolbarHeight,
    this.flexibleSpace,
    this.titleSpacing,
  }) : assert(
         (showSkipButton && onTapSkipButton != null) || (!showSkipButton && onTapSkipButton == null),
         'When showSkipButton is true, onTapSkipButton must not be null. When showSkipButton is false, onTapSkipButton must be null.',
       );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      toolbarHeight: toolbarHeight,
      flexibleSpace: flexibleSpace,
      titleSpacing: titleSpacing,
      scrolledUnderElevation: showScrolledUnderElevation ? 2 : 0,
      surfaceTintColor: AppColors.backGround,
      shadowColor: AppColors.lightGrey,
      actionsPadding: EdgeInsetsDirectional.only(end: AppPaddingWidth.p20),
      leading: showBackButton
          ? HeaderIconButton(
              icon: Iconsax.arrow_right_3_outline,
              onTap:
                  onTapBackButton ??
                  () {
                    if (onBack != null) {
                      onBack!();
                    } else {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        HomeRoute().go(context);
                      }
                    }
                  },
            )
          : null,
      title:
          titleWidget ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(text: title, fontSize: AppFontSize.s18),
              if (subTitle != null)
                BodyTitle(
                  text: subTitle,
                  color: AppColors.greyText,
                  fontSize: AppFontSize.s14,
                  fontWeight: AppFontWeight.regular,
                ),
            ],
          ),

      actions:
          customActions ??
          (showSkipButton
              ? [
                  InkWell(
                    onTap: onTapSkipButton,
                    child: BodyTitle(text: context.loc.exit, decoration: TextDecoration.underline),
                  ),
                ]
              : []),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? AppHeight.h60);
}

class HeaderIconButton extends StatelessWidget {
  const HeaderIconButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppHeight.h38,
        width: AppWidth.w38,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.r9),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.r9),
              border: Border.all(color: AppColors.lightGrey),
            ),
            child: Icon(icon, color: AppColors.primaryDark, size: AppSize.s24),
          ),
        ),
      ),
    );
  }
}
