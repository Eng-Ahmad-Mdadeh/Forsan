import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/routes/app_routes.dart';
import 'package:forsan/data/models/service_type/service_type_model.dart';
import 'package:forsan/presentation/screens/create_order/widgets/service_card.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class CreateOrderServicesGrid extends StatelessWidget {
  const CreateOrderServicesGrid({
    super.key,
    required this.serviceTypes,
  });

  final List<ServiceTypeModel> serviceTypes;

  @override
  Widget build(BuildContext context) {
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
          itemCount: serviceTypes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppWidth.w8,
            mainAxisSpacing: AppHeight.h10,
            childAspectRatio: 1.58,
          ),
          itemBuilder: (context, index) => ServiceCard(
            service: serviceTypes[index],
            onTap: () => const CreateNewOrderRoute().push(context),
          ),
        ),
        SizedBox(height: AppHeight.h16),
      ],
    );
  }
}
