import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/resources/app_colors.dart';

void main() {
  test('semantic colors use the green and yellow brand palettes', () {
    expect(AppColors.primary, const Color(0xFF0D3D35));
    expect(AppColors.secondary, const Color(0xFFD0A96B));
    expect(AppColors.blackText, AppColors.mainText);
    expect(AppColors.greyText, AppColors.secondaryText);
  });

  test('brand and text palettes include every interaction shade', () {
    expect(
      <Color>{
        AppColors.light,
        AppColors.lightHover,
        AppColors.lightActive,
        AppColors.normal,
        AppColors.normalHover,
        AppColors.normalActive,
        AppColors.dark,
        AppColors.darkHover,
        AppColors.darkActive,
        AppColors.darker,
      },
      hasLength(10),
    );
    expect(
      <Color>{
        AppColors.secondaryLight,
        AppColors.secondaryLightHover,
        AppColors.secondaryLightActive,
        AppColors.secondaryNormal,
        AppColors.secondaryNormalHover,
        AppColors.secondaryNormalActive,
        AppColors.secondaryDark,
        AppColors.secondaryDarkHover,
        AppColors.secondaryDarkActive,
        AppColors.secondaryDarker,
      },
      hasLength(10),
    );
    expect(
      <Color>{
        AppColors.mainTextLight,
        AppColors.mainTextLightHover,
        AppColors.mainTextLightActive,
        AppColors.mainText,
        AppColors.mainTextHover,
        AppColors.mainTextActive,
        AppColors.mainTextDark,
        AppColors.mainTextDarkHover,
        AppColors.mainTextDarkActive,
        AppColors.mainTextDarker,
      },
      hasLength(10),
    );
    expect(
      <Color>{
        AppColors.secondaryTextLight,
        AppColors.secondaryTextLightHover,
        AppColors.secondaryTextLightActive,
        AppColors.secondaryText,
        AppColors.secondaryTextHover,
        AppColors.secondaryTextActive,
        AppColors.secondaryTextDark,
        AppColors.secondaryTextDarkHover,
        AppColors.secondaryTextDarkActive,
        AppColors.secondaryTextDarker,
      },
      hasLength(10),
    );
  });
}
