import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class OrderOptionCard extends StatelessWidget {
  const OrderOptionCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.height,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.r8);
    final titleColor = selected ? AppColors.white : AppColors.primary;
    final descriptionColor = selected
        ? AppColors.white
        : AppColors.greyText;

    return Semantics(
      button: true,
      selected: selected,
      label: title,
      child: Material(
        color: AppColors.none,
        borderRadius: radius,
        child: Ink(
          height: height ?? AppHeight.h80,
          decoration: BoxDecoration(
            color: selected ? null : AppColors.white,
            gradient: selected
                ? const LinearGradient(
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                    colors: [AppColors.primary, AppColors.homeSupportAction],
                  )
                : null,
            borderRadius: radius,
            border: selected
                ? null
                : Border.all(color: AppColors.lightGrey),
            boxShadow: selected
                ? null
                : const [
                    BoxShadow(
                      color: AppColors.homeSoftShadow,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: radius,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p12),
              child: Row(
                children: [
                  Container(
                    width: AppWidth.w50,
                    height: AppHeight.h50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.white
                          : AppColors.secondaryLight,
                      borderRadius: BorderRadius.circular(AppRadius.r12),
                      border: Border.all(
                        color: AppColors.secondaryLightActive,
                        width: AppWidth.w2,
                      ),
                    ),
                    child: Container(
                      width: AppWidth.w40,
                      height: AppHeight.h40,
                      decoration: BoxDecoration(
                        color: selected ? AppColors.white : AppColors.primary,
                        borderRadius: BorderRadius.circular(AppRadius.r10),
                      ),
                      child: Icon(
                        icon,
                        color: selected ? AppColors.primary : AppColors.white,
                        size: AppSize.s24,
                      ),
                    ),
                  ),
                  SizedBox(width: AppWidth.w12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          text: title,
                          color: titleColor,
                          fontSize: AppFontSize.s13,
                          maxLines: 1,
                        ),
                        SizedBox(height: AppHeight.h3),
                        BodyTitle(
                          text: description,
                          color: descriptionColor,
                          fontSize: AppFontSize.s12,
                          fontWeight: AppFontWeight.medium,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
