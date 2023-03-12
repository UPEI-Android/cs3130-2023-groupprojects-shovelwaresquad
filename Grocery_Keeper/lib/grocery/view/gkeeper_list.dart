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
        title: Text("List Name #..."),
      ),
      //TODO BlocBuilder in the body to use bloc API
      body: ListView.builder(
        itemCount: temporaryList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(//Temporary until Tile is implemented
            //TODO Implement Tile.dart
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  <Widget>[
          FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.lightBlueAccent,
            heroTag: 'buttonRemove',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.lightBlueAccent,
            heroTag: 'buttonAdd',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}