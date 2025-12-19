import 'package:flutter/material.dart';
import 'package:flutter_study/day2/Model/Doctor_user_model.dart';
import 'package:flutter_study/day2/Repository/Doctor_user_repository.dart';

class DoctorRegistration extends StatefulWidget {
  const DoctorRegistration({super.key});

  @override
  State<DoctorRegistration> createState() => _DoctorRegistrationState();
}

class _DoctorRegistrationState extends State<DoctorRegistration> {
  final DoctorUserRepository repo = DoctorUserRepository();
  final _formKey = GlobalKey<FormState>();

  String? selectedGender;

  bool genderValidation = false;

  final TextEditingController doctorId = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController specialization = TextEditingController();
  final TextEditingController experience = TextEditingController();
  final TextEditingController clinicAddress = TextEditingController();
  final TextEditingController clinicCity = TextEditingController();
  final TextEditingController fees = TextEditingController();
  final TextEditingController timings = TextEditingController();
  final TextEditingController availableDays = TextEditingController();

  Future<void> registerDoctor() async {
    genderValidation = true; // Show gender error after button click

    if (_formKey.currentState!.validate() && selectedGender != null) {
      final doctor = Doctor_user_model(
        doctorId: doctorId.text,
        doctorName: name.text,
        specialization: specialization.text,
        clinicAddress: clinicAddress.text,
        clinicCity: clinicCity.text,
        fees: fees.text,
        timings: timings.text,
        availableDays: availableDays.text,
        gender: selectedGender!, doctorEmail: 'doctorEmail',
      );

      await repo.addDoctorUser(doctor);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Doctor Registered Successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    }

    setState(() {}); // Refresh UI (important)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctor Registration")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),

                buildTextField("Doctor ID", doctorId),
                buildTextField("Name", name),
                buildEmailField("Email", email),
                buildTextField("Specialization", specialization),
                buildNumberField("Experience", experience),
                buildTextField("Clinic Address", clinicAddress),
                buildTextField("Clinic City", clinicCity),
                buildNumberField("Fees", fees),
                buildTextField("Timings", timings),
                buildTextField("Available Days", availableDays),

                buildGenderField(),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: registerDoctor,
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? "Please enter $label" : null,
      ),
    );
  }
  Widget buildEmailField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "Please enter $label";

          final emailRegex = RegExp(r"^[^@]+@[^@]+\.[^@]+$");
          if (!emailRegex.hasMatch(value)) return "Enter valid email";

          return null;
        },
      ),
    );
  }
  Widget buildNumberField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "Please enter $label";
          if (int.tryParse(value) == null) return "Enter valid number";
          return null;
        },
      ),
    );
  }
  Widget buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Radio(
              value: "Male",
              groupValue: selectedGender,
              onChanged: (value) => setState(() => selectedGender = value),
            ),
            const Text("Male"),
            Radio(
              value: "Female",
              groupValue: selectedGender,
              onChanged: (value) => setState(() => selectedGender = value),
            ),
            const Text("Female"),
            Radio(
              value: "Other",
              groupValue: selectedGender,
              onChanged: (value) => setState(() => selectedGender = value),
            ),
            const Text("Other"),
          ],
        ),
        if (genderValidation && selectedGender == null)
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              "Please select gender",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
