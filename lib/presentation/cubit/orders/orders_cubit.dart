import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';

class OrdersCubit extends Cubit<int> {
  OrdersCubit() : super(0);

  static const List<String?> _statuses = [
    null,
    'UNDER_REVIEW',
    'WAITING_DOCUMENTS',
  ];

  OrderListEntity _entity = const OrderListEntity();

  OrderListEntity get entity => _entity;

  void selectStatus(int index) {
    if (index < 0 || index >= _statuses.length || index == state) return;

    _entity = OrderListEntity(
      status: _statuses[index],
      query: _entity.query,
      pageSize: _entity.pageSize,
    );
    emit(index);
  }

  void updateQuery(String query) {
    _entity = OrderListEntity(
      status: _entity.status,
      query: query.trim(),
      pageSize: _entity.pageSize,
    );
  }
}
