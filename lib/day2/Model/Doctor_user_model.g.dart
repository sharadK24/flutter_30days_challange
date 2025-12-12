// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Doctor_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorusermodelAdapter extends TypeAdapter<Doctor_user_model> {
  @override
  final int typeId = 2;

  @override
  Doctor_user_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Doctor_user_model(
      doctorId: fields[0] as String,
      doctorName: fields[1] as String,
      specialization: fields[2] as String,
      doctoremail: fields[3] as String,
      clinicAddress: fields[4] as String,
      clinicCity: fields[5] as String,
      fees: fields[6] as String,
      timings: fields[7] as String,
      availableDays: fields[8] as String,
      gender: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Doctor_user_model obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.doctorId)
      ..writeByte(1)
      ..write(obj.doctorName)
      ..writeByte(2)
      ..write(obj.specialization)
      ..writeByte(3)
      ..write(obj.doctoremail)
      ..writeByte(4)
      ..write(obj.clinicAddress)
      ..writeByte(5)
      ..write(obj.clinicCity)
      ..writeByte(6)
      ..write(obj.fees)
      ..writeByte(7)
      ..write(obj.timings)
      ..writeByte(8)
      ..write(obj.availableDays)
      ..writeByte(9)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorusermodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
