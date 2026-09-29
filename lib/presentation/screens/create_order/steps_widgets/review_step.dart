import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/widgets/custom_check_box.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
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
        _ReviewIntroduction(title: title, description: description),
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
        _ReviewConfirmationCard(
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

  List<({String label, String value})> _reviewFields(
    Section section,
    Map<String, dynamic> formValues,
  ) {
    final result = <({String label, String value})>[];

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

class _ReviewIntroduction extends StatelessWidget {
  const _ReviewIntroduction({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title.isNotEmpty) ...[
          Row(
            children: [
              Icon(
                Icons.fact_check_outlined,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: title,
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          if (description.isNotEmpty) SizedBox(height: AppHeight.h8),
        ],
        if (description.isNotEmpty)
          BodyTitle(
            text: description,
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 3,
          ),
      ],
    );
  }
}

class _ReviewConfirmationCard extends StatelessWidget {
  const _ReviewConfirmationCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p8,
        vertical: AppPaddingHeight.p10,
      ),
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.circular(AppRadius.r8),
        boxShadow: [
          BoxShadow(
            color: AppColors.light.withOpacity(0.9),
            blurRadius: AppRadius.r7,
            offset: Offset(0, AppHeight.h2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomCheckBox(),
          SizedBox(width: AppWidth.w4),
          Expanded(
            child: BodyTitle(
              text: text,
              textAlign: TextAlign.start,
              color: AppColors.primaryDark,
              fontSize: AppFontSize.s14,
              fontWeight: AppFontWeight.regular,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}

/// A reusable card matching the order-review design.
class ReviewSectionCard extends StatelessWidget {
  const ReviewSectionCard({
    super.key,
    required this.title,
    required this.fields,
    required this.icon,
    this.onEdit,
  });

  final String title;
  final List<({String label, String value})> fields;
  final IconData icon;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p16,
      ),
      borderRadius: BorderRadius.circular(AppRadius.r12),
      showShadow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ReviewCardHeader(title: title, icon: icon, onEdit: onEdit),
          SizedBox(height: AppHeight.h16),
          for (var index = 0; index < fields.length; index++) ...[
            _ReviewFieldRow(field: fields[index]),
            if (index < fields.length - 1) ...[
              SizedBox(height: AppHeight.h12),
              const Divider(color: AppColors.goldBackGround, height: 1),
              SizedBox(height: AppHeight.h12),
            ],
          ],
        ],
      ),
    );
  }
}

class _ReviewCardHeader extends StatelessWidget {
  const _ReviewCardHeader({
    required this.title,
    required this.icon,
    this.onEdit,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppWidth.w30,
          height: AppHeight.h30,
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(AppRadius.r8),
          ),
          child: Icon(icon, color: AppColors.secondary, size: AppSize.s22),
        ),
        SizedBox(width: AppWidth.w4),
        Expanded(
          child: SectionTitle(
            text: title,
            color: AppColors.mainText,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.bold,
            maxLines: 1,
          ),
        ),
        if (onEdit != null)
          Semantics(
            button: true,
            // label: MaterialLocalizations.of(context).editButtonLabel,
            child: InkResponse(
              key: ValueKey('review_section_edit_$title'),
              onTap: onEdit,
              radius: AppRadius.r20,
              child: SizedBox(
                width: AppWidth.w30,
                height: AppHeight.h30,
                child: Icon(
                  Iconsax.edit_2_outline,
                  color: AppColors.primary,
                  size: AppSize.s18,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ReviewFieldRow extends StatelessWidget {
  const _ReviewFieldRow({required this.field});

  final ({String label, String value}) field;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BodyTitle(
            text: field.label,
            color: AppColors.blackCow,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
            maxLines: 3,
          ),
        ),
        SizedBox(width: AppWidth.w16),
        Flexible(
          child: BodyTitle(
            text: field.value,
            textAlign: TextAlign.end,
            color: AppColors.mainText,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.bold,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
