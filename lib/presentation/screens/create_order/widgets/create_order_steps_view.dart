import 'package:flutter/material.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/activity_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/applicant_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/document_requirement_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/establishment_type_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/ownership_structure_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/proposed_company_info_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/radio_card_step.dart';
import 'package:forsan/presentation/screens/create_order/steps_widgets/review_step.dart';

/// Builds the pages used by the create-order flow.
///
/// Keeping step composition here allows the screen to focus on orchestration,
/// while each concrete step remains responsible for its own presentation.
class CreateOrderStepsView extends StatelessWidget {
  const CreateOrderStepsView({
    super.key,
    required this.controller,
    required this.formKeys,
    required this.steps,
    required this.selectedValues,
    required this.agreements,
    required this.onFieldChanged,
    required this.onPageChanged,
    required this.onEditStep,
  });

  final PageController controller;
  final List<GlobalKey<FormState>> formKeys;
  final List<StepModel> steps;
  final Map<String, dynamic> selectedValues;
  final List<AgreementModel> agreements;
  final void Function(String fieldId, dynamic value) onFieldChanged;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onEditStep;

  @override
  Widget build(BuildContext context) {
    return PageView(
      key: const Key('new_order_page_view'),
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: onPageChanged,
      children: [
        EstablishmentTypeStep(
          formKey: formKeys[0],
          step: steps[0],
          selectedValues: selectedValues,
          onFieldChanged: onFieldChanged,
        ),
        ApplicantStep(
          formKey: formKeys[1],
          step: steps[1],
          selectedValues: selectedValues,
          onFieldChanged: onFieldChanged,
        ),
        ProposedCompanyInfoStep(
          formKey: formKeys[2],
          step: steps[2],
          selectedValues: selectedValues,
          onFieldChanged: onFieldChanged,
        ),
        OwnershipStructureStep(
          formKey: formKeys[3],
          step: steps[3],
          selectedValues: selectedValues,
          onFieldChanged: onFieldChanged,
        ),
        ActivityStep(
          formKey: formKeys[4],
          step: steps[4],
          selectedValues: selectedValues,
          onFieldChanged: onFieldChanged,
        ),
        _buildRequirementsStep(),
        ReviewStep(
          step: steps[6],
          formSteps: steps.take(6).toList(growable: false),
          agreement: agreements,
          onEditStep: onEditStep,
        ),
      ],
    );
  }

  Widget _buildRequirementsStep() {
    final step = steps[5];
    final fields = (step.sections ?? const <Section>[])
        .expand((section) => section.fields ?? const <SectionField>[]);
    final hasRadioCard = fields.any((field) => field.type == 'radio-card');

    if (hasRadioCard) {
      return RadioCardStep(
        formKey: formKeys[5],
        step: step,
        selectedValues: selectedValues,
        onFieldChanged: onFieldChanged,
      );
    }

    return DocumentRequirementStep(formKey: formKeys[5], step: step);
  }
}
