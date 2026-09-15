import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/document/document_section.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';

class WesternUnionForm extends StatelessWidget {
  const WesternUnionForm({
    super.key,
    this.transferNumberController,
    this.receiptImage,
    this.onReceiptTap,
    this.onRemoveReceipt,
  });

  final TextEditingController? transferNumberController;
  final String? receiptImage;
  final VoidCallback? onReceiptTap;
  final VoidCallback? onRemoveReceipt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          key: const Key('western-union-transfer-number'),
          title: context.loc.western_union_transfer_number,
          hintText: context.loc.western_union_transfer_number_hint,
          controller: transferNumberController,
          textInputType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          height: AppHeight.h52,
          borderRadius: AppRadius.r8,
          fontSize: AppFontSize.s16,
          fontWeight: AppFontWeight.bold,
          backgroundColor: AppColors.white,
        ),
        DocumentSection(
          title: context.loc.bank_transfer_attachments,
          image: receiptImage,
          onTap: onReceiptTap ?? () {},
          onRemove: onRemoveReceipt,
          height: AppHeight.h170,
          paddingTop: AppPaddingHeight.p8,
          isExpanded: true,
          uploadLabel: context.loc.bank_transfer_upload_receipt,
          uploadHint: context.loc.western_union_upload_receipt_hint,
        ),
      ],
    );
  }
}
