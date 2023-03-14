import 'package:flutter/material.dart';
import 'package:grocery_keeper/list/view/gkeeper_list_view.dart';

import 'home/view/gkeeper_home_view.dart';


/// A MaterialApp which sets the `home` to StreakPage.
class GKeeperApp extends MaterialApp {

  GKeeperApp({Key? key}) : super(key: key,
    home: const GKeeperList(),//GKeeperHome(),
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),);
}