import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_keeper/listItem/listItem.dart';
import '../model/gkeeper_list_record.dart';
import '../database/gkeeper_local_list_database.dart';

part 'gkeeper_local_list_state.dart';
//Based on the lab on local storage done in the CS3130 class
//Credit to Chriss Vessey and Andrew Godbout
class GKeeperLocalListCubit extends Cubit<GKeeperLocalListState> {

  GKeeperLocalListDatabase db;

  GKeeperLocalListCubit(this.db) : super(GKeeperLocalListState()){
    _fetchLists();
  }

  Future<void> _fetchLists() async {
    emit(state.copyWith(status: ListStatus.loading));
    List<GKeeperListRecord> lists = db.getLists();

    emit(state.copyWith(status: ListStatus.loaded, lists: lists));
  }

  void addList(String title, List<String> items){
    List<GKeeperListRecord> lists = []..addAll(state.lists);
    lists.add(GKeeperListRecord(title, items));

    emit(state.copyWith(lists: lists));

    db.put(lists);
  }

  void removeList(int index){
    List<GKeeperListRecord> lists = []..addAll(state.lists);

    lists.removeAt(index);
    db.box.clear();
    emit(state.copyWith(lists: lists));

    db.put(lists);
  }

  void updateList(String item,int index){
    List<GKeeperListRecord> lists = []..addAll(state.lists);

    lists[index].content.add(item);

    emit(state.copyWith(lists: lists));

    db.put(lists);
  }

  void deleteItem(String item, int index){
    List<GKeeperListRecord> lists = []..addAll(state.lists);

    lists[index].content.remove(item);

    emit(state.copyWith(lists: lists));

    db.put(lists);
  }

  void changeLocalTitle(String title, List<String> content, int index) {
    List<GKeeperListRecord> lists = []..addAll(state.lists);

    GKeeperListRecord list = GKeeperListRecord(title, content);
    lists[index] = list;

    emit(state.copyWith(lists: lists));

    db.put(lists);
  }

}
