import 'package:hive/hive.dart';
import '../Model/Doctor_user_model.dart';

class DoctorUserRepository {
  final String boxName = "doctorUsersBox";

  Future<void> addDoctorUser(Doctor_user_model doctorUser) async {
    final box = await Hive.openBox<Doctor_user_model>(boxName);
    await box.add(doctorUser);
  }

  Future<List<Doctor_user_model>> getAllDoctorUsers() async {
    final box = await Hive.openBox<Doctor_user_model>(boxName);
    return box.values.toList();
  }
}
