import 'package:flutter/material.dart';

class AppointmentRegistration extends StatefulWidget {
  const AppointmentRegistration({super.key});

  @override
  State<AppointmentRegistration> createState() =>
      _AppointmentRegistrationState();
}

class _AppointmentRegistrationState extends State<AppointmentRegistration> {
  final AppointmentRegistration repo = AppointmentRegistration();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController appointmentId = TextEditingController();
  final TextEditingController userId = TextEditingController();
  final TextEditingController doctorId = TextEditingController();
  final TextEditingController appointmentDate = TextEditingController();
  final TextEditingController status = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController bookingTimestamp = TextEditingController();

  Future<void> registerAppointment() async {
    if (_formKey.currentState!.validate()) {
      final appointment = {
        'appointmentId': appointmentId.text,
        'userId': userId.text,
        'doctorId': doctorId.text,
        'appointmentDate': appointmentDate.text,
        'status': status.text,
        'time': time.text,
        'notes': notes.text,
        'bookingTimestamp': bookingTimestamp.text,
      };
      await repo.addAppointment(appointment);

      // Here you would typically send the data to a backend or database

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Appointment Registered Successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    }

   
   setState(() {}); // Refresh UI (important)
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: appointmentId,
                decoration: const InputDecoration(labelText: 'Appointment ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Appointment ID';
                  }
                  return null;
                },
              ),
              // Add other TextFormFields similarly...
              ElevatedButton(
                onPressed: registerAppointment,
                child: const Text('Register Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  


}
