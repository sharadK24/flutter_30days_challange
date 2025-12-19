import 'package:flutter/material.dart';
import 'package:flutter_study/day3/Model/AppointmentModel.dart';
import 'package:flutter_study/day3/Repository/Appointment_repository.dart';

class AppointmentViewModel extends ChangeNotifier {
  final AppointmentRepository repo = AppointmentRepository();

  String appointmentId = "";
  String userId = "";
  String doctorId = "";
  String appointmentDate = "";
  String status = "";
  String time = "";
  String notes = "";



  List<AppointmentModel> Appo = [];
  void updateAppointmentId(String v) {
    appointmentId = v;
  }

  void updateUserId(String v) {
    userId = v;
  }

  void updateDoctorId(String v) {
    doctorId = v;
  }

  void updateAppointmentDate(String v) {
    appointmentDate = v;
  }

  void updateStatus(String v) {
    status = v;
  }

  void updateTime(String v) {
    time = v;
  }

  void updateNotes(String v) {
    notes = v;
  }

  void updateBookingTimestamp(String v) {

  }

  // 🔹 SAVE (UserViewModel → saveUser सारखं)
  Future<void> addAppointment() async {
    final appointment = AppointmentModel(
      appointmentId: appointmentId,
      userId: userId,
      doctorId: doctorId,
      appointmentDate: appointmentDate,
      status: status,
      time: time,
      notes: notes, bookingTimestamp: 'bookingTimestamp',
    );

    await repo.addAppointment(appointment);
    await fetchAppointments(); // 🔥 important
  }

  Future<void> fetchAppointments() async {
    Appo = await repo.getAllAppointments();
    notifyListeners();
  }
}
