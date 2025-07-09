import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeController {
  static final ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.system);

  static const _prefsKey = 'theme_mode';

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final modeString = prefs.getString(_prefsKey);

    notifier.value = switch (modeString) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };
  }

  static Future<void> set(ThemeMode mode) async {
    notifier.value = mode;
    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setString(_prefsKey, mode.name);
  }

  static Future<void> toggle() async {
    final currentTheme = notifier.value;
    final newMode = currentTheme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    await set(newMode);
  }
}

