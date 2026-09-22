// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  greetingName: json['greetingName'] as String?,
  unreadNotifications: (json['unreadNotifications'] as num?)?.toInt(),
  requiredAction: json['requiredAction'],
  stats: json['stats'] == null
      ? null
      : Stats.fromJson(json['stats'] as Map<String, dynamic>),
  currentRequest: json['currentRequest'],
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
