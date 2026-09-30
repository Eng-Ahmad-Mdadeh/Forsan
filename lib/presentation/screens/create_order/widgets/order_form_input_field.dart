import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/presentation/widgets/form/custom_input_field.dart';

/// Standard text input styling shared by create-order forms.
class OrderFormInputField extends StatelessWidget {
  const OrderFormInputField({
    super.key,
    this.type,
    this.label,
    this.hint,
    this.value,
    this.isRequired = false,
    this.maxLength,
    this.keyboardType,
    this.onChanged,
  });

  final String? type;
  final String? label;
  final String? hint;
  final dynamic value;
  final bool isRequired;
  final int? maxLength;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final isTextArea = type == 'textarea';

    return CustomInputField(
      title: label?.trim(),
      hintText: hint?.trim() ?? '',
      initialValue: value?.toString(),
      req: isRequired,
      fontSize: AppFontSize.s16,
      textInputType: keyboardType ??
          (type == 'number' ? TextInputType.number : TextInputType.text),
      backgroundColor: AppColors.white,
      reserveValidationSpace: false,
      maxLines: isTextArea ? 4 : 1,
      maxLength: maxLength,
      isExpanded: isTextArea,
      validator: isRequired
          ? (value) => value == null || value.trim().isEmpty
                ? context.loc.complete_profile_required_field
                : null
          : null,
      onChanged: onChanged,
    );
  }
}
