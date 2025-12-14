import 'package:hive/hive.dart';
import '../Model/PrescriptionModel.dart';

class PrescriptionRepository {
  final String boxName = "prescriptionsBox";

  Future<void> addPrescription(PrescriptionModel prescription) async {
    final box = await Hive.openBox<PrescriptionModel>(boxName);
    
    
    int index = await box.add(prescription);

    print("Prescription saved at index: $index");
    print("Total prescriptions in Hive: ${box.length}");
    print("Saved Prescription: ${box.get(index)}");
  }

  Future<List<PrescriptionModel>> getAllPrescriptions() async {
    final box = await Hive.openBox<PrescriptionModel>(boxName);
    return box.values.toList();
  }
}