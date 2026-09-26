import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/core/utils/pagination/pagination_scroll_mixin.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/presentation/bloc/order_list/order_list_bloc.dart';
import 'package:forsan/presentation/cubit/orders/orders_cubit.dart';
import 'package:forsan/presentation/screens/orders/widgets/orders_search_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/failure_screen.dart';
import '../../widgets/text/section_title.dart';
import 'models/order_item.dart';
import 'widgets/orders_list.dart';
import 'widgets/orders_status_tabs.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<OrderListBloc>(
        create: (_) => OrderListBloc(),
      ),
      BlocProvider<OrdersCubit>(create: (_) => OrdersCubit()),
    ],
    child: const BodyOrdersScreen(),
  );
}

class BodyOrdersScreen extends StatefulWidget {
  const BodyOrdersScreen({super.key});

  @override
  State<BodyOrdersScreen> createState() => _BodyOrdersScreenState();
}

class _BodyOrdersScreenState extends State<BodyOrdersScreen>
    with PaginationScrollMixin<BodyOrdersScreen> {
  Timer? _searchDebounce;

  static const List<OrderItem> _skeletonOrders = [
    OrderItem(
      id: '1',
      title: 'تأسيس شركة جديدة',
      number: 'FR-2026-000000',
      date: '23/09/2026',
      consultant: 'اسم المستشار',
      status: 'قيد المراجعة',
    ),
    OrderItem(
      id: '2',
      title: 'تأسيس شركة جديدة',
      number: 'FR-2026-000000',
      date: '23/09/2026',
      consultant: 'اسم المستشار',
      status: 'قيد المراجعة',
    ),
    OrderItem(
      id: '3',
      title: 'تأسيس شركة جديدة',
      number: 'FR-2026-000000',
      date: '23/09/2026',
      consultant: 'اسم المستشار',
      status: 'قيد المراجعة',
    ),
  ];

  @override
  bool get canLoadMore => context.read<OrderListBloc>().canLoadMore;

  @override
  bool get isLoadingMore => context.read<OrderListBloc>().isLoadingMore;

  @override
  void initState() {
    super.initState();
    context.read<OrderListBloc>().add(
      GetOrderListEvent(context.read<OrdersCubit>().state.entity),
    );
  }

  @override
  void onLoadMore() {
    context.read<OrderListBloc>().add(
      LoadMoreOrderListEvent(context.read<OrdersCubit>().state.entity),
    );
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(seconds: 55), () {
      if (!mounted) return;
      _applySearch(query);
    });
  }

  void _onSearchSubmitted(String query) {
    _searchDebounce?.cancel();
    _applySearch(query);
  }

  void _applySearch(String query) {
    context.read<OrdersCubit>().updateQuery(query);
    _reloadOrders();
  }

  void _onStatusSelected(int index) {
    final cubit = context.read<OrdersCubit>();
    if (index == cubit.state.selectedStatus) return;

    cubit.selectStatus(index);
    _reloadOrders();
  }

  void _reloadOrders() {
    context.read<OrderListBloc>().add(
      GetOrderListEvent(context.read<OrdersCubit>().state.entity),
    );
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<OrdersCubit, OrdersState>(
    builder: (context, ordersState) =>
        BlocBuilder<OrderListBloc, IOrderListState>(
          builder: (context, state) {
          if (state is OrderListFailed) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: _buildAppBar(),
              body: FailureScreen(
                errorMessage: state.message,
                onPressed: _reloadOrders,
              ),
            );
          }

          final loadedState = state is OrderListLoaded ? state : null;
          final counts = loadedState?.orderList?.counts;
          final isLoading =
              state is OrderListInitial || state is OrderListLoading;
          final orders = isLoading
              ? _skeletonOrders
              : loadedState?.items.map(_toOrderItem).toList(growable: false) ??
                    const <OrderItem>[];

          return Skeletonizer(
            enableSwitchAnimation: true,
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              duration: const Duration(milliseconds: 500),
            ),
            enabled: isLoading,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: _buildAppBar(),
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
                        onSearchSubmitted: _onSearchSubmitted,
                        onFilterPressed: () {},

                      ),
                    ),
                    SizedBox(height: AppHeight.h10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPaddingWidth.p16,
                      ),
                      child: OrdersStatusTabs(
                        selectedIndex: ordersState.selectedStatus,
                        onSelected: _onStatusSelected,
                        allCount: counts?.all ?? 0,
                        draftCount: counts?.draft ?? 0,
                        underReviewCount: counts?.underReview ?? 0,
                        awaitingDocumentsCount:
                            counts?.awaitingDocuments ?? 0,
                        quoteReadyCount: counts?.quoteReady ?? 0,
                        awaitingPaymentCount: counts?.awaitingPayment ?? 0,
                        paymentUnderReviewCount:
                            counts?.paymentUnderReview ?? 0,
                        inProgressCount: counts?.inProgress ?? 0,
                        deliveredCount: counts?.delivered ?? 0,
                        completedCount: counts?.completed ?? 0,
                        cancelledCount: counts?.cancelled ?? 0,
                      ),
                    ),
                    Expanded(
                      child: orders.isNotEmpty
                          ? OrdersList(
                              orders: orders,
                              controller: paginationScrollController,
                            )
                          : const _EmptyState(
                              icon: Icons.receipt_long_outlined,
                              title: 'لا توجد طلبات بعد',
                              message:
                                  'ستظهر هنا جميع طلباتك وحالتها عند إضافتها.',
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
          },
        ),
  );

  CustomAppBar _buildAppBar() => CustomAppBar(
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
  );

  OrderItem _toOrderItem(Item item) {
    return OrderItem(
      id: item.id ?? '',
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
