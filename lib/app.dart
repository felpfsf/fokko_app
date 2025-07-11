import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fokko/core/utils/theme_controller.dart';
import 'package:fokko/theme/app_theme.dart';
import 'package:fokko/ui/screen/home_screen.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeModeController.notifier,
      builder: (_, themeMode, __) {
        return MaterialApp(
          title: F.title,
          debugShowCheckedModeBanner: F.appFlavor == Flavor.dev, 
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          home: _flavorBanner(child: HomeScreen(), show: kDebugMode),
        );
      },
    );
  }

  Widget _flavorBanner({required Widget child, bool show = true}) => show
      ? Banner(
          location: BannerLocation.topStart,
          message: F.name,
          color: Colors.green.withAlpha(150),
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
            letterSpacing: 1.0,
          ),
          textDirection: TextDirection.ltr,
          child: child,
        )
      : Container(child: child);
}
