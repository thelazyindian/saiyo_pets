// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopter_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdopterDtoAdapter extends TypeAdapter<AdopterDto> {
  @override
  final int typeId = 1;

  @override
  AdopterDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdopterDto(
      id: fields[0] as int?,
      name: fields[1] as String?,
      adoptedAt: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AdopterDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.adoptedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdopterDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AdoptedAnimalAdapter extends TypeAdapter<AdoptedAnimal> {
  @override
  final int typeId = 2;

  @override
  AdoptedAnimal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdoptedAnimal(
      id: fields[0] as int,
      adopter: fields[1] as AdopterDto,
      animal: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AdoptedAnimal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.adopter)
      ..writeByte(2)
      ..write(obj.animal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdoptedAnimalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
