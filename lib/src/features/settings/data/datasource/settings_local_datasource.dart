import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:random_anime_quotes/src/core/constants/constants.dart';

abstract class ISettingsLocalDataSource {
  Color getPrimaryColor();
  void savePrimaryColor(Color color);
  ThemeMode getThemeMode();
  void saveThemeMode(ThemeMode themeMode);
  String getTranslateCode();
  void saveTranslateCode(String code);
}

const _primaryColorKey = 'primaryColor';
const _themeModeKey = 'themeData';
const _translateCodeKey = 'translateCode';

class SettingsLocalDataSource implements ISettingsLocalDataSource {
  SettingsLocalDataSource(this.box);

  final Box box;

  @override
  Color getPrimaryColor() {
    final int value =
        box.get(_primaryColorKey, defaultValue: kDefaultColor.value);
    return Color(value);
  }

  @override
  void savePrimaryColor(Color color) {
    box.put(_primaryColorKey, color.value);
  }

  @override
  ThemeMode getThemeMode() {
    return ThemeMode.values[box.get(_themeModeKey, defaultValue: 1)];
  }

  @override
  void saveThemeMode(ThemeMode themeMode) {
    box.put(_themeModeKey, themeMode.index);
  }

  @override
  String getTranslateCode() {
    return box.get(_translateCodeKey, defaultValue: kDefaultTranslationCode);
  }

  @override
  void saveTranslateCode(String code) {
    box.put(_translateCodeKey, code);
  }
}
