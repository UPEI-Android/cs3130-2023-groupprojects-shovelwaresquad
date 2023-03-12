import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_keeper/grocery/grocery.dart';

class GKeeperList extends StatefulWidget {

  const GKeeperList({Key? key}) : super(key: key);
  @override
  State<GKeeperList> createState() => _GKeeperList();


}

class _GKeeperList extends State<GKeeperList>{
  @override
  Widget build(BuildContext context) {
    //TODO receives the List
    final List<String> temporaryList = <String>['A', 'B', 'C'];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("List Name"),
      ), 
        /*TODO Bloc Builder goes here,
        */
      body: ListView.builder(
        itemCount: temporaryList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(//Temporary until Tile is implemented
            //TODO Implement Tile.dart
          );
        },
      ),

    );
  }
}