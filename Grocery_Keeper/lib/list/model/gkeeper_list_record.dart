import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'gkeeper_list_record_adapter.dart';

@HiveType(typeId: 0)
class GKeeperListRecord extends Equatable{

  String listTitle;
  final List<String> content;

  GKeeperListRecord(this.listTitle, this.content);

  @override
  List<Object?> get props => [listTitle, content];
}