import 'package:flutter/material.dart';

import 'package:privateinsta/src/app.dart';
import 'package:privateinsta/src/settings/settings_controller.dart';
import 'package:privateinsta/src/settings/settings_service.dart';

void main() async {
  final SettingsController settingsController =
      SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}
