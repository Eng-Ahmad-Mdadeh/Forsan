import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class EstablishmentTypeCard extends StatelessWidget {
  const EstablishmentTypeCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.r12);
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
          height: AppHeight.h90,
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
                    width: AppWidth.w52,
                    height: AppHeight.h52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.white
                          : AppColors.secondaryLight,
                      borderRadius: BorderRadius.circular(AppRadius.r13),
                      border: Border.all(
                        color: AppColors.secondaryLightActive,
                        width: AppWidth.w2,
                      ),
                    ),
                    child: Container(
                      width: AppWidth.w42,
                      height: AppHeight.h42,
                      decoration: BoxDecoration(
                        color: selected ? AppColors.white : AppColors.primary,
                        borderRadius: BorderRadius.circular(AppRadius.r10),
                      ),
                      child: Icon(
                        icon,
                        color: selected ? AppColors.primary : AppColors.white,
                        size: AppSize.s25,
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
                          fontSize: AppFontSize.s15,
                          maxLines: 1,
                        ),
                        SizedBox(height: AppHeight.h5),
                        BodyTitle(
                          text: description,
                          color: descriptionColor,
                          fontSize: AppFontSize.s12,
                          fontWeight: AppFontWeight.regular,
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
