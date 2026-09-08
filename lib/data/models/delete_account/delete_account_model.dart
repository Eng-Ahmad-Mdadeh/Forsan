import 'package:equatable/equatable.dart';

class DeleteAccountModel extends Equatable {
  const DeleteAccountModel({this.message});

  final String? message;

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) =>
      DeleteAccountModel(message: json['message'] as String?);

  @override
  List<Object?> get props => [message];
}
