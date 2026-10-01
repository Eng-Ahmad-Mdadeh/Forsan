import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'document_details_model.g.dart';

part 'attachment/attachment_model.dart';

part 'required_action/required_action_model.dart';

part 'required_document/required_document_model.dart';

@JsonSerializable(createToJson: false)
class DocumentDetailsModel extends Equatable {
  DocumentDetailsModel({
    required this.requiredAction,
    required this.requiredDocuments,
    required this.attachments,
    required this.uploads,
  });

  final RequiredActionModel? requiredAction;
  final List<RequiredDocumentModel>? requiredDocuments;
  final List<AttachmentModel>? attachments;
  final List<AttachmentModel>? uploads;

  factory DocumentDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentDetailsModelFromJson(json);

  @override
  List<Object?> get props => [
    requiredAction,
    requiredDocuments,
    attachments,
    uploads,
  ];
}
