import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/Appointment_viewmodel.dart';
import 'Appointment_registration.dart';

class AppoinmentList extends StatefulWidget {
  const AppoinmentList({super.key});

  @override
  State<AppoinmentList> createState() => _UserlistState();
}

class _UserlistState extends State<AppoinmentList> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppointmentViewModel>(context, listen: false).fetchAppointments();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Users"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AppointmentRegistration()),
          );
        },
      ),
      body: Consumer<AppointmentViewModel>(
        builder: (context, vm, child) {
          if (vm.appointmentId.isEmpty) {
            return const Center(child: Text("No appointments Found"));
          }
          return ListView.builder(
            itemCount: vm.appointmentId .length,
            itemBuilder: (context, index) {
              final user = vm.appointmentId[index];
              return Card(
                margin:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

extension on String {
  String get name => AutofillHints.name;

  String get email => AutofillHints.email;
}

extension on AppointmentViewModel {
  void fetchAppointments() {}
}
