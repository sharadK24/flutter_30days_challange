// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MedicalReport_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicalReportAdapter extends TypeAdapter<MedicalReport> {
  @override
  final int typeId = 6;

  @override
  MedicalReport read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicalReport(
      reportId: fields[0] as String,
      userId: fields[1] as String,
      doctorId: fields[2] as String,
      appointmentId: fields[3] as String,
      reportType: fields[4] as String,
      reportUrl: fields[5] as String,
      uploadedDate: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MedicalReport obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.reportId)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.doctorId)
      ..writeByte(3)
      ..write(obj.appointmentId)
      ..writeByte(4)
      ..write(obj.reportType)
      ..writeByte(5)
      ..write(obj.reportUrl)
      ..writeByte(6)
      ..write(obj.uploadedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalReportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
