import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/sham_cash/sham_cash_cubit.dart';
import 'package:forsan/presentation/cubit/sham_cash/sham_cash_state.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';

class ShamCashForm extends StatefulWidget {
  const ShamCashForm({super.key});

  @override
  State<ShamCashForm> createState() => _ShamCashFormState();
}

class _ShamCashFormState extends State<ShamCashForm> {
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          key: const Key('sham-cash-transfer-amount'),
          title: context.loc.bank_transfer_amount,
          hintText: context.loc.bank_transfer_amount_hint,
          controller: _amountController,
          textInputType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
          ],
          height: AppHeight.h50,
          borderRadius: AppRadius.r8,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.bold,
          backgroundColor: AppColors.white,
        ),
        BlocBuilder<ShamCashCubit, ShamCashState>(
          buildWhen: (previous, current) =>
              previous.receiptImage != current.receiptImage,
          builder: (context, state) => DocumentSection(
            title: context.loc.bank_transfer_attachments,
            image: state.receiptImage,
            onTap: () => context.read<ShamCashCubit>().pickReceipt(context),
            onRemove: state.receiptImage == null
                ? null
                : context.read<ShamCashCubit>().removeReceipt,
            height: AppHeight.h170,
            paddingTop: AppPaddingHeight.p8,
            isExpanded: true,
            uploadLabel: context.loc.bank_transfer_upload_receipt,
            uploadHint: context.loc.sham_cash_upload_receipt_hint,
          ),
        ),
      ],
    );
  }
}
