import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CreateOrderHelpCard extends StatelessWidget {
  const CreateOrderHelpCard({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppRadius.r10);

    return Semantics(
      button: true,
      label: context.loc.create_order_help_title,
      child: Material(
        color: AppColors.none,
        borderRadius: borderRadius,
        child: Ink(
          height: AppHeight.h70,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: AlignmentDirectional.centerEnd,
              end: AlignmentDirectional.centerStart,
              colors: [AppColors.primaryDark, AppColors.homeSupportAction],
            ),
            borderRadius: borderRadius,
            boxShadow: const [
              BoxShadow(
                color: AppColors.homeCardShadow,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: InkWell(
            key: const Key('create_order_help_card'),
            onTap: onTap ?? () {},
            borderRadius: borderRadius,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p11),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          text: context.loc.create_order_help_title,
                          color: AppColors.white,
                          fontSize: AppFontSize.s14,
                          maxLines: 1,
                        ),
                        SizedBox(height: AppHeight.h6),
                        BodyTitle(
                          text: context.loc.create_order_help_description,
                          color: AppColors.white,
                          fontSize: AppFontSize.s12,
                          fontWeight: AppFontWeight.regular,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppWidth.w16),
                  Container(
                    width: AppWidth.w35,
                    height: AppHeight.h35,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppRadius.r8),
                    ),
                    child: Icon(
                      Icons.support_agent_rounded,
                      color: AppColors.white,
                      size: AppSize.s24,
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
