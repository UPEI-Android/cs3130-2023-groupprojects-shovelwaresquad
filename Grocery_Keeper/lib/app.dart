import 'package:flutter/material.dart';
import 'package:grocery_keeper/routes/route_generator.dart';


/// A MaterialApp which sets the `home` to StreakPage.
class GKeeperApp extends MaterialApp {
  GKeeperApp({Key? key}) : super(key: key,
    initialRoute:  RouteGenerator.homePage,
    onGenerateRoute: RouteGenerator.generateRoute,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  );
}