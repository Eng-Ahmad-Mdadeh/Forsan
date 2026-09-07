import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// Primary (green) color palette.
  static const Color light = Color(0xFFE7ECEB);
  static const Color lightHover = Color(0xFFDBE2E1);
  static const Color lightActive = Color(0xFFBAC5C3);
  static const Color normalLight = light;
  static const Color normal = Color(0xFF0D3D35);
  static const Color normalHover = Color(0xFF0C3730);
  static const Color normalActive = Color(0xFF0A312A);
  static const Color dark = Color(0xFF0A2E28);
  static const Color darkHover = Color(0xFF082520);
  static const Color darkActive = Color(0xFF061B18);
  static const Color darker = Color(0xFF051513);

  /// Secondary (yellow) color palette.
  static const Color secondaryLight = Color(0xFFFAF6F0);
  static const Color secondaryLightHover = Color(0xFFF7F2E9);
  static const Color secondaryLightActive = Color(0xFFEEE4D1);
  static const Color secondaryNormal = Color(0xFFD0A96B);
  static const Color secondaryNormalHover = Color(0xFFBE985E);
  static const Color secondaryNormalActive = Color(0xFFA38756);
  static const Color secondaryDark = Color(0xFF977F50);
  static const Color secondaryDarkHover = Color(0xFF786540);
  static const Color secondaryDarkActive = Color(0xFF5A4C30);
  static const Color secondaryDarker = Color(0xFF463B25);

  /// Main text color palette.
  static const Color mainTextLight = Color(0xFFE9E9E9);
  static const Color mainTextLightHover = Color(0xFFDDDDDD);
  static const Color mainTextLightActive = Color(0xFFBCBCBC);
  static const Color mainText = Color(0xFF14211F);
  static const Color mainTextHover = Color(0xFF121E1C);
  static const Color mainTextActive = Color(0xFF101A19);
  static const Color mainTextDark = Color(0xFF0F1917);
  static const Color mainTextDarkHover = Color(0xFF0C1312);
  static const Color mainTextDarkActive = Color(0xFF090F0E);
  static const Color mainTextDarker = Color(0xFF070C0B);

  /// Secondary text color palette.
  static const Color secondaryTextLight = Color(0xFFEEEEEE);
  static const Color secondaryTextLightHover = Color(0xFFE1E4E2);
  static const Color secondaryTextLightActive = Color(0xFFC6C9C9);
  static const Color secondaryText = Color(0xFF2F5250);
  static const Color secondaryTextHover = Color(0xFF284443);
  static const Color secondaryTextActive = Color(0xFF23403F);
  static const Color secondaryTextDark = Color(0xFF233C3D);
  static const Color secondaryTextDarkHover = Color(0xFF1F3130);
  static const Color secondaryTextDarkActive = Color(0xFF192524);
  static const Color secondaryTextDarker = Color(0xFF191D1C);

  /// Backwards-compatible semantic aliases used throughout the app.
  static const Color primary = normal;
  static const Color primaryHover = normalHover;
  static const Color primaryActive = normalActive;
  static const Color primaryDark = dark;
  static const Color primaryDarkHover = darkHover;
  static const Color primaryDarkActive = darkActive;
  static const Color primaryDarker = darker;
  static const Color secondary = secondaryNormal;
  static const Color lightPrimary = light;
  static const Color lightPrimary2 = light;
  static const Color blue = Color(0xFF34A4B0);
  static const Color shadowPrimary = Color(0x8E0D3D35);

  /// Splash screen
  static const Color splashBackground = normal;
  static const Color splashPattern = Color(0xFF28564E);

  static const Color darkPrimary = primaryDark;

  static const Color blueText = Color(0xFFDCEBF6);
  static const Color blueBackGround = Color(0x0D00415F);
  static const Color iconBackGround = Color(0x0d3d5f81);
  static const Color searchColor = Color(0x18075E54);
  static const Color green = Color(0xFF7BB801);
  static const Color darkGreen = Color(0xFF27AE60);
  static const Color lightGreen = Color(0x337BB801);
  static const Color red = Color(0xFFC73030);
  static const Color lightRed = Color(0x33C73030);
  static const Color orange = Color(0xFFE39426);
  static const Color logoOrange = Color(0xFFFEC327);
  static const Color lightOrange = Color(0xFFF7EEDD);
  static const Color ownerPendingBackground = Color(0xFFFFFAF3);
  static const Color ownerRejected = Color(0xFFFF3158);
  static const Color ownerRejectedBackground = Color(0xFFFFF4F6);
  static const Color ownerDraftBackground = Color(0xFFF3F3F7);
  static const Color yellow = secondaryNormal;

  static const Color black = Color(0xFF000000);
  static const Color blackText = mainText;
  static const Color lightBlack = Color(0xFF292D32);
  static const Color blackCow = Color(0xFF4C4646);
  static const Color customerServiceMainText = Color(0xFF281E27);
  static const Color customerServiceDescriptionText = Color(0xFF4C4646);
  static const Color blackShadow = Color(0xFFA6A6A6);

  static const Color backGround = Color(0xFFFBFBFB);
  static const Color ofWhite = Color(0xFFB4B4B4);
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyButton = Color(0xFFF3F4F5);
  static const Color greyText = secondaryText;
  static const Color greySec = Color(0x71AFAFAF);
  static const Color greyDivider = Color(0x71C5C5C5);
  static const Color greyMan = Color(0xFFB0B0B0);
  static const Color grey = Color(0xFFAFAFAF);
  static const Color lightGreySec = Color(0xFFF9F9F9);
  static const Color lightGrey = Color(0xFFECECEC);
  static const Color lightBlue = Color(0x146A7380);

  /// Home screen
  static const Color homeCardShadow = Color(0x26000000);
  static const Color homeSoftShadow = Color(0x18000000);
  static const Color homeIconShadow = Color(0x08000000);
  static const Color homeSupportAction = Color(0xFF167565);
  static const Color homeHeroDark = Color(0xFF132238);
  static const Color homeBuildingSky = Color(0xFF0D3440);
  static const Color homeBuildingSide = Color(0xFF59606A);
  static const Color homeBuildingGround = Color(0xFF263247);
  static const Color homeBuildingFace = Color(0xFFC3C6C4);
  static const Color homeBuildingWindow = Color(0xFFEAF8F5);
  static const Color homeRoomWallTop = Color(0xFFDDE4E5);
  static const Color homeRoomWallBottom = Color(0xFFF7F2ED);
  static const Color homeRoomFloor = Color(0xFFC4BBB2);
  static const Color homeRoomWindowGlass = Color(0xFFE8F5EC);
  static const Color homeRoomFrame = Color(0xFFF6F3ED);
  static const Color homeRoomArt = Color(0xFFD87851);
  static const Color homeRoomLampStem = Color(0xFFC6BDB5);
  static const Color homeRoomLampShade = Color(0xFFD6CEC5);
  static const Color homeRoomSofa = Color(0xFFE4E0DA);
  static const Color homeRoomTable = Color(0xFF8E8174);
  static const Color homeRoomPlantStem = Color(0xFF9B846E);
  static const Color homeRoomPlantLeaf = Color(0xFF5B8F70);

  /// Advertiser profile cover
  static const Color advertiserCoverLight = Color(0xFFAA83EF);
  static const Color advertiserCoverDark = Color(0xFF5C3F9C);
  static const Color advertiserCoverLeftShape = Color(0x557A4FC8);
  static const Color advertiserCoverCenterShape = Color(0x55422883);
  static const Color advertiserCoverRightShape = Color(0x449B76E0);

  static const Color none = Colors.transparent;
}
