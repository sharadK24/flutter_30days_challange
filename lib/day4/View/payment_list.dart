import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/Payment_viewmodel.dart';
import 'Payment_registration.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key});

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  void initState() {
    super.initState();
    Provider.of<PaymentViewModel>(context, listen: false)
        .fetchPayments(); // ✅ correct
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payments"),
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
              builder: (_) => const PaymentRegistration(),
            ),
          );
        },
      ),
      body: Consumer<PaymentViewModel>(
        builder: (context, vm, child) {
          if (vm.payments.isEmpty) {
            return const Center(child: Text("No Payments Found"));
          }

          return ListView.builder(
            itemCount: vm.payments.length,
            itemBuilder: (context, index) {
              final p = vm.payments[index];
              return Card(
                margin:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text("₹ ${p.amount}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Appointment ID: ${p.appointmentId}"),
                      Text("Method: ${p.paymentMethod}"),
                      Text("Status: ${p.status}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
