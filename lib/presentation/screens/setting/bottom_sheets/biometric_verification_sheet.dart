import 'package:flutter/material.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/screens/setting/widgets/biometric_illustration.dart';
import 'package:forsan/presentation/screens/setting/widgets/sheet_close_button.dart';
import 'package:forsan/presentation/widgets/custom_bottom_sheet.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

Future<bool> showBiometricVerificationSheet(
  BuildContext context,
  SettingCubit cubit,
) async {
  final result = await CustomBottomSheet.show<bool>(
    context,
    title: '',
    showHeader: false,
    isScroll: false,
    heightFactor: .52,
    borderRadius: AppRadius.r14,
    backgroundColor: AppColors.white,
    padding: EdgeInsets.symmetric(
      horizontal: AppPaddingWidth.p20,
      vertical: AppPaddingHeight.p10,
    ),
    body: _BiometricVerificationContent(cubit: cubit),
  );
  return result ?? false;
}

class _BiometricVerificationContent extends StatefulWidget {
  const _BiometricVerificationContent({required this.cubit});

  final SettingCubit cubit;

  @override
  State<_BiometricVerificationContent> createState() =>
      _BiometricVerificationContentState();
}

class _BiometricVerificationContentState
    extends State<_BiometricVerificationContent> {
  bool _authenticationStarted = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_authenticationStarted) return;
    _authenticationStarted = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _authenticate());
  }

  Future<void> _authenticate() async {
    final activated = await widget.cubit.activateBiometrics(
      reason: context.loc.biometric_auth_reason,
    );
    if (!mounted) return;

    if (activated) {
      Navigator.of(context).pop(true);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: BodyTitle(
          text: context.loc.biometric_auth_failed,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          SectionTitle(
            text: 'تحقق من الهوية',
            color: AppColors.primary,
            textAlign: TextAlign.center,
            fontSize: AppFontSize.s16,
          ),
          SheetCloseButton(onTap: () => Navigator.of(context).pop(false)),
        ],
      ),
      SizedBox(height: AppHeight.h30),
      InkWell(
        customBorder: const CircleBorder(),
        onTap: _authenticate,
        child: const BiometricIllustration(),
      ),
      SizedBox(height: AppHeight.h20),
      SectionTitle(
        text: 'استخدم بصمة إصبعك',
        color: AppColors.primary,
        fontSize: AppFontSize.s18,
      ),
      SizedBox(height: AppHeight.h8),
      BodyTitle(
        text: 'ضع إصبعك على المستشعر للتحقق من هويتك وتأمين الميزة',
        color: AppColors.greyText,
        fontSize: AppFontSize.s14,
        fontWeight: AppFontWeight.regular,
        textAlign: TextAlign.center,
        maxLines: 3,
      ),
    ],
  );
}
