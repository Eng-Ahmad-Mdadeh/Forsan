import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_fonts.dart';
import '../../../../core/resources/app_values.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/text/body_title.dart';

class DocumentCompleteRequirementsButton extends StatelessWidget {
  const DocumentCompleteRequirementsButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Container(
    color: AppColors.white,
    padding: EdgeInsets.fromLTRB(
      AppPaddingWidth.p16,
      AppPaddingHeight.p8,
      AppPaddingWidth.p16,
      AppPaddingHeight.p16,
    ),
    child: SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        height: AppHeight.h48,
        onPressed: onPressed,
        color: AppColors.primary,
        borderRadius: AppRadius.r8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.file_upload_outlined,
              color: AppColors.white,
              size: AppSize.s16,
            ),
            SizedBox(width: AppWidth.w8),
            BodyTitle(
              text: 'استكمال المتطلبات',
              color: AppColors.white,
              fontSize: AppFontSize.s12,
              fontWeight: AppFontWeight.medium,
            ),
          ],
        ),
      ),
    ),
  );
}
