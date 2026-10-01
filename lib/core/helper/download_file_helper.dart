import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class DownloadFileHelper {
  const DownloadFileHelper._();

  static Future<String?> saveFile({
    required Uint8List bytes,
    required String fileId,
    String? fileName,
    String? dialogTitle,
  }) {
    return FilePicker.platform.saveFile(
      dialogTitle: dialogTitle,
      fileName: safeFileName(fileName, fileId),
      bytes: bytes,
    );
  }

  static String safeFileName(String? fileName, String fileId) {
    final trimmedName = fileName?.trim() ?? '';
    if (trimmedName.isEmpty) return 'file-$fileId';

    return trimmedName.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
  }
}
