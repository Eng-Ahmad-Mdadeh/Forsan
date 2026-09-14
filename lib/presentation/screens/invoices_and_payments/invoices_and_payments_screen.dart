import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class InvoicesAndPaymentsScreen extends StatelessWidget {
  const InvoicesAndPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الفواتير والمدفوعات',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showScrolledUnderElevation: false,
        showBackButton: true,
        titleSpacing: AppPaddingWidth.p16,
        titleWidget: SectionTitle(
          text: 'الفواتير والمدفوعات',
          color: AppColors.mainText,
          fontSize: AppFontSize.s18,
          fontWeight: AppFontWeight.bold,
        ),
        customActions: [
          HeaderIconButton(
            icon: Iconsax.notification_outline,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
