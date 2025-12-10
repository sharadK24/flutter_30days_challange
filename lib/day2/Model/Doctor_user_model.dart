import 'package:hive/hive.dart';
part 'Doctor_user_model.g.dart';

@HiveType(typeId: 2)
class Doctor_user_model {
  @HiveField(0)
  String doctorId;

  @HiveField(1)
  String doctorName;

  @HiveField(2)
  String specialization;

  @HiveField(3)
  String doctoremail;

  @HiveField(4)
  String clinicAddress;

  @HiveField(5)
  String clinicCity;

  @ HiveField(6)
  String fees;

  @HiveField(7)
  String timings;
 
  @HiveField(8)
  String availableDays;


  Doctor_user_model({
    required this.doctorId,
    required this.doctorName,
    required this.specialization,
    required this.doctoremail,
    required this.clinicAddress,
    required this.clinicCity,
    required this.fees,
    required this.timings,
    required this.availableDays,
  });

}
