import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/di/service_locator.dart';
import 'package:inilabs_assignment/inilabs_app.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeApp();
    runApp(InilabsApp());
  }, (error, stackTrace) => (error, stackTrace, fatal: true));
}

Future<void> _initializeApp() async {
  await ServiceLocator.setUp();
}
