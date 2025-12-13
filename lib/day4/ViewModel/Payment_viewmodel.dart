import 'package:flutter/widgets.dart';
import 'package:flutter_study/day4/Repository/Payment_repository.dart';
import 'package:flutter_study/day4/Model/PaymentModel.dart';

class PaymentViewModel extends ChangeNotifier {
  final repo = PaymentRepository();

  String paymentId = "";
  String userId = "";
  String appointmentId = "";
  String amount = "";
  String paymentDate = "";
  String paymentMethod = "";
  String status = "";
  String transactionId = "";

  updatePaymentId(String v) {
    paymentId = v;
    notifyListeners();
  }

  updateUserId(String v) {
    userId = v;
    notifyListeners();
  }

  updateAppointmentId(String v) {
    appointmentId = v;
    notifyListeners();
  }

  updateAmount(String v) {
    amount = v;
    notifyListeners();
  }

  updatePaymentDate(String v) {
    paymentDate = v;
    notifyListeners();
  }

  updatePaymentMethod(String v) {
    paymentMethod = v;
    notifyListeners();
  }

  updateStatus(String v) {
    status = v;
    notifyListeners();
  }

  updateTransactionId(String v) {
    transactionId = v;
    notifyListeners();
  }

  Future<void> addPayment() async {
    final payment = PaymentModel(
      paymentId: paymentId,
      userId: userId,
      appointmentId: appointmentId,
      amount: double.parse(amount),
      paymentDate: paymentDate,
      paymentMethod: paymentMethod,
      status: status,
      transactionId: transactionId,
    );
    await repo.addPayment(payment);
  }
}