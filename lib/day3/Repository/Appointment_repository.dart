import 'package:hive/hive.dart';

class  Appointmentmodel {
  final String boxName = "appointmentsBox";
  Future<void> addAppointment(Appointmentmodel appointment) async {
    final box = await Hive.openBox<Appointmentmodel>(boxName);
    await box.add(appointment);
  }     

  Future<List<Appointmentmodel>> getAllAppointments() async {
    final box = await Hive.openBox<Appointmentmodel>(boxName);
    return box.values.toList();
  } 




}
