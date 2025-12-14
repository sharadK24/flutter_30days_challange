import 'package:flutter/widgets.dart';
import 'package:flutter_study/day6/Repository/Clinic_Repository.dart';
import 'package:flutter_study/day6/Model/ClinicModel.dart';
class ClinicViewModel extends ChangeNotifier {
  final repo = ClinicRepository();

  String clinicId = "";
  String clinicName = "";
  String address = "";
  String city = "";
  String timings = "";
  String services = "";
  String contactNumber = "";
  double rating = 0.0;

  updateClinicId(String v) {
    clinicId = v;
    notifyListeners();
  }

  updateClinicName(String v) {
    clinicName = v;
    notifyListeners();
  }

  updateAddress(String v) {
    address = v;
    notifyListeners();
  }

  updateCity(String v) {
    city = v;
    notifyListeners();
  }

  updateTimings(String v) {
    timings = v;
    notifyListeners();
  }

  updateServices(String v) {
    services = v;
    notifyListeners();
  }

  updateContactNumber(String v) {
    contactNumber = v;
    notifyListeners();
  }

  updateRating(double v) {
    rating = v;
    notifyListeners();
  }

  Future<void> addClinic() async {
    final clinic = ClinicModel(
      clinicId: clinicId,
      clinicName: clinicName,
      address: address,
      city: city,
      timings: timings,
      services: services,
      contactNumber: contactNumber,
      rating: rating,
    );
    await repo.addClinic(clinic);
  }
}