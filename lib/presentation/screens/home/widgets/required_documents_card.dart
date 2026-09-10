import 'package:flutter/material.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/required_action_card.dart';

class RequiredDocumentsCard extends StatelessWidget {
  const RequiredDocumentsCard({super.key});

  @override
  Widget build(BuildContext context) => RequiredActionCard(
    titleSpan: TextSpan(
      children: [
        const TextSpan(text: 'إجراء مطلوب على الطلب '),
        TextSpan(
          text: 'FR-2026-001259',
          style: TextStyle(
            color: AppColors.mainText,
            fontWeight: AppFontWeight.bold,
            fontSize: AppFontSize.s12,
          ),
        ),
      ],
    ),
    message:
        'يرجى إرفاق المستندات المطلوبة لاستكمال \n مراجعة طلب تأسيس الشركة.',
    buttonText: 'استكمال المتطلبات',
    semanticsLabel: 'إجراء مطلوب على الطلب FR-2026-001259',
    onPressed: () => CompleteRequirementsRoute().push(context),
    compact: true,
    illustration: Semantics(
      image: true,
      label: 'شعار فرسان',
      child: SizedBox(
        width: AppWidth.w65,
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(
            AppColors.secondaryNormal,
            BlendMode.srcIn,
          ),
          child: ImageView(
            imagePath: AppAssets.addFile,
            fit: BoxFit.contain,
            excludeFromSemantics: true,
          ),
        ),
      ),
    ),
  );
}
