import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({this.id, this.name, this.phone});

  final num? id;
  final String? name;
  final String? phone;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as num?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
  );

  @override
  List<Object?> get props => [id, name, phone];
}
