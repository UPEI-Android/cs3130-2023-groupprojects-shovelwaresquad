import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../listItem/listItem.dart';

part 'gkeeper_home_state.dart';

class GkeeperHomeCubit extends Cubit<GkeeperHomeState> {
  GkeeperHomeCubit() : super(const GkeeperHomeInitial());

  void selectList(ListItem list) {
    print("Wow! I've been tapped! I am item ${list.title}");
    emit(GKeeperListSelected(list));
  }

  void changeTitle(ListItem list, String str) {
    list.title = str;
    emit(const GkeeperHomeInitial());
  }

  void selectItem(String entry) {
    emit(GKeeperItemSelected(entry));
  }
}
