import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_type_model.g.dart';

@JsonSerializable(createToJson: false)
class ServiceTypeModel extends Equatable {
  ServiceTypeModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.comingSoon,
  });

  final String? id;
  final String? slug;
  final String? name;
  final String? description;
  final dynamic iconUrl;
  final bool? comingSoon;

  factory ServiceTypeModel.fromJson(Map<String, dynamic> json) => _$ServiceTypeModelFromJson(json);

  @override
  List<Object?> get props => [
    id, slug, name, description, iconUrl, comingSoon, ];
}
