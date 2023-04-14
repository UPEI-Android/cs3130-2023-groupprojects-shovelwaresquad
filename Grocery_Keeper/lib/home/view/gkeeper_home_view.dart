import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_keeper/list/cubit/gkeeper_local_list_cubit.dart';
import 'package:grocery_keeper/listItem/listItem.dart';
import 'package:grocery_keeper/listItem/list_cubit.dart';

import '../../routes/route_generator.dart';
import '../cubit/gkeeper_home_cubit.dart';

class GKeeperHome extends StatefulWidget {

  const GKeeperHome({Key? key}) : super(key: key);
  @override
  State<GKeeperHome> createState() => _GKeeperHome();
}

class _GKeeperHome extends State<GKeeperHome>{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GkeeperHomeCubit, GkeeperHomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'images/grocery_keeper.png', fit: BoxFit.contain, height: 32,),
          ),
          body: BlocBuilder<ListCubit, List<ListItem>>(
            builder: (contextList, stateList) {
              return BlocBuilder<GKeeperLocalListCubit, GKeeperLocalListState>(
                  builder: (contextLocal, stateLocal) {
                    if (stateLocal.lists.isEmpty) {
                      return const Center(child:
                        Text("No Lists Created", style: TextStyle(fontSize: 25))
                      );
                    } else {
                      return ListView.builder(
                        itemCount: stateLocal.lists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => setState(() {
                              ListItem item = ListItem(stateLocal.lists[index].listTitle,
                                  stateLocal.lists[index].content);
                                  stateLocal.lists[index];
                              contextList.read<GkeeperHomeCubit>()
                                    .selectList(item, index);
                              Navigator.pushNamed(
                                context,
                                RouteGenerator.listPage,
                              );
                            },
                            ),
                            child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                            // Alternate slight variations of white
                            color: index % 2 == 0 ? const Color(0xffffffff) : const Color(0xfcfcfcfc)
                            ),
                              child: Column (
                                  children: [
                                    TextFormField (
                                      initialValue: stateLocal.lists[index].listTitle,
                                      style: const TextStyle(fontSize: 25),
                                      onSaved: (text) => setState(() {
                                        context.read<GkeeperHomeCubit>().changeTitle(stateList[index], text as String);
                                      })
                                    ),
                                    const Spacer(),
                                    Text(stateLocal.lists[index].content.toString()),
                                    const Spacer()
                                  ]
                              )
                            ),
                          );
                      }
                      );
                    }
                  }
              );
            }
          ),
          floatingActionButton: BlocBuilder<ListCubit, List<ListItem>>(
            builder: (contextList, stateList) {
              return FloatingActionButton(
                onPressed: () => setState(() {
                  contextList.read<ListCubit>().addList("Enter Title Here", ["Enter First Item"]);
                  context.read<GKeeperLocalListCubit>().addList("Enter Title Here", ["Enter First Item"]);
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
