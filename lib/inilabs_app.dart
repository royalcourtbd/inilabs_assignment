import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:inilabs_assignment/core/config/app_screen.dart';
import 'package:inilabs_assignment/core/config/app_theme.dart';
import 'package:inilabs_assignment/core/di/service_locator.dart';
import 'package:inilabs_assignment/core/services/theme_service.dart';
import 'package:inilabs_assignment/features/initial/presentation/ui/initial_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InilabsApp extends StatelessWidget {
  const InilabsApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get globalContext =>
      navigatorKey.currentContext ?? Get.context!;

  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = locate<ThemeService>();
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
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

          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeService.themeMode,
          title: 'Inilabs Assignment',
          home: InitialPage(),
        );
      },
    );
  }
}
