import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/gkeeper_list_record.dart';
//Based on the lab on local storage done in the CS3130 class
//Credit to Chriss Vessey and Andrew Godbout
class UnOpenedDBException implements Exception{}

class  GKeeperLocalListDatabase {
  static const String dbName = "localList";

  late final Box box;

  GKeeperLocalListDatabase({box}):this.box=box??Hive.box<GKeeperListRecord>(dbName){
    if(!this.box.isOpen){
      throw UnOpenedDBException();
    }
  }

  void put(List<GKeeperListRecord> lists){
    for(var i = 0; i < lists.length; i++){
      box.put(i, lists[i]);
    }
  }

  List<GKeeperListRecord> getLists() {
    List<GKeeperListRecord> lists = <GKeeperListRecord> [];
    for(var i = 0; i < box.length; i++){
      lists.add(box.get(i));
    }
    return lists;
  }

  static Future<void> init() async{
    Hive.registerAdapter(GKeeperListRecordAdpater());

    await Hive.initFlutter();
    await Hive.openBox<GKeeperListRecord>(dbName);
  }

  static Future<void> close() async{
    await Hive.close();
  }
}