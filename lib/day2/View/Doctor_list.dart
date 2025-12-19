import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/Doctor_ViewModel.dart';
import 'Doctor_Registration.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DoctorViewModel>().fetchDoctors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Doctors"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const DoctorRegistration(),
            ),
          );
        },
      ),
      body: Consumer<DoctorViewModel>(
        builder: (context, vm, child) {
          if (vm.doctors.isEmpty) {
            return const Center(
              child: Text(
                "No Doctors Found",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: vm.doctors.length,
            itemBuilder: (context, index) {
              final doctor = vm.doctors[index];

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(doctor.doctorName),
                  subtitle: Text(doctor.specialization),
                  trailing: Text("₹ ${doctor.fees}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
