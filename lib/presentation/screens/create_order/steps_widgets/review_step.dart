import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

/// Displays the sections entered by the user before submitting an order.
///
/// The content is supplied through [cards], allowing the same review UI to
/// be used for every order type and for any number of cards.
class ReviewStep extends StatelessWidget {
  const ReviewStep({
    super.key,
    required this.cards,
    this.padding,
  });

  final List<ReviewSectionCard> cards;
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
      itemCount: cards.length,
      separatorBuilder: (_, __) => SizedBox(height: AppHeight.h14),
      itemBuilder: (_, index) => cards[index],
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
      padding: EdgeInsets.all(AppPaddingWidth.p18),
      borderRadius: BorderRadius.circular(AppRadius.r20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ReviewCardHeader(
            title: title,
            icon: icon,
            onEdit: onEdit,
          ),
          SizedBox(height: AppHeight.h24),
          for (var index = 0; index < fields.length; index++) ...[
            _ReviewFieldRow(field: fields[index]),
            if (index < fields.length - 1) ...[
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
          width: AppWidth.w52,
          height: AppHeight.h52,
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(AppRadius.r16),
          ),
          child: Icon(
            icon,
            color: AppColors.secondary,
            size: AppSize.s28,
          ),
        ),
        SizedBox(width: AppWidth.w12),
        Expanded(
          child: SectionTitle(
            text: title,
            color: AppColors.mainText,
            fontSize: AppFontSize.s24,
            fontWeight: AppFontWeight.bold,
            maxLines: 1,
          ),
        ),
        if (onEdit != null)
          IconButton(
            tooltip: MaterialLocalizations.of(context).editButtonLabel,
            onPressed: onEdit,
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

  final ({String label, String value}) field;

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
