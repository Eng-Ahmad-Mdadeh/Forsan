// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  greetingName: json['greetingName'] as String?,
  unreadNotifications: (json['unreadNotifications'] as num?)?.toInt(),
  requiredAction: json['requiredAction'] == null
      ? null
      : RequiredAction.fromJson(json['requiredAction'] as Map<String, dynamic>),
  stats: json['stats'] == null
      ? null
      : Stats.fromJson(json['stats'] as Map<String, dynamic>),
  currentRequest: json['currentRequest'] == null
      ? null
      : CurrentRequest.fromJson(json['currentRequest'] as Map<String, dynamic>),
);

CurrentRequest _$CurrentRequestFromJson(Map<String, dynamic> json) =>
    CurrentRequest(
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
      consultant: json['consultant'] == null
          ? null
          : Consultant.fromJson(json['consultant'] as Map<String, dynamic>),
    );

Consultant _$ConsultantFromJson(Map<String, dynamic> json) => Consultant(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  avatarUrl: json['avatarUrl'],
);

RequiredAction _$RequiredActionFromJson(Map<String, dynamic> json) =>
    RequiredAction(
      type: json['type'] as String?,
      requestId: json['requestId'] as String?,
      reference: json['reference'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      actionLabel: json['actionLabel'] as String?,
    );

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
  activeRequests: (json['activeRequests'] as num?)?.toInt(),
  requiredActions: (json['requiredActions'] as num?)?.toInt(),
  totalPaid: json['totalPaid'] == null
      ? null
      : AmountDue.fromJson(json['totalPaid'] as Map<String, dynamic>),
  amountDue: json['amountDue'] == null
      ? null
      : AmountDue.fromJson(json['amountDue'] as Map<String, dynamic>),
);

AmountDue _$AmountDueFromJson(Map<String, dynamic> json) => AmountDue(
  amount: json['amount'] as String?,
  currency: json['currency'] as String?,
);
