import 'package:hive/hive.dart';
import '../Model/AppointmentModel.dart';

class AppointmentRepository {
  final String boxName = "appointmentsBox";

  Future<void> addAppointment(AppointmentModel appointment) async {
    final box = await Hive.openBox<AppointmentModel>(boxName);
    await box.add(appointment);
  }

  Future<List<AppointmentModel>> getAllAppointments() async {
    final box = await Hive.openBox<AppointmentModel>(boxName);
    return box.values.toList();
  }
}
