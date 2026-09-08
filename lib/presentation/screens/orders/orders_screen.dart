import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/orders_search_bar.dart';
import '../../widgets/text/section_title.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(
      title: 'طلباتي',
      toolbarHeight: AppHeight.h70,
      showScrolledUnderElevation: false,
      titleSpacing: AppPaddingWidth.p16,
      titleWidget: SectionTitle(
        text: 'طلباتي',
        color: AppColors.mainText,
        fontSize: AppFontSize.s24,
        fontWeight: AppFontWeight.bold,
      ),
      customActions: [
        HeaderIconButton(
          icon: Iconsax.notification_outline,
          onTap: () {},
        ),
      ],
    ),
    body: Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            AppPaddingWidth.p16,
            AppPaddingHeight.p20,
            AppPaddingWidth.p16,
            0,
          ),
          child: OrdersSearchBar(
            onSearchChanged: (_) {},
            onFilterPressed: () {},
          ),
        ),
        Expanded(
          child: _EmptyState(
            icon: Icons.receipt_long_outlined,
            title: 'لا توجد طلبات بعد',
            message: 'ستظهر هنا جميع طلباتك وحالتها عند إضافتها.',
          ),
        ),
      ],
    ),
    // floatingActionButton: FloatingActionButton.extended(
    //   onPressed: () {},
    //   icon: const Icon(Icons.add_rounded),
    //   label: const Text('طلب جديد'),
    // ),
  );
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.title, required this.message});

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: EdgeInsets.all(AppPaddingWidth.p31),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: AppRadius.r45,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Icon(icon, size: AppSize.s40, color: Theme.of(context).colorScheme.primary),
          ),
          SizedBox(height: AppHeight.h20),
          SectionTitle(text: title, fontSize: AppFontSize.s20, fontWeight: AppFontWeight.extraBold),
          SizedBox(height: AppHeight.h8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.greyText, height: 1.5),
          ),
        ],
      ),
    ),
  );
}
