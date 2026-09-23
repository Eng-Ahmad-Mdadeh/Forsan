import 'package:flutter/material.dart';
import 'package:forsan/data/models/service_type/service_type_model.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service, this.onTap});

  final ServiceTypeModel service;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: service.comingSoon != true,
      enabled: service.comingSoon != true,
      label: service.name ?? '',
      child: SectionCard(
        onTap: service.comingSoon != true ? onTap ?? () {} : null,
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
                child: service.iconUrl == null
                    ? Icon(
                        Icons.design_services_outlined,
                        color: AppColors.primaryDark,
                        size: AppSize.s30,
                      )
                    : Padding(
                        padding: EdgeInsets.all(AppPaddingWidth.p8),
                        child: ImageView(
                          imagePath: service.iconUrl.toString(),
                          color: AppColors.primaryDark,
                          fit: BoxFit.contain,
                          excludeFromSemantics: true,
                        ),
                      ),
              ),
              SizedBox(height: AppHeight.h10),
              BodyTitle(
                text: service.name ?? '',
                textAlign: TextAlign.center,
                color: service.comingSoon != true
                    ? AppColors.mainText
                    : AppColors.greyText,
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
