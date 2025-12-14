// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClinicModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClinicModelAdapter extends TypeAdapter<ClinicModel> {
  @override
  final int typeId = 6;

  @override
  ClinicModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClinicModel(
      clinicId: fields[0] as String,
      clinicName: fields[1] as String,
      address: fields[2] as String,
      city: fields[4] as String,
      timings: fields[5] as String,
      contactNumber: fields[7] as String,
      services: fields[6] as String,
      rating: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ClinicModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.clinicId)
      ..writeByte(1)
      ..write(obj.clinicName)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.timings)
      ..writeByte(6)
      ..write(obj.services)
      ..writeByte(7)
      ..write(obj.contactNumber)
      ..writeByte(8)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClinicModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
