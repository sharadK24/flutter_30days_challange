import 'package:flutter/material.dart';
import 'package:flutter_study/day7/Model/MedicalReport_Model.dart';
import 'package:flutter_study/day7/Repository/MedicalReport_repository.dart';

class MedicalReportRegistration extends StatefulWidget {
  const MedicalReportRegistration({super.key});

  @override
  State<MedicalReportRegistration> createState() => _MedicalReportRegistrationState();
}
class _MedicalReportRegistrationState extends State<MedicalReportRegistration> {
  final MedicalReportRepository repo = MedicalReportRepository();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController reportId = TextEditingController();
  final TextEditingController userId = TextEditingController();
  final TextEditingController doctorId = TextEditingController();
  final TextEditingController appointmentId = TextEditingController();
  final TextEditingController reportType = TextEditingController();
  final TextEditingController reportUrl = TextEditingController();
  final TextEditingController uploadedDate = TextEditingController();

  Future<void> registerMedicalReport() async {
    if (_formKey.currentState!.validate()) {
      final report = MedicalReport(
        reportId: reportId.text,
        userId: userId.text,
        doctorId: doctorId.text,
        appointmentId: appointmentId.text,
        reportType: reportType.text,
        reportUrl: reportUrl.text,
        uploadedDate: DateTime.parse(uploadedDate.text),
      );
      await repo.addMedicalReport(report);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Medical Report Registered Successfully!"),
          backgroundColor: Colors.green,
        ),
      );
      _formKey.currentState!.reset();
    }
  }
  Widget buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Report Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("Report ID", reportId),
              buildTextField("User ID", userId),
              buildTextField("Doctor ID", doctorId),
              buildTextField("Appointment ID", appointmentId),
              buildTextField("Report Type", reportType),
              buildTextField("Report URL", reportUrl),
              buildTextField("Uploaded Date (YYYY-MM-DD)", uploadedDate, type: TextInputType.datetime),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerMedicalReport,
                child: const Text("Register Medical Report"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}