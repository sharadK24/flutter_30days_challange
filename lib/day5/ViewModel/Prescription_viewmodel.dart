import 'package:flutter/widgets.dart';
import 'package:flutter_study/day5/Repository/Prescription_repository.dart';
import 'package:flutter_study/day5/Model/PrescriptionModel.dart';

class PrescriptionViewModel extends ChangeNotifier {
  final repo = PrescriptionRepository();

  String prescriptionId = "";
  String appointmentId = "";
  String doctorId = "";
  String userId = "";
  String medicinesList = "";
  String duration = "";
  String notes = "";
  String createdAt = "";

  updatePrescriptionId(String v) {
    prescriptionId = v;
    notifyListeners();
  }

  updateAppointmentId(String v) {
    appointmentId = v;
    notifyListeners();
  }

  updateDoctorId(String v) {
    doctorId = v;
    notifyListeners();
  }

  updateUserId(String v) {
    userId = v;
    notifyListeners();
  }

  updateMedicinesList(String v) {
    medicinesList = v;
    notifyListeners();
  }

  updateDuration(String v) {
    duration = v;
    notifyListeners();
  }

  updateNotes(String v) {
    notes = v;
    notifyListeners();
  }

  updateCreatedAt(String v) {
    createdAt = v;
    notifyListeners();
  }

  Future<void> addPrescription() async {
    final prescription = PrescriptionModel(
      prescriptionId: prescriptionId,
      appointmentId: appointmentId,
      doctorId: doctorId,
      userId: userId,
      medicinesList: medicinesList,
      duration: duration,
      notes: notes,
      createdAt: createdAt,
    );
    await repo.addPrescription(prescription);
  }
}