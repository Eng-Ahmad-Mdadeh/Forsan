import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/cubit/setting/setting_state.dart';
import 'package:forsan/presentation/widgets/custom_bottom_sheet.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

void showLanguageSheet(BuildContext context) {
  CustomBottomSheet.show<void>(
    context,
    canPop: false,
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
