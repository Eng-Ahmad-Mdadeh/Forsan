part of '../order_details_model.dart';


@JsonSerializable(createToJson: false)
class Actions extends Equatable {
  Actions({
    required this.canAcceptQuote,
    required this.canPay,
    required this.canUploadDocuments,
    required this.canChat,
  });

  final bool? canAcceptQuote;
  final bool? canPay;
  final bool? canUploadDocuments;
  final bool? canChat;

  factory Actions.fromJson(Map<String, dynamic> json) => _$ActionsFromJson(json);

  @override
  List<Object?> get props => [
    canAcceptQuote, canPay, canUploadDocuments, canChat, ];
}
