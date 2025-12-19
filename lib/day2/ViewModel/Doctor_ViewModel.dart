import 'package:flutter/cupertino.dart';
import '../Model/Doctor_user_model.dart';
import '../Repository/Doctor_user_repository.dart';

class DoctorViewModel extends ChangeNotifier {
  final DoctorUserRepository repo = DoctorUserRepository();

  String doctorId = "";
  String doctorName = "";
  String specialization = "";
  String doctorEmail = "";
  String clinicAddress = "";
  String clinicCity = "";
  String fees = "";
  String timings = "";
  String availableDays = "";
  String gender = "";

  List<Doctor_user_model> doctors = [];

  void updateDoctorId(String v) => doctorId = v;
  void updateDoctorName(String v) => doctorName = v;
  void updateSpecialization(String v) => specialization = v;
  void updateDoctorEmail(String v) => doctorEmail = v;
  void updateClinicAddress(String v) => clinicAddress = v;
  void updateClinicCity(String v) => clinicCity = v;
  void updateFees(String v) => fees = v;
  void updateTimings(String v) => timings = v;
  void updateAvailableDays(String v) => availableDays = v;
  void updateGender(String v) => gender = v;

  Future<void> saveDoctor() async {
    final doctor = Doctor_user_model(
      doctorId: doctorId,
      doctorName: doctorName,
      specialization: specialization,
      doctorEmail: doctorEmail,
      clinicAddress: clinicAddress,
      clinicCity: clinicCity,
      fees: fees,
      timings: timings,
      availableDays: availableDays,
      gender: gender,
    );
    await repo.addDoctorUser(doctor);
    await fetchDoctors();
  }
  Future<void> fetchDoctors() async {
    doctors = await repo.getAllDoctorUsers();
    notifyListeners();
  }
}
