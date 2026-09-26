// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsModel _$OrderDetailsModelFromJson(Map<String, dynamic> json) =>
    OrderDetailsModel(
      id: json['id'] as String?,
      reference: json['reference'] as String?,
      serviceName: json['serviceName'] as String?,
      categoryName: json['categoryName'] as String?,
      status: json['status'] as String?,
      displayStatus: json['displayStatus'] as String?,
      statusLabel: json['statusLabel'] as String?,
      progress: (json['progress'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      consultant: json['consultant'],
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      applicantName: json['applicantName'] as String?,
      requiredAction: json['requiredAction'],
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
      stages: (json['stages'] as List<dynamic>?)
          ?.map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredDocuments: json['requiredDocuments'] as List<dynamic>?,
      attachments: json['attachments'] as List<dynamic>?,
      actions: json['actions'] == null
          ? null
          : Actions.fromJson(json['actions'] as Map<String, dynamic>),
    );

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
  total: json['total'],
  paid: json['paid'] == null
      ? null
      : Paid.fromJson(json['paid'] as Map<String, dynamic>),
  remaining: json['remaining'] == null
      ? null
      : Paid.fromJson(json['remaining'] as Map<String, dynamic>),
  status: json['status'] as String?,
);

Paid _$PaidFromJson(Map<String, dynamic> json) => Paid(
  amount: json['amount'] as String?,
  currency: json['currency'] as String?,
);

Stage _$StageFromJson(Map<String, dynamic> json) => Stage(
  key: json['key'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  state: json['state'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
);

Actions _$ActionsFromJson(Map<String, dynamic> json) => Actions(
  canAcceptQuote: json['canAcceptQuote'] as bool?,
  canPay: json['canPay'] as bool?,
  canUploadDocuments: json['canUploadDocuments'] as bool?,
  canChat: json['canChat'] as bool?,
);
