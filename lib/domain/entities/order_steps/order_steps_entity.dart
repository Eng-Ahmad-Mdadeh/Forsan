
import 'package:equatable/equatable.dart';

class OrderStepsEntity extends Equatable {
  const OrderStepsEntity({
    this.serviceSlug,

  });

  final String? serviceSlug;

  Map<String, dynamic> toJson() {
    return {
      if (serviceSlug != null && serviceSlug!.isNotEmpty) 'slug': serviceSlug,

    };
  }

  OrderStepsEntity copyWith({
    String? serviceSlug,

  }) {
    return OrderStepsEntity(
      serviceSlug: serviceSlug ?? this.serviceSlug,

    );
  }

  @override
  List<Object?> get props => [serviceSlug];
}
