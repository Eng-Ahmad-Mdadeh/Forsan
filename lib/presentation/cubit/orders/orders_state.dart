part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  const OrdersState({
    this.selectedStatus = 0,
    this.entity = const OrderListEntity(),
  });

  final int selectedStatus;
  final OrderListEntity entity;

  OrdersState copyWith({
    int? selectedStatus,
    OrderListEntity? entity,
  }) {
    return OrdersState(
      selectedStatus: selectedStatus ?? this.selectedStatus,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object?> get props => [selectedStatus, entity];
}
