import 'package:hive/hive.dart';
import 'package:flutter_study/day2/Model/Doctor_user_model.dart';

class DoctorUserRepository {
  final String boxName = "doctorUsersBox";

  Future<void> addDoctorUser(Doctor_user_model doctorUser) async {
    final box = await Hive.openBox<Doctor_user_model>(boxName);

    // Add data
    int index = await box.add(doctorUser);

    // Print logs
    print("Doctor saved at index: $index");
    print("Total doctors in Hive: ${box.length}");
    print("Saved Doctor: ${box.get(index)}");
  }

  Future<List<Doctor_user_model>> getAllDoctorUsers() async {
    final box = await Hive.openBox<Doctor_user_model>(boxName);
    return box.values.toList();
  }
}
