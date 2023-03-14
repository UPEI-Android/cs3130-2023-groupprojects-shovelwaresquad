import 'package:bloc/bloc.dart';
import 'package:grocery_keeper/listItem/listItem.dart';

/// {@template streak_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class ListCubit extends Cubit<List<ListItem>> {
  /// {@macro counter_cubit}
  ListCubit(List<ListItem> initList) : super(initList);

  /// Add 1 to the current state.
  void addList(String title, List<String> contents) {
    state.add(ListItem(title, contents));
    emit(state);
  }

  void addToList(ListItem list, String entry) {
    list.contents.add(entry);
  }

  void removeFromList(ListItem list, int index) {
    list.contents.removeAt(index);
  }
}