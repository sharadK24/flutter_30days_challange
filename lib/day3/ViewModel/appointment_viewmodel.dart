import 'package:flutter/widgets.dart';
import 'package:flutter_study/day3/Repository/Appointment_repository.dart';
import 'package:flutter_study/day3/Model/AppointmentModel.dart';

class AppointmentViewModel extends ChangeNotifier {

  final  repo = AppointmentRepository();

  String appointmentId = "";
  String userId = "";
  String doctorId = "";
  String appointmentDate = "";
  String status = "";
  String time = "";
  String notes = "";
  String bookingTimestamp = "";

  updateAppointmentId(String v) {
    appointmentId = v;
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

  updateAppointmentDate(String v) {
    appointmentDate = v;
    notifyListeners();
  }

  updateStatus(String v) {
    status = v;
    notifyListeners();
  }

  updateTime(String v) {
    time = v;
    notifyListeners();
  }

  updateNotes(String v) {
    notes = v;
    notifyListeners();
  }

  updateBookingTimestamp(String v) {
    bookingTimestamp = v;
    notifyListeners();
  }

  Future<void> addAppointment() async {

    final appointment = AppointmentModel(
      appointmentId: appointmentId,
      userId: userId,
      doctorId: doctorId,
      appointmentDate: appointmentDate,
      status: status,
      time: time,
      notes: notes,
      bookingTimestamp: bookingTimestamp,
    );

    await repo.addAppointment(appointment);
    notifyListeners();
  }
}
 