import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../cubit/invoices_and_payments/invoices_and_payments_cubit.dart';
import '../../widgets/status_badge.dart';
import 'models/invoice_item.dart';
import 'widgets/invoices_list.dart';
import 'widgets/invoices_and_payments_tabs.dart';

class InvoicesAndPaymentsScreen extends StatelessWidget {
  const InvoicesAndPaymentsScreen({super.key});

  static const _invoices = [
    InvoiceItem(
      number: 'TX-88921',
      title: 'تأسيس شركة لشخص واحد',
      invoiceDate: '15/05/2026',
      total: '126,500.00',
      status: StatusBadge.paid,
    ),
    InvoiceItem(
      number: 'TX-88921',
      title: 'تأسيس شركة لشخص واحد',
      invoiceDate: '15/05/2026',
      total: '126,500.00',
      status: StatusBadge.pendingPayment,
    ),
  ];

  List<InvoiceItem> _visibleInvoices(int selectedTab) => _invoices
      .where(
        (invoice) => switch (selectedTab) {
          1 => invoice.status == StatusBadge.paid,
          2 => invoice.status == StatusBadge.pendingPayment,
          _ => true,
        },
      )
      .toList();

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => InvoicesAndPaymentsCubit(),
    child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'الفواتير والمدفوعات',
        backgroundColor: AppColors.white,
        toolbarHeight: AppHeight.h70,
        showScrolledUnderElevation: false,
        showBackButton: true,
        titleSpacing: AppPaddingWidth.p16,
        titleWidget: SectionTitle(
          text: 'الفواتير والمدفوعات',
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                AppPaddingWidth.p13,
                AppPaddingHeight.p5,
                AppPaddingWidth.p13,
                0,
              ),
              child: const InvoicesAndPaymentsTabs(),
            ),
            Expanded(
              child: BlocBuilder<InvoicesAndPaymentsCubit, int>(
                builder: (context, selectedTab) => InvoicesList(
                  invoices: _visibleInvoices(selectedTab),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
