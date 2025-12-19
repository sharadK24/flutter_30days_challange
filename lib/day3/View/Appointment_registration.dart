import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/appointment_viewmodel.dart';

class AppointmentRegistration extends StatefulWidget {
  const AppointmentRegistration({super.key});

  @override
  State<AppointmentRegistration> createState() =>
      _AppointmentRegistrationState();
}

class _AppointmentRegistrationState extends State<AppointmentRegistration> {
  final _formKey = GlobalKey<FormState>();

  InputDecoration input(String label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AppointmentViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Appointment Booking")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: input("Appointment ID"),
                  onChanged: vm.updateAppointmentId,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter Appointment ID" : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("User ID"),
                  onChanged: vm.updateUserId,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter User ID" : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Doctor ID"),
                  onChanged: vm.updateDoctorId,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter Doctor ID" : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Appointment Date"),
                  onChanged: vm.updateAppointmentDate,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Time"),
                  onChanged: vm.updateTime,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Status"),
                  onChanged: vm.updateStatus,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Notes"),
                  onChanged: vm.updateNotes,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Booking Timestamp"),
                  onChanged: vm.updateBookingTimestamp,
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await vm.addAppointment();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                              Text("Appointment Booked Successfully")),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Book Appointment"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
