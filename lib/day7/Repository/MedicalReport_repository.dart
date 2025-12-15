import 'package:hive/hive.dart';
import '../Model/MedicalReport_Model.dart';
class MedicalReportRepository {
  final String boxName = "medicalReportsBox";

  Future<void> addMedicalReport(MedicalReport report) async {
    final box = await Hive.openBox<MedicalReport>(boxName);
    
    int index = await box.add(report);

    print("Medical Report saved at index: $index");
    print("Total medical reports in Hive: ${box.length}");
    print("Saved Medical Report: ${box.get(index)}");
  }

  Future<List<MedicalReport>> getAllMedicalReports() async {
    final box = await Hive.openBox<MedicalReport>(boxName);
    return box.values.toList();
  }
}

