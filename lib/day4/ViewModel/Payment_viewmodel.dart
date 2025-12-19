import 'package:flutter/material.dart';
import '../Model/PaymentModel.dart';
import '../Repository/Payment_repository.dart';

class PaymentViewModel extends ChangeNotifier {
  final PaymentRepository repo = PaymentRepository();

  // 🔹 PaymentModel शी match होणारे variables
  String paymentId = "";
  String userId = "";
  String appointmentId = "";
  double amount = 0.0;
  String paymentDate = "";
  String paymentMethod = "";
  String status = "";
  String transactionId = "";

  // 🔹 Payment list
  List<PaymentModel> payments = [];

  // 🔹 Update methods
  void updatePaymentId(String v) => paymentId = v;
  void updateUserId(String v) => userId = v;
  void updateAppointmentId(String v) => appointmentId = v;
  void updateAmount(double v) => amount = v;
  void updatePaymentDate(String v) => paymentDate = v;
  void updatePaymentMethod(String v) => paymentMethod = v;
  void updateStatus(String v) => status = v;
  void updateTransactionId(String v) => transactionId = v;

  // 🔹 ADD PAYMENT
  Future<void> addPayment() async {
    final payment = PaymentModel(
      paymentId: paymentId.isEmpty
          ? DateTime.now().millisecondsSinceEpoch.toString()
          : paymentId,
      userId: userId,
      appointmentId: appointmentId,
      amount: amount,
      paymentDate: paymentDate,
      paymentMethod: paymentMethod,
      status: status.isEmpty ? "PAID" : status,
      transactionId: transactionId.isEmpty
          ? "TXN${DateTime.now().millisecondsSinceEpoch}"
          : transactionId,
    );

    await repo.addPayment(payment);
    await fetchPayments();
  }

  // 🔹 FETCH PAYMENTS
  Future<void> fetchPayments() async {
    payments = await repo.getAllPayments();
    notifyListeners();
  }
}
