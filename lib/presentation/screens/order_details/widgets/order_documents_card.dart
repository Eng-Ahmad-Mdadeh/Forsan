import 'package:flutter/material.dart';

import '../../../../core/extension/localization_extension.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import 'order_document_item.dart';

class OrderDocumentsCard extends StatelessWidget {
  const OrderDocumentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final documents = [
      OrderDocumentItem(
        title: context.loc.order_document_passport,
        status: OrderDocumentStatus.approved,
      ),
      OrderDocumentItem(
        title: context.loc.order_document_commercial_record,
        status: OrderDocumentStatus.rejected,
      ),
      OrderDocumentItem(
        title: context.loc.order_document_identity,
        status: OrderDocumentStatus.approved,
      ),
      OrderDocumentItem(
        title: context.loc.order_document_company_address,
        status: OrderDocumentStatus.required,
      ),
    ];

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
            border: Border.all(color: AppColors.lightGrey),
            boxShadow: [
              BoxShadow(
                color: AppColors.homeSoftShadow,
                blurRadius: AppRadius.r7,
                offset: Offset(0, AppHeight.h2),
              ),
            ],
          ),
          child: Column(
            children: [
              _DocumentsHeader(title: context.loc.order_documents),
              SizedBox(height: AppHeight.h8),
              for (var index = 0; index < documents.length; index++) ...[
                _DocumentRow(document: documents[index]),
                if (index != documents.length - 1)
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
          color: AppColors.homeSupportAction,
        ),
      ),
      SizedBox(width: AppWidth.w8),
      Text(
        title,
        style: TextStyle(
          color: AppColors.mainText,
          fontSize: AppFontSize.s15,
          fontWeight: AppFontWeight.bold,
        ),
      ),
    ],
  );
}

class _DocumentRow extends StatelessWidget {
  const _DocumentRow({required this.document});

  final OrderDocumentItem document;

  @override
  Widget build(BuildContext context) => Container(
    height: AppHeight.h40,
    padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p8),
    decoration: BoxDecoration(
      color: AppColors.lightGreySec,
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
          child: Text(
            document.title,
            style: TextStyle(
              color: AppColors.blackCow,
              fontSize: AppFontSize.s13,
              fontWeight: AppFontWeight.regular,
            ),
          ),
        ),
        _DocumentStatusBadge(status: document.status),
      ],
    ),
  );
}

class _DocumentStatusBadge extends StatelessWidget {
  const _DocumentStatusBadge({required this.status});

  final OrderDocumentStatus status;

  String _label(BuildContext context) => switch (status) {
    OrderDocumentStatus.approved => context.loc.order_document_status_approved,
    OrderDocumentStatus.rejected => context.loc.order_document_status_rejected,
    OrderDocumentStatus.underReview =>
      context.loc.order_document_status_under_review,
    OrderDocumentStatus.required => context.loc.order_document_status_required,
    OrderDocumentStatus.notRequired =>
      context.loc.order_document_status_not_required,
  };

  @override
  Widget build(BuildContext context) => Container(
    constraints: BoxConstraints(minWidth: AppWidth.w90),
    height: AppHeight.h24,
    padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p10),
    decoration: BoxDecoration(
      color: status.backgroundColor,
      borderRadius: BorderRadius.circular(AppRadius.r20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _label(context),
          style: TextStyle(
            color: status.foregroundColor,
            fontSize: AppFontSize.s11,
            fontWeight: AppFontWeight.regular,
          ),
        ),
        SizedBox(width: AppWidth.w5),
        Container(
          width: AppWidth.w5,
          height: AppHeight.h5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: status.foregroundColor,
          ),
        ),
      ],
    ),
  );
}
