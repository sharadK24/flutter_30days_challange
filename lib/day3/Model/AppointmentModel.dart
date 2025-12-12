import 'package:hive/hive.dart';
part 'AppointmentModel.g.dart';

@HiveType(typeId: 3)
class AppointmentModel {
  @HiveField(0)
  String appointmentId;

  @HiveField(1)
  String userId;

  @HiveField(2)
  String doctorId;

  @HiveField(3)
  String appointmentDate;

  @HiveField(4)
  String status;

  @HiveField(5)
  String time;

  @HiveField(6)
  String notes;

  @HiveField(7)
  String bookingTimestamp;

  AppointmentModel({
    required this.appointmentId,
    required this.userId,
    required this.doctorId,
    required this.appointmentDate,
    required this.status,
    required this.time,
    required this.notes,
    required this.bookingTimestamp,
  });
}
