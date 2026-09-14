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
                previous.biometricsEnabled != current.biometricsEnabled,
            builder: (context, state) => _SettingsCard(
              icon: Icons.fingerprint_rounded,
              child: CustomSwitch(
                key: ValueKey(state.biometricsEnabled),
                title: context.loc.biometric_activation_title,
                initialValue: state.biometricsEnabled,
                titleColor: AppColors.mainText,
                titleSize: AppFontSize.s18,
                onChanged: context.read<SettingCubit>().setBiometricsEnabled,
              ),
            ),
          ),
          SizedBox(height: AppHeight.h17),
          _SettingsCard(
            icon: Icons.translate_rounded,
            onTap: _showLanguageSheet,
            child: _SettingsTitle(title: context.loc.language),
          ),
          SizedBox(height: AppHeight.h17),
          _SettingsCard(
            icon: Icons.delete_outline_rounded,
            color: AppColors.red,
            onTap: _showDeleteAccountSheet,
            child: _SettingsTitle(
              title: context.loc.delete_account,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    ),
  );

  void _showLanguageSheet() {
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
                  title: Text(
                    language == SettingLanguage.arabic
                        ? 'العربية'
                        : 'English',
                    style: TextStyle(
                      color: AppColors.mainText,
                      fontSize: AppFontSize.s16,
                      fontWeight: AppFontWeight.medium,
                    ),
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

  void _showDeleteAccountSheet() {
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
          Text(
            context.loc.delete_account_confirm_message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.mainText,
              fontSize: AppFontSize.s16,
              fontWeight: AppFontWeight.medium,
            ),
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
                  child: Text(context.loc.cancel),
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
                  child: Text(context.loc.confirm),
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
    child: Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: AppFontSize.s18,
        fontWeight: AppFontWeight.regular,
      ),
    ),
  );
}
