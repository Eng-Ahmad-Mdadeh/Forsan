import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/create_order/models/service_type.dart';
import 'package:forsan/presentation/screens/create_order/widgets/service_card.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CreateOrderServicesGrid extends StatelessWidget {
  const CreateOrderServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      ServiceType(context.loc.create_order_licensing, Icons.approval_outlined),
      ServiceType(
        context.loc.create_order_business_setup,
        Icons.apartment_outlined,
      ),
      ServiceType(
        context.loc.create_order_company_management,
        Icons.business_center_outlined,
      ),
      ServiceType(
        context.loc.create_order_property,
        Icons.maps_home_work_outlined,
      ),
      ServiceType(
        context.loc.create_order_investment,
        Icons.account_balance_outlined,
        enabled: false,
      ),
      ServiceType(
        context.loc.create_order_expatriate_services,
        Icons.public_rounded,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(
          text: context.loc.create_order_choose_service,
          color: AppColors.primaryDark,
          fontSize: AppFontSize.s14,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: AppHeight.h12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppWidth.w8,
            mainAxisSpacing: AppHeight.h10,
            childAspectRatio: 1.58,
          ),
          itemBuilder: (context, index) => ServiceCard(service: services[index]),
        ),
        SizedBox(height: AppHeight.h16),
      ],
    );
  }
}
