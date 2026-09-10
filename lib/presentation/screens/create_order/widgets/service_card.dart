import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/create_order/models/service_type.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service, this.onTap});

  final ServiceType service;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: service.enabled,
      enabled: service.enabled,
      label: service.title,
      child: SectionCard(
        onTap: service.enabled ? onTap ?? () {} : null,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddingWidth.p8,
          vertical: AppPaddingHeight.p13,
        ),
        borderRadius: BorderRadius.circular(AppRadius.r20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: AppWidth.w45,
                height: AppHeight.h45,
                decoration: BoxDecoration(
                  color: AppColors.light,
                  borderRadius: BorderRadius.circular(AppRadius.r7),
                ),
                child: Icon(
                  service.icon,
                  color: AppColors.primaryDark,
                  size: AppSize.s30,
                ),
              ),
              SizedBox(height: AppHeight.h10),
              BodyTitle(
                text: service.title,
                textAlign: TextAlign.center,
                color: service.enabled ? AppColors.mainText : AppColors.greyText,
                fontSize: AppFontSize.s14,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
