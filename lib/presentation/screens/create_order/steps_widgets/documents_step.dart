import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/widgets/section_card.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';
import 'package:icons_plus/icons_plus.dart';

class DocumentsStep extends StatelessWidget {
  const DocumentsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Iconsax.activity_outline,
                size: AppSize.s16,
                color: AppColors.secondary,
              ),
              SizedBox(width: AppWidth.w4),
              Expanded(
                child: SectionTitle(
                  text: 'ارفاق الوثائق المتوفرة',
                  color: AppColors.primaryDark,
                  fontSize: AppFontSize.s14,
                ),
              ),
            ],
          ),
          SizedBox(height: AppHeight.h8),
          BodyTitle(
            text:
                'ليس من الضروري توفر جميع الوثائق الآن. ارفع المتوفر وسيحدد فريق فرسان النواقص بعد المراجعة.',
            color: AppColors.secondaryText,
            fontSize: AppFontSize.s12,
            fontWeight: AppFontWeight.regular,
            maxLines: 2,
          ),
          SizedBox(height: AppHeight.h16),
          const _DocumentCard(
            title: 'وكالة أو تفويض',
            availability: 'إن وجد',
            icon: Icons.assignment_ind_outlined,
          ),
          SizedBox(height: AppHeight.h10),
          const _DocumentCard(
            title: 'صورة الهوية / جواز السفر',
            availability: 'مطلوب عند توفره',
            icon: Icons.badge_outlined,
          ),
          SizedBox(height: AppHeight.h10),
          const _DocumentCard(
            title: 'مستند المقر',
            availability: 'إن وجد',
            icon: Icons.description_outlined,
          ),
        ],
      ),
    );
  }
}

class _DocumentCard extends StatelessWidget {
  const _DocumentCard({
    required this.title,
    required this.availability,
    required this.icon,
  });

  final String title;
  final String availability;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p16,
        vertical: AppPaddingHeight.p18,
      ),
      borderRadius: BorderRadius.circular(AppRadius.r12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryDark, size: AppSize.s22),
          SizedBox(width: AppWidth.w12),
          Expanded(
            child: SectionTitle(
              text: title,
              color: AppColors.primaryDark,
              fontSize: AppFontSize.s16,
              fontWeight: AppFontWeight.medium,
              maxLines: 1,
            ),
          ),
          SizedBox(width: AppWidth.w12),
          BodyTitle(
            text: availability,
            color: AppColors.secondary,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
