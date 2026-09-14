import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/cubit/setting/setting_state.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_bottom_sheet.dart';
import 'package:forsan/presentation/widgets/custom_switch.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';
import 'package:forsan/presentation/widgets/text/section_title.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => SettingCubit(),
    child: const _SettingView(),
  );
}

class _SettingView extends StatelessWidget {
  const _SettingView();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: CustomAppBar(
      title: context.loc.settings,
      showBackButton: true,
      centerTitle: true,
      backgroundColor: AppColors.white,
      toolbarHeight: AppHeight.h70,
      showScrolledUnderElevation: false,
    ),
    body: Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddingWidth.p20,
          vertical: AppPaddingHeight.p20,
        ),
        children: [
          _SettingsCard(
            icon: Icons.notifications_none_rounded,
            child: CustomSwitch(
              title: context.loc.notifications,
              initialValue:
                  context.read<SettingCubit>().state.notificationsEnabled,
              titleColor: AppColors.mainText,
              titleSize: AppFontSize.s18,
              onChanged: context.read<SettingCubit>().setNotificationsEnabled,
            ),
          ),
          SizedBox(height: AppHeight.h17),
          BlocBuilder<SettingCubit, SettingState>(
            buildWhen: (previous, current) =>
                previous.biometricsEnabled != current.biometricsEnabled ||
                previous.biometricSwitchRevision !=
                    current.biometricSwitchRevision,
            builder: (context, state) => _SettingsCard(
              icon: Icons.fingerprint_rounded,
              child: CustomSwitch(
                key: ValueKey(
                  '${state.biometricsEnabled}-${state.biometricSwitchRevision}',
                ),
                title: context.loc.biometric_activation_title,
                initialValue: state.biometricsEnabled,
                titleColor: AppColors.mainText,
                titleSize: AppFontSize.s18,
                onChanged: (value) =>
                    _onBiometricsChanged(context, value),
              ),
            ),
          ),
          SizedBox(height: AppHeight.h17),
          _SettingsCard(
            icon: Icons.translate_rounded,
            onTap: () => _showLanguageSheet(context),
            child: _SettingsTitle(title: context.loc.language),
          ),
          SizedBox(height: AppHeight.h17),
          _SettingsCard(
            icon: Icons.delete_outline_rounded,
            color: AppColors.red,
            onTap: () => _showDeleteAccountSheet(context),
            child: _SettingsTitle(
              title: context.loc.delete_account,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    ),
  );

  Future<void> _onBiometricsChanged(
    BuildContext context,
    bool value,
  ) async {
    final cubit = context.read<SettingCubit>();
    if (!value) {
      await cubit.setBiometricsEnabled(false);
      return;
    }

    final shouldVerify = await _showBiometricActivationSheet(context);
    if (!context.mounted) return;

    if (shouldVerify != true) {
      cubit.resetBiometricSwitch();
      return;
    }

    final activated = await _showBiometricVerificationSheet(context, cubit);
    if (!context.mounted) return;

    if (!activated) cubit.resetBiometricSwitch();
  }

  Future<bool?> _showBiometricActivationSheet(BuildContext context) {
    return CustomBottomSheet.show<bool>(
      context,
      title: '',
      showHeader: false,
      isScroll: false,
      heightFactor: .43,
      borderRadius: AppRadius.r14,
      backgroundColor: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p20,
        vertical: AppPaddingHeight.p10,
      ),
      body: Column(
        children: [
          _SheetCloseButton(onTap: () => Navigator.of(context).pop(false)),
          const _BiometricIllustration(showCheck: true),
          SizedBox(height: AppHeight.h12),
          SectionTitle(
            text: context.loc.biometric_activation_title,
            color: AppColors.primary,
            fontSize: AppFontSize.s18,
          ),
          SizedBox(height: AppHeight.h8),
          BodyTitle(
            text: context.loc.biometric_activation_description,
            color: AppColors.greyText,
            fontSize: AppFontSize.s14,
            fontWeight: AppFontWeight.regular,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: AppHeight.h50,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.r7),
                ),
              ),
              child: BodyTitle(
                text: 'تفعيل',
                color: AppColors.white,
                fontSize: AppFontSize.s16,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: BodyTitle(
              text: context.loc.later,
              color: AppColors.primary,
              fontSize: AppFontSize.s14,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _showBiometricVerificationSheet(
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
      body: Builder(
        builder: (sheetContext) => Column(
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
                _SheetCloseButton(
                  onTap: () => Navigator.of(sheetContext).pop(false),
                ),
              ],
            ),
            SizedBox(height: AppHeight.h30),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () async {
                final activated = await cubit.activateBiometrics(
                  reason: context.loc.biometric_auth_reason,
                );
                if (!sheetContext.mounted) return;

                if (activated) {
                  Navigator.of(sheetContext).pop(true);
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
              },
              child: const _BiometricIllustration(),
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
        ),
      ),
    );

    return result ?? false;
  }

  void _showLanguageSheet(BuildContext context) {
    CustomBottomSheet.show<void>(
      context,
      title: context.loc.choose_language,
      heightFactor: .34,
      borderRadius: AppRadius.r20,
      backgroundColor: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p20),
      body: BlocProvider.value(
        value: context.read<SettingCubit>(),
        child: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) => Column(
            children: [
              for (final language in SettingLanguage.values)
                RadioListTile<SettingLanguage>(
                  value: language,
                  groupValue: state.language,
                  activeColor: AppColors.primary,
                  contentPadding: EdgeInsets.zero,
                  title: BodyTitle(
                    text: language == SettingLanguage.arabic
                        ? 'العربية'
                        : 'English',
                    color: AppColors.mainText,
                    fontSize: AppFontSize.s16,
                    fontWeight: AppFontWeight.medium,
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<SettingCubit>().selectLanguage(value);
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteAccountSheet(BuildContext context) {
    CustomBottomSheet.show<void>(
      context,
      title: context.loc.delete_account,
      heightFactor: .38,
      borderRadius: AppRadius.r20,
      backgroundColor: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddingWidth.p20,
        vertical: AppPaddingHeight.p20,
      ),
      body: Column(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.red,
            size: AppSize.s50,
          ),
          SizedBox(height: AppHeight.h15),
          BodyTitle(
            text: context.loc.delete_account_confirm_message,
            textAlign: TextAlign.center,
            color: AppColors.mainText,
            fontSize: AppFontSize.s16,
            fontWeight: AppFontWeight.medium,
            maxLines: 3,
          ),
          SizedBox(height: AppHeight.h25),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    minimumSize: Size.fromHeight(AppHeight.h50),
                  ),
                  child: BodyTitle(
                    text: context.loc.cancel,
                    color: AppColors.primary,
                    fontSize: AppFontSize.s16,
                  ),
                ),
              ),
              SizedBox(width: AppWidth.w12),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.red,
                    minimumSize: Size.fromHeight(AppHeight.h50),
                  ),
                  child: BodyTitle(
                    text: context.loc.confirm,
                    color: AppColors.white,
                    fontSize: AppFontSize.s16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.icon,
    required this.child,
    this.color = AppColors.primary,
    this.onTap,
  });

  final IconData icon;
  final Widget child;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: AppColors.backGround,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.lightGrey),
      borderRadius: BorderRadius.circular(AppRadius.r14),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.r14),
      child: SizedBox(
        height: AppHeight.h90,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p20),
          child: Row(
            children: [
              Icon(icon, color: color, size: AppSize.s30),
              SizedBox(width: AppWidth.w15),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    ),
  );
}

class _SettingsTitle extends StatelessWidget {
  const _SettingsTitle({required this.title, this.color = AppColors.mainText});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: BodyTitle(
      text: title,
      color: color,
      fontSize: AppFontSize.s18,
      fontWeight: AppFontWeight.regular,
    ),
  );
}

class _SheetCloseButton extends StatelessWidget {
  const _SheetCloseButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.r7),
      child: Container(
        width: AppWidth.w30,
        height: AppHeight.h30,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(AppRadius.r7),
        ),
        child: Icon(
          Icons.close_rounded,
          color: AppColors.primary,
          size: AppSize.s20,
        ),
      ),
    ),
  );
}

class _BiometricIllustration extends StatelessWidget {
  const _BiometricIllustration({this.showCheck = false});

  final bool showCheck;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: showCheck ? AppWidth.w86 : AppWidth.w132,
    height: showCheck ? AppHeight.h86 : AppHeight.h130,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: showCheck ? AppColors.secondaryLight : AppColors.white,
            border: Border.all(
              color: AppColors.primary,
              width: showCheck ? AppWidth.w1 : AppWidth.w5,
            ),
          ),
        ),
        Icon(
          Icons.fingerprint_rounded,
          color: AppColors.primary,
          size: showCheck ? AppSize.s58 : AppSize.s65,
        ),
        if (showCheck)
          PositionedDirectional(
            end: 0,
            bottom: 0,
            child: Container(
              width: AppWidth.w30,
              height: AppHeight.h30,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
                size: AppSize.s30,
              ),
            ),
          ),
      ],
    ),
  );
}
