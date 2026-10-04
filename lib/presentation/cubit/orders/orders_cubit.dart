import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());

  void selectStatus(int index, String status) {
    if (index < 0 || index == state.selectedStatus) return;

    final entity = OrderListEntity(
      status: status.toLowerCase() == 'all' ? null : status,
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
