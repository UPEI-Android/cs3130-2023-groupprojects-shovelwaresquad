import 'package:flutter/material.dart';

import 'home/view/gkeeper_home_view.dart';


/// A MaterialApp which sets the `home` to StreakPage.
class GKeeperApp extends MaterialApp {

  GKeeperApp({Key? key}) : super(key: key,
    home: const GKeeperHome(),
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),);
}