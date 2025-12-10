import 'package:flutter/material.dart';

class DoctorRegistration extends StatefulWidget {
  const DoctorRegistration({super.key});

  @override
  State<DoctorRegistration> createState() => _DoctorRegistrationState();
}

class _DoctorRegistrationState extends State<DoctorRegistration> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: doctorId,
                decoration: const InputDecoration(
                  labelText: "Doctor ID",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: specialization,
                decoration: const InputDecoration(
                  labelText: "Specialization",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: experience,
                decoration: const InputDecoration(
                  labelText: "Experience (Years)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: clinicAddress,
                decoration: const InputDecoration(
                  labelText: "Clinic Address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: clinicCity,
                decoration: const InputDecoration(
                  labelText: "Clinic City",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: fees,
                decoration: const InputDecoration(
                  labelText: "Fees",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: timings,
                decoration: const InputDecoration(
                  labelText: "Timings (10AM - 2PM)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: availableDays,
                decoration: const InputDecoration(
                  labelText: "Available Days (Mon–Sat)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Doctor Registered")),
                  );
                },
                child: const Text("Register"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
