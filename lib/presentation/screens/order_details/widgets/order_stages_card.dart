import 'package:flutter/material.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';

class OrderStagesCard extends StatelessWidget {
  const OrderStagesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final stages = [
      _OrderStageItem(
        title: context.loc.order_stage_received_title,
        description: context.loc.order_stage_received_description,
        date: context.loc.order_stage_sample_date,
        isCompleted: true,
      ),
      _OrderStageItem(
        title: context.loc.order_stage_review_title,
        description: context.loc.order_stage_review_description,
        date: context.loc.order_stage_sample_date,
        isCompleted: true,
        isCurrent: true,
      ),
      _OrderStageItem(
        title: context.loc.order_stage_documents_title,
        description: context.loc.order_stage_documents_description,
      ),
      _OrderStageItem(
        title: context.loc.order_stage_quote_title,
        description: context.loc.order_stage_quote_description,
      ),
      _OrderStageItem(
        title: context.loc.order_stage_payment_title,
        description: context.loc.order_stage_payment_description,
      ),
      _OrderStageItem(
        title: context.loc.order_stage_execution_title,
        description: context.loc.order_stage_execution_description,
      ),
      _OrderStageItem(
        title: context.loc.order_stage_completion_title,
        description: context.loc.order_stage_completion_description,
      ),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Semantics(
        container: true,
        label: context.loc.order_stages,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.r17),
            boxShadow: [
              BoxShadow(
                color: AppColors.homeSoftShadow,
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

class _OrderStageItem {
  const _OrderStageItem({
    required this.title,
    required this.description,
    this.date,
    this.isCompleted = false,
    this.isCurrent = false,
  });

  final String title;
  final String description;
  final String? date;
  final bool isCompleted;
  final bool isCurrent;
}

class _OrderStagesHeader extends StatelessWidget {
  const _OrderStagesHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.mainText,
            fontSize: AppFontSize.s16,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ),
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
          size: AppWidth.w22,
          color: AppColors.secondaryText,
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

  final _OrderStageItem stage;
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
                  color: stage.isCurrent ? AppColors.light : AppColors.none,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: AppWidth.w10,
                  height: AppHeight.h10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: stage.isCompleted
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
                      child: Text(
                        stage.title,
                        style: TextStyle(
                          color: AppColors.mainText,
                          fontSize: AppFontSize.s13,
                          fontWeight: AppFontWeight.bold,
                          height: 1.35,
                        ),
                      ),
                    ),
                    if (stage.date != null) ...[
                      SizedBox(width: AppWidth.w8),
                      Text(
                        stage.date!,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: AppColors.secondaryNormal,
                          fontSize: AppFontSize.s11,
                          fontWeight: AppFontWeight.regular,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: AppHeight.h4),
                Text(
                  stage.description,
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontSize: AppFontSize.s12,
                    fontWeight: AppFontWeight.regular,
                    height: 1.65,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
