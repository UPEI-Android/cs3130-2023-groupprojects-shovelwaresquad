import 'package:flutter/material.dart';
import 'package:grocery_keeper/routes/route_generator.dart';
import 'package:grocery_keeper/theme/custom_theme_app.dart';


/// A MaterialApp which sets the `home` to StreakPage.
class GKeeperApp extends MaterialApp {
  GKeeperApp({Key? key}) : super(key: key,
    initialRoute:  RouteGenerator.homePage,
    onGenerateRoute: RouteGenerator.generateRoute,
    themeMode: ThemeMode.system,
    theme: CustomThemeApp.lightTheme,
    darkTheme: CustomThemeApp.darkTheme,
  );
}