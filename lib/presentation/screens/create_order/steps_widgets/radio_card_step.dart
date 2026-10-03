import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_info_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_option_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/order_section_header.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

class RadioCardStep extends StatelessWidget {
  const RadioCardStep({
    super.key,
    required this.formKey,
    required this.step,
    required this.selectedValues,
    required this.onFieldChanged,
  });

  final GlobalKey<FormState> formKey;
  final StepModel step;
  final Map<String, dynamic> selectedValues;
  final void Function(String fieldId, dynamic value) onFieldChanged;

  @override
  Widget build(BuildContext context) {
    final sections = step.sections ?? const <Section>[];

    return Form(
      key: formKey,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          AppPaddingWidth.p16,
          AppPaddingHeight.p8,
          AppPaddingWidth.p16,
          AppPaddingHeight.p50,
        ),
        itemCount: sections.length,
        separatorBuilder: (_, _) => SizedBox(height: AppHeight.h24),
        itemBuilder: (context, index) => _buildSection(
          context,
          sections[index],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, Section section) {
    final fields = section.fields ?? const <SectionField>[];
    final radioCardFields = fields
        .where((field) => field.type == 'radio-card')
        .toList(growable: false);
    final infoFields = fields
        .where((field) => field.type == 'info')
        .toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OrderSectionHeader(
          icon: Icons.business_center_outlined,
          title: section.title?.trim() ?? '',
          description: section.description?.trim() ?? '',
        ),
        for (final field in radioCardFields) ...[
          _buildRadioCardField(context, field),
          SizedBox(height: AppHeight.h8),
        ],
        for (final field in infoFields) ...[
          SizedBox(height: AppHeight.h8),
          OrderInfoCard(
            text: field.label?.trim() ?? '',
            backgroundColor: AppColors.goldBackGround,
            textColor: AppColors.mainText,
            iconColor: AppColors.mainText,
          ),
        ],
      ],
    );
  }

  Widget _buildRadioCardField(BuildContext context, SectionField field) {
    final fieldId = field.id?.trim();
    final options = (field.options ?? const <FluffyOption>[])
        .where((option) => option.value?.trim().isNotEmpty == true)
        .toList(growable: false);
    final selectedValue = fieldId == null
        ? null
        : selectedValues[fieldId]?.toString();

    return FormField<String>(
      key: ValueKey('${field.id}:$selectedValue'),
      initialValue: selectedValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          field.required == true && (value == null || value.trim().isEmpty)
          ? context.loc.complete_profile_required_field
          : null,
      builder: (formField) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (field.label?.trim().isNotEmpty == true) ...[
            BodyTitle(
              text:
                  '${field.label!.trim()}${field.required == true ? ' *' : ''}',
              color: AppColors.mainText,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.medium,
            ),
            SizedBox(height: AppHeight.h6),
          ],
          for (var index = 0; index < options.length; index++) ...[
            OrderOptionCard(
              title: options[index].label?.trim() ?? '',
              description: options[index].description?.trim() ?? '',
              icon: _packageIcon(options[index].value, index),
              selected: selectedValue == options[index].value,
              height: AppHeight.h140,
              descriptionMaxLines: 6,
              onTap: () {
                final value = options[index].value!;
                formField.didChange(value);
                if (fieldId != null && fieldId.isNotEmpty) {
                  onFieldChanged(fieldId, value);
                }
              },
            ),
            if (index < options.length - 1) SizedBox(height: AppHeight.h8),
          ],
          if (formField.hasError) ...[
            SizedBox(height: AppHeight.h6),
            BodyTitle(
              text: formField.errorText!,
              color: AppColors.red,
              fontSize: AppFontSize.s12,
            ),
          ],
        ],
      ),
    );
  }

  IconData _packageIcon(String? value, int index) {
    switch (value) {
      case 'basic_management':
        return Icons.business_outlined;
      case 'integrated_management':
        return Icons.account_tree_outlined;
      case 'custom_management':
        return Icons.tune_outlined;
      case 'on_demand_service':
        return Icons.flash_on_outlined;
      default:
        const icons = <IconData>[
          Icons.business_outlined,
          Icons.account_tree_outlined,
          Icons.tune_outlined,
          Icons.flash_on_outlined,
        ];
        return icons[index % icons.length];
    }
  }
}
