import 'package:flutter/material.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import 'order_stage_item.dart';
import 'order_stage_row.dart';
import 'order_stages_header.dart';

class OrderStagesCard extends StatelessWidget {
  const OrderStagesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final stages = [
      OrderStageItem(
        title: context.loc.order_stage_received_title,
        description: context.loc.order_stage_received_description,
        date: context.loc.order_stage_sample_date,
        isCompleted: true,
      ),
      OrderStageItem(
        title: context.loc.order_stage_review_title,
        description: context.loc.order_stage_review_description,
        date: context.loc.order_stage_sample_date,
        isCompleted: true,
      ),
      OrderStageItem(
        title: context.loc.order_stage_documents_title,
        description: context.loc.order_stage_documents_description,
      ),
      OrderStageItem(
        title: context.loc.order_stage_quote_title,
        description: context.loc.order_stage_quote_description,
      ),
      OrderStageItem(
        title: context.loc.order_stage_payment_title,
        description: context.loc.order_stage_payment_description,
      ),
      OrderStageItem(
        title: context.loc.order_stage_execution_title,
        description: context.loc.order_stage_execution_description,
      ),
      OrderStageItem(
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
                OrderStagesHeader(title: context.loc.order_stages),
                SizedBox(height: AppHeight.h14),
                for (var index = 0; index < stages.length; index++)
                  OrderStageRow(
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
