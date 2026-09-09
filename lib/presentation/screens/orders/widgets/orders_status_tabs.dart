import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../cubit/orders/orders_status_cubit.dart';
import '../../../widgets/filter_tabs.dart';

class OrdersStatusTabs extends StatelessWidget {
  const OrdersStatusTabs({super.key, this.onSelected});

  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => OrdersStatusCubit(),
    child: _OrdersStatusTabsContent(onSelected: onSelected),
  );
}

class _OrdersStatusTabsContent extends StatelessWidget {
  const _OrdersStatusTabsContent({this.onSelected});

  final ValueChanged<int>? onSelected;

  static const _items = [
    FilterTabItem(label: 'الكل', highlightedText: '(12)'),
    FilterTabItem(
      label: 'قيد المراجعة',
      highlightedText: '(10)',
      highlightedTextColor: AppColors.blue,
    ),
    FilterTabItem(
      label: 'بانتظار مستندات',
      highlightedText: '(01)',
      highlightedTextColor: AppColors.secondary,
    ),
  ];

  @override
  Widget build(BuildContext context) => BlocBuilder<OrdersStatusCubit, int>(
    builder: (context, selectedIndex) => FilterTabs(
      items: _items,
      selectedIndex: selectedIndex,
      unselectedTextColor: AppColors.mainText,
      fontWeight: AppFontWeight.medium,
      backgroundColor: Colors.transparent,
      minTabWidth: AppWidth.w98,
      showTabShadow: true,
      contentPadding: EdgeInsets.zero,
      onSelected: (index) {
        context.read<OrdersStatusCubit>().selectStatus(index);
        onSelected?.call(index);
      },
    ),
  );
}
