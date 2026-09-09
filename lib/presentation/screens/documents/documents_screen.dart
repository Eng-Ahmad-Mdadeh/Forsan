import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/text/section_title.dart';
import '../orders/models/order_item.dart';
import 'widgets/document_order_card.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  static const _documents = [
    OrderItem(
      title: 'تأسيس شركة لشخص واحد',
      number: 'FR-2026-00125925',
      date: '20/05/2026',
      consultant: 'أحمد إبراهيم',
      status: OrderStatus.waitingDocuments,
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: CustomAppBar(
      title: 'المستندات',
      backgroundColor: AppColors.white,
      toolbarHeight: AppHeight.h70,
      showScrolledUnderElevation: false,
      titleSpacing: AppPaddingWidth.p16,
      titleWidget: SectionTitle(
        text: 'المستندات',
        color: AppColors.mainText,
        fontSize: AppFontSize.s24,
        fontWeight: AppFontWeight.bold,
      ),
      customActions: [
        HeaderIconButton(
          icon: Iconsax.notification_outline,
          onTap: () {},
        ),
      ],
    ),
    body: SafeArea(
      child: ListView.separated(
        padding: EdgeInsetsDirectional.fromSTEB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p14,
          AppPaddingWidth.p16,
          AppPaddingHeight.p24,
        ),
        itemCount: _documents.length,
        separatorBuilder: (_, _) => SizedBox(height: AppHeight.h12),
        itemBuilder: (context, index) => DocumentOrderCard(
          document: _documents[index],
          onDetailsPressed: () {},
        ),
      ),
    ),
  );
}
