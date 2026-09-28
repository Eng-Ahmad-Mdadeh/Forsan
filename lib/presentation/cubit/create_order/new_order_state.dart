import 'package:equatable/equatable.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';

class NewOrderState extends Equatable {
  const NewOrderState({this.orderEntity = const CreateOrderEntity()});

  final CreateOrderEntity orderEntity;

  NewOrderState copyWith({CreateOrderEntity? orderEntity}) {
    return NewOrderState(orderEntity: orderEntity ?? this.orderEntity);
  }

  @override
  List<Object?> get props => [orderEntity];
}
