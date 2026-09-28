import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:forsan/core/resources/app_values.dart';

class FilePickerHelper {
  Future<List<PlatformFile>> pickDocuments({bool allowMultiple = true}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: AppFileConstraints.documentExtensions,
        allowMultiple: allowMultiple,
      );

      return result?.files ?? [];
    } catch (error) {
      debugPrint('Error picking documents: $error');
      return [];
    }
  }
}
