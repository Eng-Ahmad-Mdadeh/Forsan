import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

/// Displays the sections entered by the user before submitting an order.
///
/// The content is supplied through [sections], allowing the same review UI to
/// be used for every order type and for any number of cards.
class ReviewStep extends StatelessWidget {
  const ReviewStep({
    super.key,
    required this.sections,
    this.padding,
  });

  final List<ReviewSection> sections;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding ??
          EdgeInsets.fromLTRB(
            AppPaddingWidth.p10,
            AppPaddingHeight.p8,
            AppPaddingWidth.p10,
            AppPaddingHeight.p24,
          ),
      itemCount: sections.length,
      separatorBuilder: (_, __) => SizedBox(height: AppHeight.h14),
      itemBuilder: (context, index) => ReviewSectionCard(
        section: sections[index],
      ),
    );
  }
}

/// The dynamic data displayed in one review card.
class ReviewSection {
  const ReviewSection({
    required this.title,
    required this.fields,
    required this.icon,
    this.onEdit,
  });

  final String title;
  final List<ReviewField> fields;
  final IconData icon;
  final VoidCallback? onEdit;
}

/// A label and its selected value in a [ReviewSection].
class ReviewField {
  const ReviewField({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;
}

/// A reusable card matching the order-review design.
class ReviewSectionCard extends StatelessWidget {
  const ReviewSectionCard({
    super.key,
    required this.section,
  });

  final ReviewSection section;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.all(AppPaddingWidth.p18),
      borderRadius: BorderRadius.circular(AppRadius.r20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ReviewCardHeader(section: section),
          SizedBox(height: AppHeight.h24),
          for (var index = 0; index < section.fields.length; index++) ...[
            _ReviewFieldRow(field: section.fields[index]),
            if (index < section.fields.length - 1) ...[
              SizedBox(height: AppHeight.h18),
              const Divider(color: AppColors.secondaryLightActive, height: 1),
              SizedBox(height: AppHeight.h18),
            ],
          ],
        ],
      ),
    );
  }
}

class _ReviewCardHeader extends StatelessWidget {
  const _ReviewCardHeader({required this.section});

  final ReviewSection section;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppWidth.w52,
          height: AppHeight.h52,
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(AppRadius.r16),
          ),
          child: Icon(
            section.icon,
            color: AppColors.secondary,
            size: AppSize.s28,
          ),
        ),
        SizedBox(width: AppWidth.w12),
        Expanded(
          child: SectionTitle(
            text: section.title,
            color: AppColors.mainText,
            fontSize: AppFontSize.s24,
            fontWeight: AppFontWeight.bold,
            maxLines: 1,
          ),
        ),
        if (section.onEdit != null)
          IconButton(
            tooltip: MaterialLocalizations.of(context).editButtonLabel,
            onPressed: section.onEdit,
            icon: Icon(
              Icons.edit_outlined,
              color: AppColors.primary,
              size: AppSize.s28,
            ),
          ),
      ],
    );
  }
}

class _ReviewFieldRow extends StatelessWidget {
  const _ReviewFieldRow({required this.field});

  final ReviewField field;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BodyTitle(
            text: field.label,
            color: AppColors.mainText,
            fontSize: AppFontSize.s18,
            fontWeight: AppFontWeight.regular,
          ),
        ),
        SizedBox(width: AppWidth.w16),
        Flexible(
          child: BodyTitle(
            text: field.value,
            textAlign: TextAlign.end,
            color: AppColors.mainText,
            fontSize: AppFontSize.s18,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ],
    );
  }
}
