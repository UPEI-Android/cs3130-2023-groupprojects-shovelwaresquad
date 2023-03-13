import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_keeper/listItem/listItem.dart';
import 'package:grocery_keeper/listItem/list_cubit.dart';

import '../cubit/gkeeper_home_cubit.dart';

class GKeeperHome extends StatefulWidget {

  const GKeeperHome({Key? key}) : super(key: key);
  @override
  State<GKeeperHome> createState() => _GKeeperHome();
}

class _GKeeperHome extends State<GKeeperHome>{

  @override
  Widget build(BuildContext context) {
    //final List<String> tempList = <String>['#1','#2','#3','#4','#5','#6','#7','#8','#9','#10'];

    return BlocBuilder<GkeeperHomeCubit, GkeeperHomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'images/grocery_keeper.png', fit: BoxFit.contain, height: 32,),
          ),
          body: BlocBuilder<ListCubit, List<ListItem>>(
            builder: (contextList, stateList) {
              //state_list.add(ListItem("Enter Title Here", []));
              if (stateList.isEmpty) {
                return const Text("No Lists Created :(", style: TextStyle(fontSize: 25));
              } else {
                return ListView.builder(
                    itemCount: stateList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () =>
                            contextList.read<GkeeperHomeCubit>()
                                .selectList(stateList[index]),
                        child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              // Alternate slight variations of white
                                color: index % 2 == 0
                                    ? const Color(0xffffffff)
                                    : const Color(0xfcfcfcfc)
                            ),
                            child: TextFormField (
                              initialValue: stateList[index].title,
                              style: const TextStyle(fontSize: 25),
                              onSaved: (text) => setState(() {
                                context.read<GkeeperHomeCubit>().changeTitle(stateList[index], text as String);
                              }),
                            )
                        ),
                      );
                    }
                );
              }
            }
          ),
          floatingActionButton: BlocBuilder<ListCubit, List<ListItem>>(
            builder: (contextList, stateList) {
              return FloatingActionButton(
                onPressed: () => setState(() {
                  contextList.read<ListCubit>().addList("Enter Title Here", ["Enter First Item"]);
                }),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              );
            }
          )
        );
      }
    );
  }
}
