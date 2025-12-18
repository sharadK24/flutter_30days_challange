import 'package:hive/hive.dart';
part 'ClinicModel.g.dart';

@HiveType(typeId: 6)
class ClinicModel {

  @HiveField(0)
  final String clinicId;

  @HiveField(1)
  final String clinicName;

  @HiveField(2)
  final String address;

  @HiveField(4)
  final String city;

  @HiveField(5)
  final String timings;

  @HiveField(6)
  final String services;
  @HiveField(7)
  final String contactNumber;

  @HiveField(8)
  final double rating;

  ClinicModel({
    required this.clinicId,
    required this.clinicName,
    required this.address,
    required this.city,
    required this.timings,
    required this.contactNumber,
    required this.services,
    required this.rating,
  });
}



