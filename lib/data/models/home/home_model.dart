import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable(createToJson: false)
class HomeModel extends Equatable {
  HomeModel({
    required this.greetingName,
    required this.unreadNotifications,
    required this.requiredAction,
    required this.stats,
    required this.currentRequest,
  });

  final String? greetingName;
  final int? unreadNotifications;
  final dynamic requiredAction;
  final Stats? stats;
  final dynamic currentRequest;

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  @override
  List<Object?> get props => [
    greetingName, unreadNotifications, requiredAction, stats, currentRequest, ];
}

@JsonSerializable(createToJson: false)
class Stats extends Equatable {
  Stats({
    required this.activeRequests,
    required this.requiredActions,
    required this.totalPaid,
    required this.amountDue,
  });

  final int? activeRequests;
  final int? requiredActions;
  final AmountDue? totalPaid;
  final AmountDue? amountDue;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  @override
  List<Object?> get props => [
    activeRequests, requiredActions, totalPaid, amountDue, ];
}

@JsonSerializable(createToJson: false)
class AmountDue extends Equatable {
  AmountDue({
    required this.amount,
    required this.currency,
  });

  final String? amount;
  final String? currency;

  factory AmountDue.fromJson(Map<String, dynamic> json) => _$AmountDueFromJson(json);

  @override
  List<Object?> get props => [
    amount, currency, ];
}
