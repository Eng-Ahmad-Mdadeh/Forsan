import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/bank_transfer/bank_transfer_cubit.dart';
import 'package:forsan/presentation/cubit/bank_transfer/bank_transfer_state.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';
import 'package:intl/intl.dart';

class BankTransferForm extends StatefulWidget {
  const BankTransferForm({super.key});

  @override
  State<BankTransferForm> createState() => _BankTransferFormState();
}

class _BankTransferFormState extends State<BankTransferForm> {
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
    );

    if (date == null || !mounted) return;
    _dateController.text = DateFormat('yyyy/MM/dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = AppRadius.r16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          title: context.loc.bank_transfer_amount,
          hintText: context.loc.bank_transfer_amount_hint,
          controller: _amountController,
          textInputType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
          height: AppHeight.h55,
          borderRadius: borderRadius,
          fontSize: AppFontSize.s16,
          backgroundColor: AppColors.white,
        ),
        SizedBox(height: AppHeight.h16),
        CustomInputField(
          title: context.loc.bank_transfer_date,
          hintText: context.loc.bank_transfer_date_hint,
          controller: _dateController,
          readOnly: true,
          onTap: _selectDate,
          height: AppHeight.h55,
          borderRadius: borderRadius,
          fontSize: AppFontSize.s16,
          backgroundColor: AppColors.white,
          suffix: Icon(
            Icons.calendar_today_outlined,
            color: AppColors.mainText,
            size: AppSize.s24,
          ),
        ),
        BlocBuilder<BankTransferCubit, BankTransferState>(
          buildWhen: (previous, current) =>
              previous.receiptImage != current.receiptImage,
          builder: (context, state) => DocumentSection(
            title: context.loc.bank_transfer_attachments,
            image: state.receiptImage,
            onTap: () => context.read<BankTransferCubit>().pickReceipt(context),
            onRemove: state.receiptImage == null
                ? null
                : context.read<BankTransferCubit>().removeReceipt,
            isExpanded: true,
            paddingTop: AppPaddingHeight.p16,
            uploadLabel: context.loc.bank_transfer_upload_receipt,
            uploadHint: context.loc.bank_transfer_upload_receipt_hint,
          ),
        ),
      ],
    );
  }
}
