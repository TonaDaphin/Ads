// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryClassAdapter extends TypeAdapter<CategoryClass> {
  @override
  final int typeId = 1;

  @override
  CategoryClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryClass(
      fields[1] as String,
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryClass obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
