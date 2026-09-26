import 'package:equatable/equatable.dart';

class OrderDetailsEntity extends Equatable {
  const OrderDetailsEntity({this.requestId, this.requestReference});

  final String? requestId;
  final String? requestReference;

  String? get requestIdentifier {
    final id = requestId?.trim();
    if (id != null && id.isNotEmpty) return id;

    final reference = requestReference?.trim();
    return reference == null || reference.isEmpty ? null : reference;
  }

  Map<String, dynamic> toJson() {
    final identifier = requestIdentifier;
    return {if (identifier != null) 'id': identifier};
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
