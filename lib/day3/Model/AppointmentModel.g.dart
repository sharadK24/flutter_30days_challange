// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppointmentModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentModelAdapter extends TypeAdapter<AppointmentModel> {
  @override
  final int typeId = 3;

  @override
  AppointmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentModel(
      appointmentId: fields[0] as String,
      userId: fields[1] as String,
      doctorId: fields[2] as String,
      appointmentDate: fields[3] as String,
      status: fields[4] as String,
      time: fields[5] as String,
      notes: fields[6] as String,
      bookingTimestamp: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.appointmentId)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.doctorId)
      ..writeByte(3)
      ..write(obj.appointmentDate)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.bookingTimestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
