
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_keeper/list/database/gkeeper_local_list_database.dart';
import 'package:grocery_keeper/list/model/gkeeper_list_record.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

class MockHiveBox extends Mock implements Box{}

//The following testing is based on Lab 7 of CS 3130
//Authors Chris Vessey and Andrew Godbout
void main(){

  late Box box;
  late GKeeperLocalListDatabase db;

  setUp((){
    box = MockHiveBox();
  });
  
  test("Create a local database", () async{
    when(()=>box.isOpen).thenReturn(true);
    expect(GKeeperLocalListDatabase(box:box), isNotNull);
  });
  
  test("Constructor checks if the box is open", () async{
    when(()=>box.isOpen).thenReturn(true);

    db = GKeeperLocalListDatabase(box: box);

    verify (()=>box.isOpen).called(isPositive);
  });

  test("Constructor throws an exception if the box is not open", (){
    when(()=>box.isOpen).thenReturn(false);
    expect(()=>GKeeperLocalListDatabase(box:box), throwsA(isA<UnOpenedDBException>()), reason: "expected to throw");
  });

  test("db.put calls box.put never called for empty list", () {
    when(()=>box.isOpen).thenReturn(true);
    when(()=>box.put(any(), any())).thenAnswer((_) async=> {});

    List<GKeeperListRecord> lists = <GKeeperListRecord>[];
    db = GKeeperLocalListDatabase(box:box);
    db.put(lists);
    verifyNever(()=>box.put(any(),any()));
  });
  
  test("db.put calls box.put an x amount of times for x number of records", () {
    when( ()=>box.isOpen).thenReturn(true);
    when( ()=>box.put(any(), any())).thenAnswer( (_) async =>{} );
    List<GKeeperListRecord> lists = <GKeeperListRecord>[
      GKeeperListRecord("A", ["a"]),
      GKeeperListRecord("B", ["b"]),
      GKeeperListRecord("C", ["c"]),
    ];
    db = GKeeperLocalListDatabase(box:box);
    db.put(lists);
    verify(()=>box.put(any(), any())).called(lists.length);
  });

  test("db.put calls box.put with a 0 and a GKeeperListRecord for the first record", (){
    when(()=>box.isOpen).thenReturn(true);
    when(()=>box.put(any(), any())).thenAnswer((_) async=> {});

    GKeeperListRecord listA = GKeeperListRecord("A", ["a"]);
    List<GKeeperListRecord> lists = <GKeeperListRecord>[
      listA
    ];
    db = GKeeperLocalListDatabase(box:box);
    db.put(lists);
    verify(()=>box.put(0, listA)).called(1);
  });
  
  test("db.put does not change the order of the lis when box.put is called", () {
    when(()=>box.isOpen).thenReturn(true);
    when(()=>box.put(any(), any())).thenAnswer((_) async=> {});
    List<GKeeperListRecord> lists = <GKeeperListRecord>[
      GKeeperListRecord("A", ["a"]),
      GKeeperListRecord("B", ["b"]),
      GKeeperListRecord("C", ["c"]),
    ];
    db = GKeeperLocalListDatabase(box:box);
    db.put(lists);
    for(var i = 0; i < lists.length; i++){
      verify(()=>box.put(i, lists[i])).called(1);
    }
  });

  test('If box.get returns an empty list, then db.getLists also returns an empty list', (){
    when(()=>box.isOpen).thenReturn(true);
    when(()=>box.length).thenReturn(0);
    when(()=>box.get(any())).thenReturn(null);
    db=GKeeperLocalListDatabase(box:box);
    List<GKeeperListRecord> lists = db.getLists();
    expect(lists.length, equals(0));
  });
  
  test("db.getLists calls box.get for each of box.length items", () {
    when(()=>box.isOpen).thenReturn(true);
    when( ()=>box.length).thenReturn(3);
    when( ()=>box.get(any())).thenReturn(GKeeperListRecord("A", ["a"]));
    db = GKeeperLocalListDatabase(box:box);
    List<GKeeperListRecord> lists = db.getLists();
    verify(()=>box.get(any())).called(3);
  });
  
  test("db.getLeaders does not alter the order from box.get", () {
    when(()=>box.isOpen).thenReturn(true);
    when( ()=>box.length).thenReturn(3);
    when( ()=>box.get(0)).thenReturn(GKeeperListRecord("A", ["a"]));
    when( ()=>box.get(1)).thenReturn(GKeeperListRecord("B", ["b"]));
    when( ()=>box.get(2)).thenReturn(GKeeperListRecord("C", ["c"]));
    db = GKeeperLocalListDatabase(box:box);
    List<GKeeperListRecord> lists = db.getLists();

    expect(lists[0].listTitle, equals("A"));
    expect(lists[1].listTitle, equals("B"));
    expect(lists[2].listTitle, equals("C"));

  });
}