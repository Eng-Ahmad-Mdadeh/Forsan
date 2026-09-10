import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_header.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_help_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_notification_button.dart';
import 'package:forsan/presentation/screens/create_order/widgets/create_order_services_grid.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: context.loc.create_order_title,
        backgroundColor: AppColors.white,
        showBackButton: true,
        showScrolledUnderElevation: false,
        customActions: const [CreateOrderNotificationButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p16,
            AppPaddingWidth.p16,
            AppPaddingHeight.p24,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CreateOrderHeader(),
              CreateOrderServicesGrid(),
              CreateOrderHelpCard(),
            ],
          ),
        ),
      ),
    );
  }
}
