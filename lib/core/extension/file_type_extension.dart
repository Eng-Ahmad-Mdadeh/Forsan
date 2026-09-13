import 'package:file_picker/file_picker.dart';
import 'package:forsan/core/resources/app_values.dart';

enum AppFileType { pdf, image, unsupported }

extension FileTypeExtension on PlatformFile {
  AppFileType get fileType {
    final value = (extension ?? _extensionFromName).toLowerCase();

    if (!AppFileConstraints.documentExtensions.contains(value)) {
      return AppFileType.unsupported;
    }

    return value == 'pdf' ? AppFileType.pdf : AppFileType.image;
  }

  bool get isSupportedDocument => fileType != AppFileType.unsupported;

  bool get isWithinDocumentSizeLimit =>
      size <= AppFileConstraints.maxDocumentSizeInBytes;

  bool get isValidDocument =>
      isSupportedDocument && isWithinDocumentSizeLimit;

  String get _extensionFromName {
    final separatorIndex = name.lastIndexOf('.');
    return separatorIndex == -1 ? '' : name.substring(separatorIndex + 1);
  }
}
