import 'package:hive/hive.dart';
import '../Model/PaymentModel.dart';

class PaymentRepository {
  final String boxName = "paymentsBox";

  Future<void> addPayment(PaymentModel payment) async {
    final box = await Hive.openBox<PaymentModel>(boxName);
    await box.add(payment);
  }

  Future<List<PaymentModel>> getAllPayments() async {
    final box = await Hive.openBox<PaymentModel>(boxName);
    return box.values.toList();
  }
}
