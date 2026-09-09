import 'package:forsan/core/routes/app_routes_imports.dart';
import 'package:forsan/presentation/widgets/marquee_widget.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';

import 'package:icons_plus/icons_plus.dart';

class SectionCard extends StatelessWidget {
  final String? title;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Widget child;
  final Function()? onTap;
  final Function()? onEditTap;
  final Widget? trailing;
  final Color? backgroundColor;
  final String? subtitle;
  final bool? showShadow;
  final bool? showBorder;

  const SectionCard({
    super.key,
    this.title,
    this.padding,
    this.margin,
    this.borderRadius,
    required this.child,
    this.onTap,
    this.onEditTap,
    this.trailing,
    this.backgroundColor,
    this.subtitle,
    this.showShadow = true,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        splashColor: AppColors.none,
        highlightColor: AppColors.none,
        onTap: onTap,
        child: ClipRRect(
          clipBehavior: Clip.none,
          borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.r30),
          child: Card(
            margin: margin,
            color: backgroundColor ?? AppColors.white,
            shadowColor: showShadow! ? AppColors.lightGrey.withAlpha(590) : AppColors.none,
            elevation: 5,
            shape: RoundedRectangleBorder(
              side: showBorder! ? const BorderSide(color: AppColors.greyDivider, width: 1.5) : BorderSide.none,
              borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.r25),
            ),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: AppHeight.h13,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: MarqueeWidget(
                            child: SectionTitle(
                              overflow: TextOverflow.visible,
                              text: title,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (trailing != null) trailing!,
                        if (onEditTap != null)
                          InkWell(
                            onTap: onEditTap,
                            child: Icon(
                              Iconsax.edit_2_outline,
                              color: AppColors.primary,
                              size: AppSize.s25,
                            ),
                          ),
                      ],
                    ),
                  if (subtitle != null)
                    BodyTitle(
                      text: subtitle!,
                      color: AppColors.greyText,
                    ),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
