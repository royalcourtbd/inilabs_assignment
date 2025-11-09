import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:inilabs_assignment/core/config/app_screen.dart';
import 'package:inilabs_assignment/features/initial/presentation/ui/initial_page.dart';

class InilabsApp extends StatelessWidget {
  const InilabsApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get globalContext =>
      navigatorKey.currentContext ?? Get.context!;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return Overlay(
          initialEntries: [OverlayEntry(builder: (context) => child!)],
        );
      },
      onInit: () => AppScreen.setUp(context),
      onReady: () => AppScreen.setUp(context),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'Initial Project',
      home: InitialPage(),
    );
  }
}
