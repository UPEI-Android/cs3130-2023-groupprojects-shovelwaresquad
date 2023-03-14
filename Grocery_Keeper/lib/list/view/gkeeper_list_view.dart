import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/cubit/gkeeper_home_cubit.dart';
import '../../listItem/listItem.dart';

class GKeeperList extends StatefulWidget {

  const GKeeperList({Key? key}) : super(key: key);
  @override
  State<GKeeperList> createState() => _GKeeperList();


}

class _GKeeperList extends State<GKeeperList>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GkeeperHomeCubit, GkeeperHomeState>(
    builder: (context, state)
    {
      var lState = state as GKeeperListSelected;
      ListItem list = lState.list;
      //final List<String> temporaryList = <String>['A', 'B', 'C'];
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("List Name #..."),
        ),
        //TODO BlocBuilder in the body to use bloc API
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: list.contents.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Text(list.contents[index]),
            );
          },
        ),
        //TODO Navigation
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        contentPadding: const EdgeInsets.only(
                            top: 10.0
                        ),
                        title: const Text(
                          "Add Item",
                          textAlign: TextAlign.center,
                        ),
                        content: Container(
                          height: 225,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter the item to add here',
                                    labelText: 'Item',
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                padding: const EdgeInsets.all(8),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Search'),
                                ),
                              ),
                              Container(
                                height: 60,
                                padding: const EdgeInsets.all(8),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Add'),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                );
              },
              backgroundColor: Colors.lightBlueAccent,
              heroTag: 'buttonAdd',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          actionsAlignment: MainAxisAlignment.center,
                          contentPadding: const EdgeInsets.only(
                              top: 10.0
                          ),
                          title: const Text(
                            'Remove Item',
                            textAlign: TextAlign.center,
                          ),
                          content: Container(
                            height: 300,
                            width: 300,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: list.contents.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: ListTile(
                                      title: Text(list.contents[index]),
                                      onTap: () {},
                                    ),
                                  );
                                }
                            ),
                          )

                      );
                    }

                );
              },
              backgroundColor: Colors.lightBlueAccent,
              heroTag: 'buttonRemove',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      );
    });
  }
}