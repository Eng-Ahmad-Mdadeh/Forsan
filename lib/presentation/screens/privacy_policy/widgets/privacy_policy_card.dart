import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/legal_page/legal_page_model.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class PrivacyPolicyCard extends StatefulWidget {
  const PrivacyPolicyCard({required this.section, super.key});

  final Section section;

  @override
  State<PrivacyPolicyCard> createState() => _PrivacyPolicyCardState();
}

class _PrivacyPolicyCardState extends State<PrivacyPolicyCard> {
  static const int _previewCharacterLimit = 200;

  bool _isExpanded = false;
  late final TapGestureRecognizer _loadMoreRecognizer;

  String get _body => widget.section.body?.trim() ?? '';

  String get _collapsedBody {
    final firstParagraphEnd = _body.indexOf('\n\n');
    if (firstParagraphEnd > 0) {
      return _body.substring(0, firstParagraphEnd);
    }

    if (_body.length <= _previewCharacterLimit) {
      return _body;
    }

    final lastSpace = _body.lastIndexOf(' ', _previewCharacterLimit);
    final previewEnd = lastSpace > 0 ? lastSpace : _previewCharacterLimit;
    return '${_body.substring(0, previewEnd).trimRight()}…';
  }

  bool get _canExpand => _collapsedBody.length < _body.length;

  @override
  void initState() {
    super.initState();
    _loadMoreRecognizer = TapGestureRecognizer()
      ..onTap = () => setState(() => _isExpanded = true);
  }

  @override
  void dispose() {
    _loadMoreRecognizer.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PrivacyPolicyCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.section != widget.section) {
      _isExpanded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: AppColors.mainText,
      fontSize: AppFontSize.s16,
      fontWeight: AppFontWeight.regular,
      height: 1.9,
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: SectionCard(
          showBorder: true,
          borderRadius: BorderRadius.circular(AppRadius.r16),
          padding: EdgeInsets.symmetric(
            horizontal: AppPaddingWidth.p18,
            vertical: AppPaddingHeight.p20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: AppWidth.w4,
                    height: AppHeight.h28,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(AppRadius.r4),
                    ),
                  ),
                  SizedBox(width: AppWidth.w12),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: AppPaddingHeight.p4,
                    ),
                    child: SectionTitle(
                      text: [
                        if (widget.section.number != null)
                          '${widget.section.number}.',
                        if (widget.section.title?.trim().isNotEmpty ?? false)
                          widget.section.title!.trim(),
                      ].join(' '),
                      textAlign: TextAlign.start,
                      color: AppColors.primary,
                      fontSize: AppFontSize.s14,
                      fontWeight: AppFontWeight.bold,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppHeight.h12),
              BodyTitle(
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
                textSpan: TextSpan(
                  style: bodyStyle,
                  children: [
                    TextSpan(
                      text: _isExpanded ? _body : _collapsedBody,
                      style: bodyStyle.copyWith(
                        fontSize: AppSize.s14,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                    if (!_isExpanded && _canExpand)
                      const TextSpan(text: '  '),
                    if (!_isExpanded && _canExpand)
                      TextSpan(
                        text: context.loc.loadMore,
                        style: bodyStyle.copyWith(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          fontSize: AppSize.s14,
                          fontWeight: AppFontWeight.regular,
                          decorationColor: AppColors.primary,
                        ),
                        recognizer: _loadMoreRecognizer,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
