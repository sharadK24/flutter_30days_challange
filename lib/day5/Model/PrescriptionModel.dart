import 'package:hive/hive.dart';
part 'PrescriptionModel.g.dart';

@HiveType(typeId: 5)
class PrescriptionModel {

  @HiveField(0)
  final String prescriptionId;

  @HiveField(1)
  final String appointmentId;

  @HiveField(2)
  final String doctorId;

  @HiveField(3)
  final String userId;                                                                   
  @HiveField(4)
  final String medicinesList;

  @HiveField(5)
  final String duration;

  @HiveField(6)
  final String  notes;

  @HiveField(7)
  final String createdAt;

  PrescriptionModel({
    required this.prescriptionId,
    required this.appointmentId,
    required this.doctorId,
    required this.userId,
    required this.medicinesList,
    required this.duration,
    required this.notes,
    required this.createdAt,
  });

  
}
