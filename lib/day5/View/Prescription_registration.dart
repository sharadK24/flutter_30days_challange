import 'package:flutter/material.dart';
import 'package:flutter_study/day5/Model/PrescriptionModel.dart';
import 'package:flutter_study/day5/Repository/Prescription_repository.dart';
class PrescriptionRegistration extends StatefulWidget {
  const PrescriptionRegistration({super.key});

  @override
  State<PrescriptionRegistration> createState() => _PrescriptionRegistrationState();
}
class _PrescriptionRegistrationState extends State<PrescriptionRegistration> {
  final PrescriptionRepository repo = PrescriptionRepository();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController prescriptionId = TextEditingController();
  final TextEditingController appointmentId = TextEditingController();
  final TextEditingController doctorId = TextEditingController();
  final TextEditingController userId = TextEditingController();
  final TextEditingController medicinesList = TextEditingController();
  final TextEditingController duration = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController createdAt = TextEditingController();

  Future<void> registerPrescription() async {
    if (_formKey.currentState!.validate()) {
      final prescription = PrescriptionModel(
        prescriptionId: prescriptionId.text,
        appointmentId: appointmentId.text,
        doctorId: doctorId.text,
        userId: userId.text,
        medicinesList: medicinesList.text,
        duration: duration.text,
        notes: notes.text,
        createdAt: createdAt.text,
      );
      await repo.addPrescription(prescription);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Prescription Registered Successfully!"),
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
        title: const Text("Prescription Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("Prescription ID", prescriptionId),
              buildTextField("Appointment ID", appointmentId),
              buildTextField("Doctor ID", doctorId),
              buildTextField("User ID", userId),
              buildTextField("Medicines List", medicinesList),
              buildTextField("Duration", duration),
              buildTextField("Notes", notes),
              buildTextField("Created At", createdAt),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerPrescription,
                child: const Text("Register Prescription"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}