import 'package:flutter/material.dart';
import 'package:fokko/core/utils/theme_controller.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => ThemeModeController.toggle(),
      icon: Icon(
        ThemeModeController.notifier.value == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
      ),
    );
  }
}
