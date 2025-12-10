import 'package:flutter/widgets.dart';
import 'package:flutter_study/day2/Model/Doctor_user_model.dart';
import 'package:flutter_study/day2/Repository/Doctor_user_repository.dart';

class DoctorViewModel extends ChangeNotifier {
  final repo = DoctorUserRepository();

  String doctorId = "";
  String doctorName = "";
  String specialization = "";
  String doctoremail = "";
  String clinicAddress = "";
  String clinicCity = "";
  String fees = "";
  String timings = "";
  String availableDays = "";

  updateDoctorId(String v) {
    doctorId = v;
    notifyListeners();
  }

  updateDoctorName(String v) {
    doctorName = v;
    notifyListeners();
  }

  updateSpecialization(String v) {
    specialization = v;
    notifyListeners();
  }

  updateDoctoremail(String v) {
    doctoremail = v;
    notifyListeners();
  }

  updateClinicAddress(String v) {
    clinicAddress = v;
    notifyListeners();
  }

  updateClinicCity(String v) {
    clinicCity = v;
    notifyListeners();
  }

  updateFees(String v) {
    fees = v;
    notifyListeners();
  }

  updateTimings(String v) {
    timings = v;
    notifyListeners();
  }

  updateAvailableDays(String v) {
    availableDays = v;
    notifyListeners();
  }

  Future<void> saveDoctorUser() async {
    notifyListeners();

    final doctorUser = Doctor_user_model(
      doctorId: doctorId,
      doctorName: doctorName,
      specialization: specialization,
      doctoremail: doctoremail,
      clinicAddress: clinicAddress,
      clinicCity: clinicCity,
      fees: fees,
      timings: timings,
      availableDays: availableDays,
    );

    await repo.addDoctorUser(doctorUser);
    notifyListeners();
  }
}
