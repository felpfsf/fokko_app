import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fokko/core/utils/theme_controller.dart';

import 'app.dart';
import 'flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  await ThemeModeController.init();

  runApp(const App());
}
