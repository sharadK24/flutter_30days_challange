import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/Payment_viewmodel.dart';

class PaymentRegistration extends StatefulWidget {
  const PaymentRegistration({super.key});

  @override
  State<PaymentRegistration> createState() =>
      _PaymentRegistrationState();
}

class _PaymentRegistrationState extends State<PaymentRegistration> {
  final _formKey = GlobalKey<FormState>();

  InputDecoration input(String label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PaymentViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Payment")),
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
                  v == null || v.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("User ID"),
                  onChanged: vm.updateUserId,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Amount"),
                  keyboardType: TextInputType.number,
                  onChanged: (v) =>
                      vm.updateAmount(double.tryParse(v) ?? 0.0),
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Payment Method (UPI / CARD)"),
                  onChanged: vm.updatePaymentMethod,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Payment Date"),
                  onChanged: vm.updatePaymentDate,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: input("Status"),
                  onChanged: vm.updateStatus,
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await vm.addPayment(); // ✅ correct
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Save Payment"),
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
