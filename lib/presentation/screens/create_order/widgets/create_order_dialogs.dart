import 'package:flutter/material.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/presentation/widgets/app_status_dialog.dart';

abstract final class CreateOrderDialogs {
  static Future<void> showExitConfirmation(
    BuildContext context, {
    required VoidCallback onSaveDraft,
    required VoidCallback onCloseOrder,
  }) {
    return AppStatusDialog.show(
      context,
      title: 'هل تود الخروج ؟',
      message: 'يمكنك حفظ الطلب كمسودة ومتابعته لاحقا',
      primaryButtonText: 'حفظ كمسودة',
      secondaryButtonText: 'إغلاق الطلب ',
      secondaryButtonIcon: Icons.close,
      primaryButtonIcon: Icons.edit_document,
      icon: Icons.logout_rounded,
      iconColor: AppColors.white,
      iconBackgroundColor: AppColors.primary,
      iconBorderColor: AppColors.secondary,
      iconOuterBackgroundColor: const Color(0xFFE4DEF2),
      secondaryButtonColor: AppColors.red,
      titleColor: AppColors.black,
      messageColor: AppColors.greyText,
      messageFontSize: AppFontSize.s14,
      messageFontWeight: AppFontWeight.regular,
      messageMaxLines: 2,
      buttonsDirection: Axis.horizontal,
      showCloseButton: true,
      canDismiss: true,
      onSecondaryPressed: onCloseOrder,
      onPrimaryPressed: onSaveDraft,
    );
  }

  static Future<void> showSubmissionSuccess(
    BuildContext context, {
    String? orderNumber,
  }) {
    return AppStatusDialog.show(
      context,
      title: 'تم استلام طلبك بنجاح',
      message:
          'سيقوم فريق فرسان بمراجعة المعلومات والمستندات والتواصل معك في حال وجود نواقص أو متطلبات إضافية، ثم سيتم تزويدك بالمسار والتكلفة النهائية.',
      primaryButtonText: 'متابعة الطلب',
      orderNumber: orderNumber,
      icon: Icons.logout_rounded,
      iconColor: AppColors.white,
      iconBackgroundColor: AppColors.primary,
      iconBorderColor: AppColors.secondary,
      iconOuterBackgroundColor: const Color(0xFFE4DEF2),
      secondaryButtonColor: AppColors.red,
      titleColor: AppColors.black,
      messageColor: AppColors.greyText,
      messageFontSize: AppFontSize.s14,
      messageFontWeight: AppFontWeight.regular,
      messageMaxLines: 2,
      buttonsDirection: Axis.horizontal,
      showCloseButton: true,
      canDismiss: true,
      onPrimaryPressed: () => Navigator.of(context).pop(),
    );
  }
}
