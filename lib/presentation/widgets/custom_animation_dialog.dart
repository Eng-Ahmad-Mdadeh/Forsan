import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import '../../core/resources/app_fonts.dart';

class CustomAnimationDialog {
  static Future<void> showDialog(BuildContext context, {
    required String message,
    Widget? messageWidget,
    String? okText,
    String? cancelText,
    bool? dismissOnBackKeyPress,
    Color? cancelColor,
    Color? okColor,
    VoidCallback? onOkPressed,
    VoidCallback? onCancelPressed,
    DialogType dialogType = DialogType.error,
  }) {
    return AwesomeDialog(
      useRootNavigator: true,

      dialogBackgroundColor: AppColors.white,
      context: context,
      dismissOnBackKeyPress: dismissOnBackKeyPress ?? true,
      animType: AnimType.scale,
      dialogType: dialogType,
      dismissOnTouchOutside: dismissOnBackKeyPress ?? true,
      body: Center(
        child: messageWidget ??
            BodyTitle(
              textAlign: TextAlign.center,
              text: message,
              overflow: TextOverflow.visible,
              fontSize: AppFontSize.s15,
              fontWeight: AppFontWeight.medium,
            ),
      ),
      btnOkColor: okColor ?? AppColors.lightPrimary,
      btnCancelColor: cancelColor,
      btnCancelText: cancelText,
      btnOkText: okText ?? "Retry",
      btnCancelOnPress: cancelText == null && onCancelPressed == null
          ? null
          : onCancelPressed ?? () => context.pop(),
      btnOkOnPress: onOkPressed,
    ).show();
  }
}
