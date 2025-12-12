import 'package:flutter/widgets.dart';
import 'package:flutter_study/day2/Model/Doctor_user_model.dart';
import 'package:flutter_study/day2/Repository/Doctor_user_repository.dart';

class DoctorViewModel extends ChangeNotifier {
  //Doctor डेटा सेव्ह करण्यासाठी
  final repo = DoctorUserRepository();


//हे सर्व व्हेरीएबल्स UI मधून युजर जे values भरतो ते ठेवतात.
  String doctorId = "";
  String doctorName = "";
  String specialization = "";
  String doctoremail = "";
  String clinicAddress = "";
  String clinicCity = "";
  String fees = "";
  String timings = "";
  String availableDays = "";
  String gender = "";


//doctorId ला नवीन value सेट करते
  updateDoctorId(String v) {
    doctorId = v;
    notifyListeners();
    //notifyListeners() UI ला सांगते की डेटा बदलला आहे → UI अपडेट होतो
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

  updDateGender(String v) {
    gender = v;
    notifyListeners();
  }

//सुरुवातीला UI ला सांगते की "काहीतरी process सुरू आहे
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
      gender: gender,
      //object तयार केली जाते.
    );

    await repo.addDoctorUser(doctorUser);
    notifyListeners();
  }
}
