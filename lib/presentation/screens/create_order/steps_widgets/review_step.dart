import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/screens/create_order/widgets/review_confirmation_card.dart';
import 'package:forsan/presentation/screens/create_order/widgets/review_field_row.dart';
import 'package:forsan/presentation/screens/create_order/widgets/review_introduction.dart';
import 'package:forsan/presentation/screens/create_order/widgets/review_section_card.dart';
import 'package:icons_plus/icons_plus.dart';

class ReviewStep extends StatelessWidget {
  const ReviewStep({
    super.key,
    required this.onEditStep,
    required this.step,
    required this.formSteps,
    required this.agreement,
  });

  final ValueChanged<int> onEditStep;
  final StepModel step;
  final List<StepModel> formSteps;
  final List<AgreementModel> agreement;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewOrderCubit>().state;
    final formValues = state.orderEntity.formValues;
    final sections = step.sections ?? const <Section>[];
    final reviewSection = sections.isEmpty ? null : sections.first;
    final sectionTitle = reviewSection?.title?.trim() ?? '';
    final title = sectionTitle.isNotEmpty
        ? sectionTitle
        : step.title?.trim() ?? '';
      final informationLabel = reviewSection?.fields
          ?.where((field) => field.type == 'info')
          .map((field) => field.label?.trim() ?? '')
          .firstWhere((label) => label.isNotEmpty, orElse: () => '') ?? '';
    final description = informationLabel.isNotEmpty
        ? informationLabel
        : reviewSection?.description?.trim() ?? '';
    final cards = <Widget>[
      if (title.isNotEmpty || description.isNotEmpty)
        ReviewIntroduction(title: title, description: description),
      for (var stepIndex = 0; stepIndex < formSteps.length; stepIndex++)
        for (final section in formSteps[stepIndex].sections ?? const <Section>[])
          if (_reviewFields(section, formValues).isNotEmpty)
            ReviewSectionCard(
              title: _sectionTitle(formSteps[stepIndex], section),
              icon: _sectionIcon(stepIndex, section),
              onEdit: () => onEditStep(stepIndex),
              fields: _reviewFields(section, formValues),
            ),
      for (var index = 0; index < agreement.length; index++)
        ReviewConfirmationCard(
          key: ValueKey(
            'review_agreement_${agreement[index].id ?? index.toString()}',
          ),
          text: agreement[index].label ?? '',
        ),
    ];

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        AppPaddingWidth.p16,
        AppPaddingHeight.p8,
        AppPaddingWidth.p16,
        AppPaddingHeight.p24,
      ),
      itemCount: cards.length,
      separatorBuilder: (_, __) => SizedBox(height: AppHeight.h14),
      itemBuilder: (_, index) => cards[index],
    );
  }

  List<ReviewField> _reviewFields(
    Section section,
    Map<String, dynamic> formValues,
  ) {
    final result = <ReviewField>[];

    for (final field in section.fields ?? const <SectionField>[]) {
      final fieldId = field.id;
      if (fieldId == null || field.type == 'info') continue;
      final value = formValues[fieldId];
      if (value == null || value is String && value.trim().isEmpty) continue;

      if (field.type == 'repeater' && value is List) {
        for (final entry in value.whereType<Map>()) {
          for (final repeatedField in field.fields ?? const <FieldField>[]) {
            final repeatedValue = entry[repeatedField.id];
            if (repeatedValue == null ||
                repeatedValue is String && repeatedValue.trim().isEmpty) {
              continue;
            }
            result.add((
              label: repeatedField.label?.trim() ?? '',
              value: _optionLabel(
                repeatedValue,
                repeatedField.options
                        ?.map((option) => (option.value, option.label)) ??
                    const [],
              ),
            ));
          }
        }
        continue;
      }

      result.add((
        label: field.label?.trim() ?? '',
        value: _optionLabel(
          value,
          field.options?.map((option) => (option.value, option.label)) ??
              const [],
        ),
      ));
    }
    return result;
  }

  String _optionLabel(
    dynamic value,
    Iterable<(String?, String?)> options,
  ) {
    for (final option in options) {
      if (option.$1 == value) return option.$2?.trim() ?? value.toString();
    }
    return value.toString();
  }

  String _sectionTitle(StepModel formStep, Section section) {
    final sectionTitle = section.title?.trim() ?? '';
    return sectionTitle.isNotEmpty ? sectionTitle : formStep.title?.trim() ?? '';
  }

  IconData _sectionIcon(int stepIndex, Section section) {
    if (section.id == 'partners-list') return Icons.people_outline_rounded;
    return switch (stepIndex) {
      0 => Icons.grid_view_rounded,
      1 => Iconsax.personalcard_outline,
      3 => Icons.key_outlined,
      4 => Iconsax.activity_outline,
      _ => Icons.fact_check_outlined,
    };
  }
}
