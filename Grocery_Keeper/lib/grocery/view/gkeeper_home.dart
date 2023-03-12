import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../grocery.dart';

class GKeeperHome extends StatefulWidget {

  const GKeeperHome({Key? key}) : super(key: key);
  @override
  State<GKeeperHome> createState() => _GKeeperHome();
}

class _GKeeperHome extends State<GKeeperHome>{

  @override
  Widget build(BuildContext context) {
    final int listNum = 10;
    final List<String> tempNames = <String>['#1','#2','#3','#4','#5','#6','#7','#8','#9','#10'];
    /// List<String> listNames = TODO: fetches names of lists from local memory

    return Scaffold(
      appbar: AppBar(
        title: Image.asset('../logo/grocery_keeper.png', fit: BoxFit.cover),
      ),
      body: ListView.builder(
        itemCount: listNum,
        itemBuilder: (BuildContext context, int index){
          return Container(
            ///TODO: fill out container to navigate to new page.
          );
        }
      ),
    );
  }
}