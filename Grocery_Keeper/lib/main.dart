import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_keeper/list/cubit/gkeeper_local_list_cubit.dart';
import 'package:grocery_keeper/list/database/gkeeper_local_list_database.dart';
import 'package:grocery_keeper/listObserver.dart';

import 'app.dart';
import 'home/cubit/gkeeper_home_cubit.dart';
import 'listItem/listItem.dart';
import 'listItem/list_cubit.dart';

void main() async{

  await GKeeperLocalListDatabase.init();

  //runApp(GKeeperApp());
 BlocOverrides.runZoned(
        () => runApp( MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ListCubit>(
          create: (_)=>ListCubit(<ListItem>[]),
        ),
        BlocProvider<GkeeperHomeCubit>(
            create: (_)=>GkeeperHomeCubit(),
        ),
        BlocProvider<GKeeperLocalListCubit>(
            create: (_)=>GKeeperLocalListCubit(GKeeperLocalListDatabase()),
        ),
      ],
      child: GKeeperApp(),
    )),
    blocObserver: ListObserver(),
  );
}
