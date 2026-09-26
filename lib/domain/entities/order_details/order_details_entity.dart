import 'package:equatable/equatable.dart';

class OrderDetailsEntity extends Equatable {
  const OrderDetailsEntity({this.requestId, this.requestReference});

  final String? requestId;
  final String? requestReference;

  Map<String, dynamic> toJson() {
    return {
      if (requestId != null && requestId!.isNotEmpty)
         'id': requestId,
      if (requestReference != null && requestReference!.isNotEmpty)
         'id': requestReference,
    };
  }

  OrderDetailsEntity copyWith({String? requestId, String? requestReference}) {
    return OrderDetailsEntity(
      requestId: requestId ?? this.requestId,
      requestReference: requestReference ?? this.requestReference,
    );
  }

  @override
  List<Object?> get props => [requestId, requestReference];
}
