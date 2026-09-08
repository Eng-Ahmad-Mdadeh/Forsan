import 'package:flutter/material.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_values.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(
      title: 'طلباتي',
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
    body: const _EmptyState(
      icon: Icons.receipt_long_outlined,
      title: 'لا توجد طلبات بعد',
      message: 'ستظهر هنا جميع طلباتك وحالتها عند إضافتها.',
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.add_rounded),
      label: const Text('طلب جديد'),
    ),
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
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CircleAvatar(
          radius: 42,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF77727F), height: 1.5)),
      ]),
    ),
  );
}
