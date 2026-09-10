import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_assets.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/image_view.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = <_ServiceType>[
      _ServiceType(context.loc.create_order_licensing, Icons.approval_outlined),
      _ServiceType(
        context.loc.create_order_business_setup,
        Icons.apartment_outlined,
      ),
      _ServiceType(
        context.loc.create_order_company_management,
        Icons.business_center_outlined,
      ),
      _ServiceType(
        context.loc.create_order_property,
        Icons.maps_home_work_outlined,
      ),
      _ServiceType(
        context.loc.create_order_investment,
        Icons.account_balance_outlined,
        enabled: false,
      ),
      _ServiceType(
        context.loc.create_order_expatriate_services,
        Icons.public_rounded,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: context.loc.create_order_title,
        backgroundColor: AppColors.white,
        showBackButton: true,
        showScrolledUnderElevation: false,
        customActions: [
          Semantics(
            button: true,
            label: 'الإشعارات',
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(AppRadius.r8),
              child: Container(
                width: AppWidth.w40,
                height: AppHeight.h40,
                decoration: BoxDecoration(
                  color: AppColors.backGround,
                  border: Border.all(color: AppColors.greyDivider),
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.lightBlack,
                  size: AppSize.s24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p16,
            AppPaddingWidth.p16,
            AppPaddingHeight.p24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                image: true,
                label: 'طلب جديد',
                child: ImageView(
                  imagePath: AppAssets.newOrder,
                  key: const Key('create_order_image'),
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: AppHeight.h16),
              SectionTitle(
                text: context.loc.create_order_choose_service,
                color: AppColors.primaryDark,
                fontSize: AppFontSize.s14,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: AppHeight.h12),
              Expanded(
                child: GridView.builder(
                  itemCount: services.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppWidth.w8,
                    mainAxisSpacing: AppHeight.h10,
                    childAspectRatio: 1.58,
                  ),
                  itemBuilder: (context, index) =>
                      _ServiceCard(service: services[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceType {
  const _ServiceType(this.title, this.icon, {this.enabled = true});

  final String title;
  final IconData icon;
  final bool enabled;
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});

  final _ServiceType service;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: service.enabled,
      enabled: service.enabled,
      label: service.title,
      child: SectionCard(
        onTap: service.enabled ? () {} : null,
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
