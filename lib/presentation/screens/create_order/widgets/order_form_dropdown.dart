import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/custom_drop_down_widget.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class OrderDropdownOption<T> {
  const OrderDropdownOption({required this.label, required this.value});

  final String label;
  final T value;
}

/// Shared labelled dropdown used by the create-order steps.
class OrderFormDropdown<T> extends StatelessWidget {
  const OrderFormDropdown({
    super.key,
    required this.options,
    required this.onChanged,
    this.label,
    this.hint,
    this.value,
  });

  final String? label;
  final String? hint;
  final List<OrderDropdownOption<T>> options;
  final T? value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final visibleOptions = options
        .where((option) => option.label.trim().isNotEmpty)
        .toList(growable: false);
    final selected = visibleOptions.where((option) => option.value == value);
    final trimmedLabel = label?.trim() ?? '';
    final trimmedHint = hint?.trim() ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (trimmedLabel.isNotEmpty) ...[
          BodyTitle(
            text: trimmedLabel,
            textAlign: TextAlign.start,
            color: AppColors.mainText,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.medium,
          ),
          SizedBox(height: AppHeight.h4),
        ],
        CustomDropDownWidget(
          items: visibleOptions.map((option) => option.label).toList(),
          isStringList: true,
          initialItem: selected.isEmpty ? null : selected.first.label,
          hintText: trimmedHint.isEmpty
              ? context.loc.new_order_select_hint
              : trimmedHint,
          color: AppColors.white,
          height: AppHeight.h50,
          borderRadius: AppRadius.r7,
          closedBorder: const Border.fromBorderSide(
            BorderSide(color: AppColors.greyDivider, width: .7),
          ),
          onChanged: (selectedLabel) {
            final match = visibleOptions.where(
              (option) => option.label == selectedLabel,
            );
            if (match.isNotEmpty) onChanged(match.first.value);
          },
        ),
      ],
    );
  }
}
