import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  final Rx<ThemeMode> _themeMode = Rx<ThemeMode>(ThemeMode.light);

  ThemeMode get themeMode => _themeMode.value;

  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  /// Toggle theme mode between light and dark
  void toggleTheme() {
    _themeMode.value = _themeMode.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    // Update theme using GetX
    Get.changeThemeMode(_themeMode.value);
  }

  /// Set a specific theme mode
  void setThemeMode(ThemeMode mode) {
    _themeMode.value = mode;
    Get.changeThemeMode(mode);
  }

  /// Set light theme mode
  void setLightMode() {
    setThemeMode(ThemeMode.light);
  }

  /// Set dark theme mode
  void setDarkMode() {
    setThemeMode(ThemeMode.dark);
  }

  /// Stream to observe the theme mode reactively
  Stream<ThemeMode> get themeModeStream => _themeMode.stream;

  /// Access Rx variable directly
  Rx<ThemeMode> get themeModeRx => _themeMode;
}
