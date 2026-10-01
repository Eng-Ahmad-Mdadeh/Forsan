import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/helper/download_file_helper.dart';

void main() {
  group('DownloadFileHelper.safeFileName', () {
    test('uses a fallback when the server does not provide a name', () {
      expect(
        DownloadFileHelper.safeFileName(null, 'document-id'),
        'file-document-id',
      );
    });

    test('trims the name and replaces invalid file-system characters', () {
      expect(
        DownloadFileHelper.safeFileName(' invoice:2026?.pdf ', 'unused-id'),
        'invoice_2026_.pdf',
      );
    });
  });
}
