import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';
import 'package:forsan/presentation/widgets/custom_check_box.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

/// Builds the complete new-order summary while keeping the individual card
/// definitions out of the screen that hosts the order flow.
///
/// The form steps currently expose only the establishment selections as shared
/// state. The remaining values below mirror the pre-filled form shown in the
/// design and can be replaced with state values here once those steps are wired
/// to the shared order state.
class ReviewStep extends StatelessWidget {
  const ReviewStep({
    super.key,
    required this.onEditStep,
  });

  final ValueChanged<int> onEditStep;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewOrderCubit>().state;
    final cards = <Widget>[
      ReviewSectionCard(
        title: context.loc.new_order_step_establishment,
        icon: Icons.grid_view_rounded,
        onEdit: () => onEditStep(0),
        fields: [
          (
            label: context.loc.new_order_establishment_title,
            value: _establishmentTypeLabel(context, state.establishmentType),
          ),
          (
            label: context.loc.new_order_applicant_role_title,
            value: _applicantTypeLabel(context, state.applicantType),
          ),
        ],
      ),
      ReviewSectionCard(
        title: context.loc.new_order_contact_identity_title,
        icon: Iconsax.personalcard_outline,
        onEdit: () => onEditStep(1),
        fields: [
          (label: context.loc.new_order_full_name, value: 'أحمد عمر الخطيب'),
          (label: context.loc.new_order_father_name, value: 'محمد'),
          (label: context.loc.new_order_nationality, value: 'سوري'),
          (label: context.loc.new_order_national_id, value: '0516419515'),
          (
            label: context.loc.new_order_passport_number_optional,
            value: '651591',
          ),
          (label: context.loc.new_order_mobile_number, value: '+963953302487'),
          (
            label: context.loc.new_order_whatsapp_number,
            value: '+963953302487',
          ),
          (label: context.loc.new_order_email, value: 'ahmad@forsan.co'),
        ],
      ),
      ReviewSectionCard(
        title: context.loc.new_order_ownership_structure_title,
        icon: Icons.key_outlined,
        onEdit: () => onEditStep(3),
        fields: [
          (label: context.loc.new_order_partner_count, value: '02'),
          (
            label: context.loc.new_order_expected_capital,
            value: '140,000,000 ل.س',
          ),
        ],
      ),
      ReviewSectionCard(
        title: '${context.loc.new_order_step_partners} / '
            '${context.loc.new_order_primary_partner}',
        icon: Icons.people_outline_rounded,
        onEdit: () => onEditStep(3),
        fields: [
          (label: context.loc.new_order_full_name, value: 'محمد الخطيب'),
          (label: context.loc.new_order_nationality, value: 'سوري'),
          (label: context.loc.new_order_ownership_percentage, value: '10%'),
          (
            label: context.loc.new_order_contribution_type,
            value: context.loc.new_order_cash_contribution,
          ),
          (label: context.loc.new_order_full_name, value: 'يوسف الخطيب'),
          (label: context.loc.new_order_nationality, value: 'سوري'),
          (label: context.loc.new_order_ownership_percentage, value: '90%'),
          (
            label: context.loc.new_order_contribution_type,
            value: context.loc.new_order_cash_contribution,
          ),
        ],
      ),
      ReviewSectionCard(
        title: context.loc.new_order_activity_title,
        icon: Iconsax.activity_outline,
        onEdit: () => onEditStep(4),
        fields: [
          (
            label: context.loc.new_order_main_activity,
            value: 'تجارة الإلكترونيات',
          ),
          (
            label: context.loc.new_order_requires_special_license,
            value: context.loc.new_order_yes,
          ),
        ],
      ),
      _ReviewConfirmationCard(
        key: const Key('review_information_confirmation'),
        text: context.loc.new_order_information_confirmation,
      ),
      _ReviewConfirmationCard(
        key: const Key('review_terms_confirmation'),
        text: context.loc.new_order_terms_confirmation,
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

  String _establishmentTypeLabel(BuildContext context, String value) {
    return switch (value) {
      'one_person' => context.loc.new_order_one_person_company,
      'limited_liability' => context.loc.new_order_limited_liability_company,
      'foreign_partner' => context.loc.new_order_foreign_partner_company,
      'individual' => context.loc.new_order_individual_establishment,
      'joint_stock' => context.loc.new_order_joint_stock_company,
      _ => context.loc.new_order_select_hint,
    };
  }

  String _applicantTypeLabel(BuildContext context, String value) {
    return switch (value) {
      'syrian_citizen' => context.loc.new_order_syrian_citizen,
      'expatriate' => context.loc.new_order_expatriate,
      'foreign_investor' => context.loc.new_order_foreign_investor,
      'company_representative' => context.loc.new_order_company_representative,
      _ => context.loc.new_order_select_hint,
    };
  }
}

class _ReviewConfirmationCard extends StatelessWidget {
  const _ReviewConfirmationCard({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p16,
      ),
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.circular(AppRadius.r10),
        boxShadow: [
          BoxShadow(
            color: AppColors.homeSoftShadow.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomCheckBox(),
          SizedBox(width: AppWidth.w12),
          Expanded(
            child: BodyTitle(
              text: text,
              textAlign: TextAlign.center,
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
      showShadow: false,
      showBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ReviewCardHeader(
            title: title,
            icon: icon,
            onEdit: onEdit,
          ),
          SizedBox(height: AppHeight.h16),
          for (var index = 0; index < fields.length; index++) ...[
            _ReviewFieldRow(field: fields[index]),
            if (index < fields.length - 1) ...[
              SizedBox(height: AppHeight.h12),
              const Divider(color: AppColors.greyDivider, height: 1),
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
          child: Icon(
            icon,
            color: AppColors.secondary,
            size: AppSize.s22,
          ),
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
            label: MaterialLocalizations.of(context).editButtonLabel,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
