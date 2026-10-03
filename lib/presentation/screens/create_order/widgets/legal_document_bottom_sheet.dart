import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class LegalDocumentBottomSheet extends StatelessWidget {
  const LegalDocumentBottomSheet({
    super.key,
    required this.title,
    required this.sections,
  });

  final String title;
  final List<LegalDocumentSection> sections;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required List<LegalDocumentSection> sections,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.r16)),
      ),
      builder: (_) => LegalDocumentBottomSheet(title: title, sections: sections),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.88,
      child: Column(
        children: [
          SizedBox(height: AppHeight.h8),
          Container(
            width: AppWidth.w60,
            height: AppHeight.h5,
            decoration: BoxDecoration(
              color: AppColors.lightActive,
              borderRadius: BorderRadius.circular(AppRadius.r4),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPaddingWidth.p40,
                  vertical: AppPaddingHeight.p18,
                ),
                child: BodyTitle(
                  text: title,
                  textAlign: TextAlign.center,
                  color: AppColors.mainText,
                  fontSize: AppFontSize.s18,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              PositionedDirectional(
                start: AppPaddingWidth.p12,
                child: IconButton(
                  key: const Key('legal_document_close_button'),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(
                AppPaddingWidth.p24,
                AppPaddingHeight.p8,
                AppPaddingWidth.p24,
                AppPaddingHeight.p24,
              ),
              itemCount: sections.length,
              separatorBuilder: (_, __) => SizedBox(height: AppHeight.h28),
              itemBuilder: (_, index) => _LegalSection(section: sections[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegalSection extends StatelessWidget {
  const _LegalSection({required this.section});

  final LegalDocumentSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              width: AppWidth.w4,
              height: AppHeight.h32,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppRadius.r4),
              ),
            ),
            SizedBox(width: AppWidth.w10),
            Expanded(
              child: BodyTitle(
                text: section.title,
                textAlign: TextAlign.start,
                color: AppColors.mainText,
                fontSize: AppFontSize.s16,
                fontWeight: AppFontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: AppHeight.h10),
        BodyTitle(
          text: section.body,
          textAlign: TextAlign.start,
          color: AppColors.greyText,
          fontSize: AppFontSize.s14,
          fontWeight: AppFontWeight.regular,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}

class LegalDocumentSection {
  const LegalDocumentSection({required this.title, required this.body});

  final String title;
  final String body;
}
