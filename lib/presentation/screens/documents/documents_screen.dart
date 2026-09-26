import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_fonts.dart';
import '../../../core/resources/app_values.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/status_badge.dart';
import '../../widgets/text/section_title.dart';
import '../document_details/document_details_screen.dart';
import 'widgets/document_order_card.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  static final _document = Item(
    id: '1',
    reference: 'FR-2026-00125925',
    serviceName: 'تأسيس شركة لشخص واحد',
    categoryName: null,
    status: null,
    displayStatus: null,
    statusLabel: StatusBadge.waitingDocuments,
    progress: null,
    createdAt: DateTime(2026, 5, 20),
    consultant: 'أحمد إبراهيم',
  );

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
        fontSize: AppFontSize.s18,
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
        itemCount: 1,
        separatorBuilder: (_, _) => SizedBox(height: AppHeight.h12),
        itemBuilder: (context, index) => DocumentOrderCard(
          item: _document,
          onDetailsPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const DocumentDetailsScreen(
                state: DocumentDetailsState.waitingDocuments,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
