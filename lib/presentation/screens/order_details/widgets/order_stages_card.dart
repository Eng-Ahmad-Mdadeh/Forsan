import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';

class OrderStagesCard extends StatelessWidget {
  const OrderStagesCard({super.key, required this.stages});

  final List<Stage> stages;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Semantics(
        container: true,
        label: context.loc.order_stages,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.r12),
            boxShadow: [
              BoxShadow(
                color: AppColors.homeSoftShadow.withOpacity(0.06),
                blurRadius: AppRadius.r7,
                offset: Offset(0, AppHeight.h2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              AppPaddingWidth.p16,
              AppPaddingHeight.p18,
              AppPaddingWidth.p16,
              AppPaddingHeight.p16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _OrderStagesHeader(title: context.loc.order_stages),
                SizedBox(height: AppHeight.h14),
                for (var index = 0; index < stages.length; index++)
                  _OrderStageRow(
                    stage: stages[index],
                    isFirst: index == 0,
                    isLast: index == stages.length - 1,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OrderStagesHeader extends StatelessWidget {
  const _OrderStagesHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: AppWidth.w30,
        height: AppHeight.h30,
        decoration: BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.info_outline_rounded,
          size: AppSize.s20,
          color: AppColors.secondaryText,
        ),
      ),
      SizedBox(width: AppWidth.w8),
      Expanded(
        child: SectionTitle(
          text: title,
          color: AppColors.mainText,
          fontSize: AppFontSize.s15,
          fontWeight: AppFontWeight.bold,
        ),
      ),

    ],
  );
}

class _OrderStageRow extends StatelessWidget {
  const _OrderStageRow({
    required this.stage,
    required this.isFirst,
    required this.isLast,
  });

  final Stage stage;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: AppWidth.w16,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: isFirst ? AppHeight.h7 : 0,
                bottom: isLast ? null : 0,
                height: isLast ? AppHeight.h7 : null,
                child: Container(
                  width: AppWidth.w1,
                  color: AppColors.mainTextLight,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: AppMarginHeight.m3),
                width: AppWidth.w16,
                height: AppHeight.h16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isCurrent ? AppColors.light : AppColors.none,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: AppWidth.w10,
                  height: AppHeight.h10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isCompleted
                        ? AppColors.homeSupportAction
                        : AppColors.mainTextLightActive,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: AppWidth.w8),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : AppPaddingHeight.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SectionTitle(
                        text: stage.title ?? '',
                        color: AppColors.mainText,
                        fontSize: AppFontSize.s13,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                    if (stage.date != null) ...[
                      SizedBox(width: AppWidth.w8),
                      BodyTitle(
                        text: DateFormat(
                          'dd/MM/yyyy',
                        ).format(stage.date!.toLocal()),
                        textAlign: TextAlign.right,
                        color: AppColors.secondaryNormal,
                        fontSize: AppFontSize.s12,
                        fontWeight: AppFontWeight.regular,
                        height: 1.35,
                      ),
                    ],
                  ],
                ),
                SizedBox(height: AppHeight.h4),
                BodyTitle(
                  text: stage.description ?? '',
                  color: AppColors.greyText,
                  fontSize: AppFontSize.s12,
                  fontWeight: AppFontWeight.regular,
                  height: 1.65,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  bool get _isCurrent => stage.state?.toLowerCase() == 'current';

  bool get _isCompleted {
    final state = stage.state?.toLowerCase();
    return state == 'completed' || state == 'current';
  }
}
