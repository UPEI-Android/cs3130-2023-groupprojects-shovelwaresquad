import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_keeper/listObserver.dart';

import 'app.dart';
import 'home/cubit/gkeeper_home_cubit.dart';
import 'listItem/listItem.dart';
import 'listItem/list_cubit.dart';

void main() {
  //runApp(GKeeperApp());
 BlocOverrides.runZoned(
        () => runApp( MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ListCubit>(
          create: (_)=>ListCubit(<ListItem>[]),
        ),
        BlocProvider<GkeeperHomeCubit>(
            create: (_)=>GkeeperHomeCubit(),
        )
      ],
      child: GKeeperApp(),
    )),
    blocObserver: ListObserver(),
  );
}
