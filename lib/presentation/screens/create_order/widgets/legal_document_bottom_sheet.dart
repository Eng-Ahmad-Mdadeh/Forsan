import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/legal_page/legal_page_model.dart';
import 'package:forsan/presentation/bloc/legal_page/legal_page_bloc.dart';
import 'package:forsan/presentation/widgets/linear_loading.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

import '../../../../core/routes/app_routes_imports.dart';
import '../../../../domain/entities/legal_page/legal_page_entity.dart';

class LegalDocumentBottomSheet extends StatelessWidget {
  const LegalDocumentBottomSheet({
    super.key,
    required this.title,
    required this.pageType,
  });

  final String title;
  final String pageType;

  static Future<void> show(BuildContext context, {required String title, required String pageType}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.r16),
        ),
      ),
      builder: (_) => BlocProvider(
        create: (context) =>
        LegalPageBloc()
          ..add(LegalPageEvent(LegalPageEntity(page: pageType))),
        child: LegalDocumentBottomSheet(title: title, pageType: pageType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min, // مهم جداً ليأخذ حجم العناصر بداخله فقط
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
              SizedBox(height: AppHeight.h20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppWidth.w120),
                    child: BodyTitle(
                      text: title,
                      textAlign: TextAlign.center,
                      color: AppColors.mainText,
                      fontSize: AppFontSize.s18,
                      fontWeight: AppFontWeight.bold,
                    ),
                  ),
                  PositionedDirectional(
                    end: -10,
                    child: IconButton(
                      key: const Key('legal_document_close_button'),
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ),
                ],
              ),
              BlocBuilder<LegalPageBloc, ILegalPageState>(
                builder: (context, state) {
                  if (state is LegalPageLoading) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: AppHeight.h40),
                      child: const Center(child: LinearLoading()),
                    );
                  }
                  if (state is LegalPageFailed) {
                    return const SizedBox.shrink();
                  }
                  if (state is LegalPageLoaded) {
                    final sections = state.legalPageModel?.data;

                    // وضع القائمة داخل ConstrainedBox لتحديد أقصى ارتفاع إن كانت الداتا طويلة جداً
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6, // أقصى ارتفاع 60% من الشاشة
                      ),
                      child: ListView.separated(
                        shrinkWrap: true, // ضروري جداً لكي تتمدد القائمة بحسب عدد العناصر دون الحاجة لـ Expanded
                        padding: EdgeInsets.fromLTRB(
                          AppPaddingWidth.p24,
                          AppPaddingHeight.p8,
                          AppPaddingWidth.p24,
                          AppPaddingHeight.p24,
                        ),
                        itemCount: sections?.sections?.length ?? 0,
                        separatorBuilder: (_, __) =>
                            SizedBox(height: AppHeight.h28),
                        itemBuilder: (_, index) =>
                            _LegalSection(model: sections!.sections![index]),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegalSection extends StatelessWidget {
  const _LegalSection({required this.model});

  final Section model;

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
                text: model.title ?? '',
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
          text: model.body ?? '',
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