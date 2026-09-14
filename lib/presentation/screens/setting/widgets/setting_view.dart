import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/cubit/setting/setting_state.dart';
import 'package:forsan/presentation/screens/setting/biometric_settings_flow.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/delete_account_sheet.dart';
import 'package:forsan/presentation/screens/setting/bottom_sheets/language_sheet.dart';
import 'package:forsan/presentation/screens/setting/widgets/settings_card.dart';
import 'package:forsan/presentation/screens/setting/widgets/settings_title.dart';
import 'package:forsan/presentation/widgets/custom_app_bar.dart';
import 'package:forsan/presentation/widgets/custom_switch.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

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
          SettingsCard(
            icon: Icons.notifications_none_rounded,
            child: CustomSwitch(
              title: context.loc.notifications,
              initialValue:
                  context.read<SettingCubit>().state.notificationsEnabled,
              titleColor: AppColors.black,
              titleSize: AppFontSize.s14,
              onChanged: context.read<SettingCubit>().setNotificationsEnabled,
            ),
          ),
          SizedBox(height: AppHeight.h17),
          BlocBuilder<SettingCubit, SettingState>(
            buildWhen: (previous, current) =>
                previous.biometricsEnabled != current.biometricsEnabled ||
                previous.biometricSwitchRevision !=
                    current.biometricSwitchRevision,
            builder: (context, state) => SettingsCard(
              icon: Icons.fingerprint_rounded,
              child: CustomSwitch(
                key: ValueKey(
                  '${state.biometricsEnabled}-${state.biometricSwitchRevision}',
                ),
                title: context.loc.biometric_activation_title,
                initialValue: state.biometricsEnabled,
                titleColor: AppColors.black,
                titleSize: AppFontSize.s14,
                onChanged: (value) => handleBiometricsChanged(context, value),
              ),
            ),
          ),
          SizedBox(height: AppHeight.h17),
          SettingsCard(
            icon: Icons.translate_rounded,
            onTap: () => showLanguageSheet(context),
            child: SettingsTitle(title: context.loc.language),
          ),
          SizedBox(height: AppHeight.h17),
          SettingsCard(
            icon: Icons.delete_outline_rounded,
            color: AppColors.red,
            onTap: () => showDeleteAccountSheet(context),
            child: SettingsTitle(
              title: context.loc.delete_account,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    ),
  );
}
