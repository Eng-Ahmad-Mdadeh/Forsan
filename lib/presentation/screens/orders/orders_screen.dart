import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/core/utils/pagination/pagination_scroll_mixin.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:forsan/presentation/bloc/order_list/order_list_bloc.dart';
import 'package:forsan/presentation/screens/orders/widgets/orders_search_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/text/section_title.dart';
import 'models/order_item.dart';
import 'widgets/orders_list.dart';
import 'widgets/orders_status_tabs.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => OrderListBloc(
      locator<IUseCase<BaseModel<OrderListModel>?, OrderListEntity>>(
        instanceName: 'OrderList',
      ),
    )..add(const GetOrderListEvent(OrderListEntity())),
    child: const _OrdersView(),
  );
}

class _OrdersView extends StatefulWidget {
  const _OrdersView();

  @override
  State<_OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<_OrdersView>
    with PaginationScrollMixin<_OrdersView> {
  static const List<String?> _statuses = [
    null,
    'UNDER_REVIEW',
    'WAITING_DOCUMENTS',
  ];

  Timer? _searchDebounce;
  String _query = '';
  int _selectedStatus = 0;

  OrderListEntity get _entity => OrderListEntity(
    status: _statuses[_selectedStatus],
    query: _query,
  );

  @override
  bool get canLoadMore => context.read<OrderListBloc>().canLoadMore;

  @override
  bool get isLoadingMore => context.read<OrderListBloc>().isLoadingMore;

  @override
  void onLoadMore() {
    context.read<OrderListBloc>().add(LoadMoreOrderListEvent(_entity));
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      _query = query.trim();
      _reloadOrders();
    });
  }

  void _onStatusSelected(int index) {
    if (index == _selectedStatus) return;

    setState(() => _selectedStatus = index);
    _reloadOrders();
  }

  void _reloadOrders() {
    context.read<OrderListBloc>().add(GetOrderListEvent(_entity));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: CustomAppBar(
      title: 'طلباتي',
      backgroundColor: AppColors.white,
      toolbarHeight: AppHeight.h70,
      showScrolledUnderElevation: false,
      titleSpacing: AppPaddingWidth.p16,
      titleWidget: SectionTitle(
        text: 'طلباتي',
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
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppPaddingWidth.p16,
              AppPaddingHeight.p20,
              AppPaddingWidth.p16,
              0,
            ),
            child: OrdersSearchBar(
              onSearchChanged: _onSearchChanged,
              onFilterPressed: () {},
            ),
          ),
          SizedBox(height: AppHeight.h10),
          BlocBuilder<OrderListBloc, IOrderListState>(
            buildWhen: (previous, current) => current is OrderListLoaded,
            builder: (context, state) {
              final counts = state is OrderListLoaded
                  ? state.orderList?.counts
                  : null;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p16),
                child: OrdersStatusTabs(
                  selectedIndex: _selectedStatus,
                  onSelected: _onStatusSelected,
                  allCount: counts?.all ?? 0,
                  underReviewCount: counts?.underReview ?? 0,
                  waitingDocumentsCount: counts?.waitingDocuments ?? 0,
                ),
              );
            },
          ),
          Expanded(
            child: BlocBuilder<OrderListBloc, IOrderListState>(
              builder: (context, state) => switch (state) {
                OrderListInitial() || OrderListLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                OrderListFailed(:final message) => _ErrorState(
                  message: message,
                  onRetry: _reloadOrders,
                ),
                OrderListLoaded(:final items) when items.isNotEmpty =>
                  OrdersList(
                    orders: items.map(_toOrderItem).toList(growable: false),
                    controller: paginationScrollController,
                  ),
                OrderListLoaded() => const _EmptyState(
                  icon: Icons.receipt_long_outlined,
                  title: 'لا توجد طلبات بعد',
                  message: 'ستظهر هنا جميع طلباتك وحالتها عند إضافتها.',
                ),
              },
            ),
          ),
        ],
      ),
    ),
  );

  OrderItem _toOrderItem(Item item) {
    return OrderItem(
      title: item.serviceName ?? '',
      number: item.reference ?? '',
      date: item.createdAt == null
          ? ''
          : DateFormat('dd/MM/yyyy').format(item.createdAt!.toLocal()),
      consultant: _consultantName(item.consultant),
      status: item.statusLabel ?? item.displayStatus ?? '',
    );
  }

  String _consultantName(dynamic consultant) {
    if (consultant is Map<String, dynamic>) {
      return consultant['fullName']?.toString() ?? '';
    }
    return consultant?.toString() ?? '';
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: EdgeInsets.all(AppPaddingWidth.p24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),
          SizedBox(height: AppHeight.h12),
          FilledButton(onPressed: onRetry, child: const Text('إعادة المحاولة')),
        ],
      ),
    ),
  );
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.title,
    required this.message,
  });

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
            child: Icon(
              icon,
              size: AppSize.s40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: AppHeight.h20),
          SectionTitle(
            text: title,
            fontSize: AppFontSize.s20,
            fontWeight: AppFontWeight.extraBold,
          ),
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
