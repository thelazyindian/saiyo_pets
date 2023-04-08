// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OauthTokenAdapter extends TypeAdapter<OauthToken> {
  @override
  final int typeId = 0;

  @override
  OauthToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OauthToken(
      accessToken: fields[0] as String,
      tokenType: fields[1] as String,
      expiresIn: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OauthToken obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.tokenType)
      ..writeByte(2)
      ..write(obj.expiresIn)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OauthTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
