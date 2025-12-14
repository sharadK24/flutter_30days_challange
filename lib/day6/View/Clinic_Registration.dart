import 'package:flutter/material.dart';
import 'package:flutter_study/day6/Model/ClinicModel.dart';
import 'package:flutter_study/day6/Repository/Clinic_repository.dart';

class ClinicRegistration extends StatefulWidget {
  const ClinicRegistration({super.key});

  @override
  State<ClinicRegistration> createState() => _ClinicRegistrationState();
}
class _ClinicRegistrationState extends State<ClinicRegistration> {
  final ClinicRepository repo = ClinicRepository();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController clinicId = TextEditingController();
  final TextEditingController clinicName = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController timings = TextEditingController();
  final TextEditingController services = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController rating = TextEditingController();

  Future<void> registerClinic() async {
    if (_formKey.currentState!.validate()) {
      final clinic = ClinicModel(
        clinicId: clinicId.text,
        clinicName: clinicName.text,
        address: address.text,
        city: city.text,
        timings: timings.text,
        services: services.text,
        contactNumber: contactNumber.text,
        rating: double.tryParse(rating.text) ?? 0.0,
      );
      await repo.addClinic(clinic);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Clinic Registered Successfully!"),
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
        title: const Text("Clinic Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("Clinic ID", clinicId),
              buildTextField("Clinic Name", clinicName),
              buildTextField("Address", address),
              buildTextField("City", city),
              buildTextField("Timings", timings),
              buildTextField("Services", services),
              buildTextField("Contact Number", contactNumber, type: TextInputType.phone),
              buildTextField("Rating", rating, type: TextInputType.number),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerClinic,
                child: const Text("Register Clinic"),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}