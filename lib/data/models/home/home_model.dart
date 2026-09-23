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
  final RequiredAction? requiredAction;
  final Stats? stats;
  final CurrentRequest? currentRequest;

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  @override
  List<Object?> get props => [
    greetingName, unreadNotifications, requiredAction, stats, currentRequest, ];
}

@JsonSerializable(createToJson: false)
class CurrentRequest extends Equatable {
  CurrentRequest({
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
  final Consultant? consultant;

  factory CurrentRequest.fromJson(Map<String, dynamic> json) => _$CurrentRequestFromJson(json);

  @override
  List<Object?> get props => [
    id, reference, serviceName, categoryName, status, displayStatus, statusLabel, progress, createdAt, consultant, ];
}

@JsonSerializable(createToJson: false)
class Consultant extends Equatable {
  Consultant({
    required this.id,
    required this.fullName,
    required this.avatarUrl,
  });

  final String? id;
  final String? fullName;
  final dynamic avatarUrl;

  factory Consultant.fromJson(Map<String, dynamic> json) => _$ConsultantFromJson(json);

  @override
  List<Object?> get props => [
    id, fullName, avatarUrl, ];
}

@JsonSerializable(createToJson: false)
class RequiredAction extends Equatable {
  RequiredAction({
    required this.type,
    required this.requestId,
    required this.reference,
    required this.title,
    required this.message,
    required this.actionLabel,
  });

  final String? type;
  final String? requestId;
  final String? reference;
  final String? title;
  final String? message;
  final String? actionLabel;

  factory RequiredAction.fromJson(Map<String, dynamic> json) => _$RequiredActionFromJson(json);

  @override
  List<Object?> get props => [
    type, requestId, reference, title, message, actionLabel, ];
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
