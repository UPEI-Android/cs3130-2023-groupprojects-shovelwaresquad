import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_keeper/list/cubit/gkeeper_local_list_cubit.dart';

import '../../Search/search_page.dart';
import '../../home/cubit/gkeeper_home_cubit.dart';
import '../../listItem/listItem.dart';
import '../../routes/route_generator.dart';

class GKeeperList extends StatefulWidget {

  const GKeeperList({Key? key}) : super(key: key);
  @override
  State<GKeeperList> createState() => _GKeeperList();


}

class _GKeeperList extends State<GKeeperList>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GkeeperHomeCubit, GkeeperHomeState>(
    builder: (context, state) {
      return BlocBuilder<GKeeperLocalListCubit, GKeeperLocalListState>(
        builder: (contextLocal1, stateLocal1){
          var lState = state as GKeeperListSelected;
          int number = lState.num;
          ListItem list = lState.list;
          String tempItemName = "";
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              centerTitle: true,
              title: Text(list.title),
            ),
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
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter the item to add here',
                                        labelText: 'Item',
                                      ),
                                      onChanged: (text) {
                                        tempItemName = text;
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => SearchPage(
                                                  passedString: tempItemName,
                                                ),
                                              ));
                                          /*setState(() {
                                            context.read<GkeeperHomeCubit>()
                                                .selectItem(tempItemName, lState.num);
                                        });*/
                                      },
                                      child: const Text('Search'),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    padding: const EdgeInsets.all(8),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          contextLocal1.read<GKeeperLocalListCubit>().updateList(tempItemName, number);
                                        });
                                        Navigator.pop(context);
                                      },
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
                  backgroundColor: Theme.of(context).backgroundColor,
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
                                          onTap: () {
                                            setState(() {
                                              list.contents.removeAt(index);
                                              contextLocal1.read<GKeeperLocalListCubit>().deleteItem(tempItemName, number);
                                            });
                                          },
                                        ),
                                      );
                                    }
                                ),
                              )

                          );
                        }

                    );
                  },
                  backgroundColor: Theme.of(context).backgroundColor,
                  heroTag: 'buttonRemove',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        }
      );
    });
  }
}