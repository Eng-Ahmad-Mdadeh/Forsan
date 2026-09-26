import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());

  static const List<String?> _statuses = [
    null,
    'DRAFT',
    'UNDER_REVIEW',
    'AWAITING_DOCUMENTS',
    'QUOTE_READY',
    'AWAITING_PAYMENT',
    'PAYMENT_UNDER_REVIEW',
    'IN_PROGRESS',
    'DELIVERED',
    'COMPLETED',
    'CANCELLED',
  ];

  void selectStatus(int index) {
    if (index < 0 ||
        index >= _statuses.length ||
        index == state.selectedStatus) {
      return;
    }

    final entity = OrderListEntity(
      status: _statuses[index],
      query: state.entity.query,
      pageSize: state.entity.pageSize,
    );
    emit(state.copyWith(selectedStatus: index, entity: entity));
  }

  void updateQuery(String query) {
    final entity = OrderListEntity(
      status: state.entity.status,
      query: query.trim(),
      pageSize: state.entity.pageSize,
    );
    emit(state.copyWith(entity: entity));
  }
}
