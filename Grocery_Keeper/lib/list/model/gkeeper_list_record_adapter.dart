part of 'gkeeper_list_record.dart';

//Based on the lab on local storage done in the CS3130 class
//Credit to Chriss Vessey and Andrew Godbout
class GKeeperListRecordAdpater extends TypeAdapter<GKeeperListRecord>{

  @override
  GKeeperListRecord read(BinaryReader reader) {
    var numFields = reader.readByte();

    var fields = <int, dynamic>{
      for(var i = 0; i < numFields; i++)
        reader.readByte(): reader.read(),
    };

    return GKeeperListRecord(
        fields[0] as String,
        fields[1] as List<String>
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, GKeeperListRecord obj) {
    //gkeeper list records has:
    //field 0: String listTitle,
    //field 1: List<String> contents

    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.listTitle)
      ..writeByte(1)
      ..write(obj.content);
  }
}