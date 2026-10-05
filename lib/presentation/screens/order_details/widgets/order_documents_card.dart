import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/status_badge.dart';
import '../../../widgets/text/body_title.dart';
import '../../../widgets/text/section_title.dart';
import 'order_document_item.dart';

class OrderDocumentsCard extends StatelessWidget {

  final List<Upload>? model;

  const OrderDocumentsCard({super.key, this.model});

  @override
  Widget build(BuildContext context) {

    final uploads = model ?? [];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Semantics(
        container: true,
        label: context.loc.order_documents,
        child: Container(
          padding: EdgeInsets.all(AppPaddingWidth.p8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(color: AppColors.greyDivider.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: AppColors.homeSoftShadow.withOpacity(0.03),
                blurRadius: AppRadius.r7,
                offset: Offset(0, AppHeight.h2),
              ),
            ],
          ),
          child: Column(
            children: [
              _DocumentsHeader(title: context.loc.order_documents),
              SizedBox(height: AppHeight.h8),
              for (var index = 0; index < uploads.length; index++) ...[
                _DocumentRow(document: uploads[index]),
                if (index != uploads.length - 1)
                  SizedBox(height: AppHeight.h6),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DocumentsHeader extends StatelessWidget {
  const _DocumentsHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: AppWidth.w33,
        height: AppHeight.h32,
        decoration: BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.description_outlined,
          size: AppSize.s20,
          color: AppColors.primaryDark,
        ),
      ),
      SizedBox(width: AppWidth.w8),
      SectionTitle(
        text: title,
        color: AppColors.secondaryText,
        fontSize: AppFontSize.s15,
        fontWeight: AppFontWeight.bold,
      ),
    ],
  );
}

class _DocumentRow extends StatelessWidget {
  const _DocumentRow({ this.document});

  final Upload? document;

  @override
  Widget build(BuildContext context) => Container(
    height: AppHeight.h40,
    padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p8),
    decoration: BoxDecoration(
      color: AppColors.backGround,
      borderRadius: BorderRadius.circular(AppRadius.r8),
    ),
    child: Row(
      children: [
        Icon(
          Icons.description_outlined,
          size: AppSize.s16,
          color: AppColors.secondaryText,
        ),
        SizedBox(width: AppWidth.w6),
        Expanded(
          child: BodyTitle(
            text: document?.name??'',
            color: AppColors.blackCow,
            fontSize: AppFontSize.s13,
            fontWeight: AppFontWeight.regular,
          ),
        ),
        // StatusBadge(
        //   status: document?.statusLabel??'',
        //   fontSize: AppSize.s14,
        //   fontWeight: AppFontWeight.regular,
        // ),
        StatusBadge.custom(
          label: document?.statusLabel??'',
          fontSize: AppSize.s14,
          fontWeight: AppFontWeight.regular,
          color: document.status.foregroundColor,
          backgroundColor: document.status.backgroundColor,
        ),
      ],
    ),
  );
}
