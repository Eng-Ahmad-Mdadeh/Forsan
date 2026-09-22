import 'package:forsan/core/constants/app_storage_paths.dart';
import 'package:forsan/core/helper/local_storage_helper.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit({Locale initialLocale = const Locale('ar')}) : super(initialLocale);

  static const String boxName = AppStoragePaths.settingsBox;
  static const String localeKey = AppStoragePaths.locale;
  static const List<String> supportedLocales = ['ar', 'en'];

  final LocalStorageHelper _storage = locator<LocalStorageHelper>();

  Future<void> setLocale(Locale locale) async {
    if (!supportedLocales.contains(locale.languageCode)) {
      return;
    }
    if (state.languageCode == locale.languageCode) {
      return;
    }
    await _storage.saveValue(boxName, localeKey, locale.languageCode);
    if (isClosed) return;
    emit(locale);
  }
}
