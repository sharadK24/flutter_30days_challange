import 'package:flutter/material.dart';
import 'package:flutter_study/day4/Model/PaymentModel.dart';
import 'package:flutter_study/day4/Repository/Payment_repository.dart';

class PaymentRegistration extends StatefulWidget {
  const PaymentRegistration({super.key});

  @override
  State<PaymentRegistration> createState() => _PaymentRegistrationState();
}

class _PaymentRegistrationState extends State<PaymentRegistration> {
  final PaymentRepository repo = PaymentRepository();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController paymentId = TextEditingController();
  final TextEditingController userId = TextEditingController();
  final TextEditingController appointmentId = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController paymentDate = TextEditingController();
  final TextEditingController paymentMethod = TextEditingController();
  final TextEditingController status = TextEditingController();
  final TextEditingController transactionId = TextEditingController();
  Future<void> registerPayment() async {
    if (_formKey.currentState!.validate()) {
      final payment = PaymentModel(
        paymentId: paymentId.text,
        userId: userId.text,
        appointmentId: appointmentId.text,
        amount: double.parse(amount.text),
        paymentDate: paymentDate.text,
        paymentMethod: paymentMethod.text,
        status: status.text,
        transactionId: transactionId.text,
      );
      await repo.addPayment(payment);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Payment Registered Successfully!"),
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
            return "Please enter $label";
          }
          return null;
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTextField("Payment ID", paymentId),
                buildTextField("User ID", userId),
                buildTextField("Appointment ID", appointmentId),
                buildTextField(
                  "Amount",
                  amount,
                  type: TextInputType.number,
                ),
                buildTextField("Payment Date", paymentDate),
                buildTextField("Payment Method", paymentMethod),
                buildTextField("Status", status),
                buildTextField("Transaction ID", transactionId),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: registerPayment,
                  child: const Text("Register Payment"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
