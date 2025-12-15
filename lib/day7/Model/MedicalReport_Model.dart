import 'package:hive/hive.dart';
part 'MedicalReport_Model.g.dart';

@HiveType(typeId: 6)
class MedicalReport {
  @HiveField(0)
  String reportId;

  @HiveField(1)
  String userId;

  @HiveField(2)
  String doctorId;

  @HiveField(3)
  String appointmentId;

  @HiveField(4)
  String reportType;

  @HiveField(5)
  String reportUrl;

  @HiveField(6)
  DateTime uploadedDate;

  MedicalReport({
    required this.reportId,
    required this.userId,
    required this.doctorId,
    required this.appointmentId,
    required this.reportType,
    required this.reportUrl,
    required this.uploadedDate,
  });
}





