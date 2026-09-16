import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class TermsAndConditionsCard extends StatefulWidget {
  const TermsAndConditionsCard({super.key});

  @override
  State<TermsAndConditionsCard> createState() => _TermsAndConditionsCardState();
}

class _TermsAndConditionsCardState extends State<TermsAndConditionsCard> {
  static const String _description =
      'من خلال دخولك أو وصولك أو استخدامك (من خلالك أو من '
      'خلال وكلائك أو موظفيك) إلى الموقع الإلكتروني maktab.sa '
      '(المشار إليه بعبارة "الموقع") التابع للمنصة فإنك توافق على '
      'سياسة الخصوصية هذه كما هي اعتبارًا من تاريخ نشرها على الموقع. '
      'فإذا لم توافق على هذه السياسة، فيرجى التوقف عن استخدام الموقع.';

  bool _isExpanded = false;
  late final TapGestureRecognizer _loadMoreRecognizer;

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
                      text: 'الشروط و الأحكام',
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
                      text: _isExpanded
                          ? _description
                          : _description.substring(
                        0,
                        _description.indexOf('توافق على هذه السياسة'),
                      ),
                      style: bodyStyle.copyWith(
                        fontSize: AppSize.s14,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                    if (!_isExpanded) const TextSpan(text: '  '),
                    if (!_isExpanded)
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
