import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_details_model.g.dart';
part 'stage/stage_model.dart';
part 'customer/customer_model.dart';
part 'actions/actions_model.dart';

@JsonSerializable(createToJson: false)
class OrderDetailsModel extends Equatable {
  OrderDetailsModel({
    required this.id,
    required this.reference,
    required this.serviceName,
    required this.categoryName,
    required this.status,
    required this.displayStatus,
    required this.statusLabel,
    required this.progress,
    required this.createdAt,
    required this.consultant,
    required this.customer,
    required this.applicantName,
    required this.requiredAction,
    required this.payment,
    required this.stages,
    required this.requiredDocuments,
    required this.attachments,
    required this.actions,
  });

  final String? id;
  final String? reference;
  final String? serviceName;
  final String? categoryName;
  final String? status;
  final String? displayStatus;
  final String? statusLabel;
  final int? progress;
  final DateTime? createdAt;
  final dynamic consultant;
  final Customer? customer;
  final String? applicantName;
  final dynamic requiredAction;
  final Payment? payment;
  final List<Stage>? stages;
  final List<dynamic>? requiredDocuments;
  final List<dynamic>? attachments;
  final Actions? actions;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => _$OrderDetailsModelFromJson(json);

  @override
  List<Object?> get props => [
    id, reference, serviceName, categoryName, status, displayStatus, statusLabel, progress, createdAt, consultant, customer, applicantName, requiredAction, payment, stages, requiredDocuments, attachments, actions, ];
}

@JsonSerializable(createToJson: false)
class Payment extends Equatable {
  Payment({
    required this.total,
    required this.paid,
    required this.remaining,
    required this.status,
  });

  final dynamic total;
  final Paid? paid;
  final Paid? remaining;
  final String? status;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  @override
  List<Object?> get props => [
    total, paid, remaining, status, ];
}

@JsonSerializable(createToJson: false)
class Paid extends Equatable {
  Paid({
    required this.amount,
    required this.currency,
  });

  final String? amount;
  final String? currency;

  factory Paid.fromJson(Map<String, dynamic> json) => _$PaidFromJson(json);

  @override
  List<Object?> get props => [
    amount, currency, ];
}

