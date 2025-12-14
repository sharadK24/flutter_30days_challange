import 'package:hive/hive.dart';
import '../Model/ClinicModel.dart';

class ClinicRepository {
  final String boxName = "clinicsBox";

  Future<void> addClinic(ClinicModel clinic) async {
    final box = await Hive.openBox<ClinicModel>(boxName);
    
    
    int index = await box.add(clinic);

    print("Clinic saved at index: $index");
    print("Total clinics in Hive: ${box.length}");
    print("Saved Clinic: ${box.get(index)}");
  }

  Future<List<ClinicModel>> getAllClinics() async {
    final box = await Hive.openBox<ClinicModel>(boxName);
    return box.values.toList();
  }
} 