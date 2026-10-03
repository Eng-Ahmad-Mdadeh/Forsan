import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:mime/mime.dart';

enum DocumentSource { file, image }

class DocumentPickerSelection {
  const DocumentPickerSelection({
    required this.source,
    required this.allowedExtensions,
  });

  final DocumentSource source;
  final List<String> allowedExtensions;
}

class FilePickerHelper {
  Future<List<PlatformFile>> pickDocuments({
    bool allowMultiple = true,
    List<String> allowedExtensions = AppFileConstraints.documentExtensions,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: allowMultiple,
      );

      return result?.files ?? [];
    } catch (error) {
      debugPrint('Error picking documents: $error');
      return [];
    }
  }

  static List<String> normalizeExtensions(List<String>? acceptedTypes) {
    final types = acceptedTypes?.isNotEmpty == true
        ? acceptedTypes!
        : AppFileConstraints.documentExtensions;

    return types
        .map((type) => type.split('/').last.toLowerCase().replaceFirst('.', ''))
        .toSet()
        .toList();
  }

  static bool isDocumentValid(
    PlatformFile document, {
    required List<String> acceptedTypes,
    required int maxSize,
  }) {
    final normalizedTypes = normalizeExtensions(acceptedTypes).toSet();
    final extension = document.extension?.toLowerCase() ?? '';
    return normalizedTypes.contains(extension) && document.size <= maxSize;
  }

  static String buildUploadHint({
    required int? maxSize,
    required List<String>? acceptedTypes,
    required String Function(String formattedSize, String extensions) formatter,
    String? fallbackText,
    String extensionSeparator = ', ',
  }) {
    if ((maxSize == null || acceptedTypes?.isNotEmpty != true) &&
        fallbackText != null) {
      return fallbackText;
    }

    final resolvedMaxSize =
        maxSize ?? AppFileConstraints.maxDocumentSizeInBytes;
    final extensions = normalizeExtensions(acceptedTypes)
        .map((type) => type.toUpperCase())
        .join(extensionSeparator);
    final sizeInMegabytes = resolvedMaxSize / (1024 * 1024);
    final formattedSize = sizeInMegabytes == sizeInMegabytes.roundToDouble()
        ? sizeInMegabytes.toInt().toString()
        : sizeInMegabytes.toStringAsFixed(1);

    return formatter(formattedSize, extensions);
  }

  static Future<DocumentPickerSelection?> selectDocumentSource(
    BuildContext context,
    List<String>? acceptedTypes,
  ) async {
    final normalizedTypes = normalizeExtensions(acceptedTypes);
    final imageTypes = normalizedTypes
        .where(
          (type) => lookupMimeType('file.$type')?.startsWith('image/') == true,
        )
        .toSet();
    final fileTypes = normalizedTypes.toSet().difference(imageTypes);

    if (imageTypes.isEmpty) {
      return DocumentPickerSelection(
        source: DocumentSource.file,
        allowedExtensions: fileTypes.toList(),
      );
    }
    if (fileTypes.isEmpty) {
      return DocumentPickerSelection(
        source: DocumentSource.image,
        allowedExtensions: imageTypes.toList(),
      );
    }

    final source = await showModalBottomSheet<DocumentSource>(
      context: context,
      backgroundColor: AppColors.white,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(
                Icons.insert_drive_file_outlined,
                color: AppColors.primary,
              ),
              title: BodyTitle(text: context.loc.documents),
              onTap: () => Navigator.pop(context, DocumentSource.file),
            ),
            ListTile(
              leading: const Icon(
                Icons.image_outlined,
                color: AppColors.primary,
              ),
              title: BodyTitle(text: context.loc.image),
              onTap: () => Navigator.pop(context, DocumentSource.image),
            ),
          ],
        ),
      ),
    );

    if (source == null) return null;
    return DocumentPickerSelection(
      source: source,
      allowedExtensions: source == DocumentSource.image
          ? imageTypes.toList()
          : fileTypes.toList(),
    );
  }
}
