import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_keeper/home/view/gkeeper_home_view.dart';
import 'package:grocery_keeper/list/view/gkeeper_list_view.dart';
import 'package:grocery_keeper/routes/unkown_screen.dart';

import '../Search/search_page.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String listPage = '/list';
  static const String searchPage = '/search';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case homePage:
        return MaterialPageRoute(
            builder: (_) => const GKeeperHome(),
        );
      case listPage:
      return MaterialPageRoute(
        builder: (_) => const GKeeperList(),
      );
    }
    if(kDebugMode) {
      return MaterialPageRoute(builder: (context) =>  UnknownScreen());
    }
    else {
      return MaterialPageRoute(builder: (context) => const GKeeperHome());
    }
  }
}