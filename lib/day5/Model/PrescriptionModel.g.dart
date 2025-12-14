// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PrescriptionModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrescriptionModelAdapter extends TypeAdapter<PrescriptionModel> {
  @override
  final int typeId = 5;

  @override
  PrescriptionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrescriptionModel(
      prescriptionId: fields[0] as String,
      appointmentId: fields[1] as String,
      doctorId: fields[2] as String,
      userId: fields[3] as String,
      medicinesList: fields[4] as String,
      duration: fields[5] as String,
      notes: fields[6] as String,
      createdAt: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PrescriptionModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.prescriptionId)
      ..writeByte(1)
      ..write(obj.appointmentId)
      ..writeByte(2)
      ..write(obj.doctorId)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.medicinesList)
      ..writeByte(5)
      ..write(obj.duration)
      ..writeByte(6)
      ..write(obj.notes)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrescriptionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
