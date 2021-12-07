// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllDetailsAdapter extends TypeAdapter<AllDetails> {
  @override
  final int typeId = 0;

  @override
  AllDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllDetails(
      name: fields[1] as String,
      age: fields[2] as String,
      rollNumber: fields[3] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AllDetails obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.rollNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
