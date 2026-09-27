
import 'package:equatable/equatable.dart';

class CreateOrderEntity extends Equatable {
  const CreateOrderEntity({
    this.serviceSlug,

  });

  final String? serviceSlug;

  Map<String, dynamic> toJson() {
    return {
      if (serviceSlug != null && serviceSlug!.isNotEmpty) 'slug': serviceSlug,

    };
  }

  CreateOrderEntity copyWith({
    String? serviceSlug,

  }) {
    return CreateOrderEntity(
      serviceSlug: serviceSlug ?? this.serviceSlug,

    );
  }

  @override
  List<Object?> get props => [serviceSlug];
}
