import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/localization_extension.dart';
import 'package:forsan/core/resources/app_colors.dart';
import 'package:forsan/core/resources/app_fonts.dart';
import 'package:forsan/core/resources/app_values.dart';
import 'package:forsan/presentation/cubit/setting/setting_cubit.dart';
import 'package:forsan/presentation/cubit/setting/setting_state.dart';
import 'package:forsan/presentation/widgets/text/body_title.dart';

void showLanguageSheet(BuildContext context) {
  final settingCubit = context.read<SettingCubit>();

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .55),
    builder: (context) => BlocProvider.value(
      value: settingCubit,
      child: const _LanguageSheet(),
    ),
  );
}

class _LanguageSheet extends StatelessWidget {
  const _LanguageSheet();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .955,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.r18),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p16),
            child: Column(
              children: [
                SizedBox(height: AppHeight.h22),
                BodyTitle(
                  text: context.loc.language,
                  color: AppColors.mainText,
                  fontSize: AppFontSize.s24,
                  fontWeight: AppFontWeight.bold,
                ),
                SizedBox(height: AppHeight.h20),
                BlocBuilder<SettingCubit, SettingState>(
                  builder: (context, state) => Column(
                    children: [
                      _LanguageOption(
                        label: 'العربية',
                        flag: '🇸🇦',
                        selected: state.language == SettingLanguage.arabic,
                        onTap: () => context.read<SettingCubit>().selectLanguage(
                          SettingLanguage.arabic,
                        ),
                      ),
                      SizedBox(height: AppHeight.h11),
                      _LanguageOption(
                        label: 'الانجليزية',
                        flag: '🇬🇧',
                        selected: state.language == SettingLanguage.english,
                        onTap: () => context.read<SettingCubit>().selectLanguage(
                          SettingLanguage.english,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  static const _selectedColor = Color(0xFF0D473E);
  static const _borderColor = Color(0xFFE2E4E8);

  final String label;
  final String flag;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.label,
    required this.flag,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.r9),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: AppHeight.h53,
            padding: EdgeInsets.symmetric(horizontal: AppPaddingWidth.p8),
            decoration: BoxDecoration(
              color: selected ? _selectedColor : AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.r9),
              border: Border.all(
                color: selected ? _selectedColor : _borderColor,
              ),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text(flag, style: TextStyle(fontSize: AppFontSize.s24)),
                  SizedBox(width: AppWidth.w8),
                  Expanded(
                    child: BodyTitle(
                      text: label,
                      color: selected ? AppColors.white : AppColors.secondaryText,
                      fontSize: AppFontSize.s16,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                  if (selected)
                    Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: AppSize.s24,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
