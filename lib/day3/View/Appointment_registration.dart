import 'package:flutter/material.dart';
import 'package:flutter_study/day3/Repository/Appointment_repository.dart';
import 'package:flutter_study/day3/Model/AppointmentModel.dart';

class AppointmentRegistration extends StatefulWidget {
  const AppointmentRegistration({super.key});

  @override
  State<AppointmentRegistration> createState() => _AppointmentRegistrationState();
}

class _AppointmentRegistrationState extends State<AppointmentRegistration> {
  
 final AppointmentRepository repo = AppointmentRepository();
 
  
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


      final appointment = AppointmentModel(
        appointmentId: appointmentId.text,
        userId: userId.text,
        doctorId: doctorId.text,
        appointmentDate: appointmentDate.text,
        status: status.text,
        time: time.text,
        notes: notes.text,
        bookingTimestamp: bookingTimestamp.text,
    );
      await repo.addAppointment(appointment); 
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Appointment Registered Successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      
    }
    setState(() {});
  }

  @override
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

              TextFormField(
                controller: userId,
                decoration: const InputDecoration(labelText: 'User ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter User ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: doctorId,
                decoration: const InputDecoration(labelText: 'Doctor ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Doctor ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: appointmentDate,
                decoration:
                    const InputDecoration(labelText: 'Appointment Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Appointment Date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: status,
                decoration: const InputDecoration(labelText: 'Status'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Status';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: time,
                decoration: const InputDecoration(labelText: 'Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: notes,
                decoration: const InputDecoration(labelText: 'Notes'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Notes';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bookingTimestamp,
                decoration:
                    const InputDecoration(labelText: 'Booking Timestamp'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Booking Timestamp';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
