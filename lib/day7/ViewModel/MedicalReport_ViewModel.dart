import 'package:flutter/material.dart';
import 'package:flutter_study/day7/Model/MedicalReport_Model.dart';
import 'package:flutter_study/day7/Repository/MedicalReport_repository.dart';


class MedicalReportViewModel extends ChangeNotifier {
  final repo = MedicalReportRepository();

  String reportId = "";
  String userId = "";
  String doctorId = "";
  String appointmentId = "";
  String reportType = "";
  String reportUrl = "";
  DateTime uploadedDate = DateTime.now();

  updateReportId(String v) {
    reportId = v;
    notifyListeners();
  }

  updateUserId(String v) {
    userId = v;
    notifyListeners();
  }

  updateDoctorId(String v) {
    doctorId = v;
    notifyListeners();
  }

  updateAppointmentId(String v) {
    appointmentId = v;
    notifyListeners();
  }

  updateReportType(String v) {
    reportType = v;
    notifyListeners();
  }

  updateReportUrl(String v) {
    reportUrl = v;
    notifyListeners();
  }

  updateUploadedDate(DateTime v) {
    uploadedDate = v;
    notifyListeners();
  }

  Future<void> addMedicalReport() async {
    final report = MedicalReport(
      reportId: reportId,
      userId: userId,
      doctorId: doctorId,
      appointmentId: appointmentId,
      reportType: reportType,
      reportUrl: reportUrl,
      uploadedDate: uploadedDate,
    );
    await repo.addMedicalReport(report);
  }
}
