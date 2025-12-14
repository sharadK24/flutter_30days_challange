import 'package:hive/hive.dart';
import '../Model/PaymentModel.dart';

class PaymentRepository {
  final String boxName = "paymentsBox";

  Future<void> addPayment(PaymentModel payment) async {
    final box = await Hive.openBox<PaymentModel>(boxName);
    
    
    int index = await box.add(payment);

    print("Payment saved at index: $index");
    print("Total payments in Hive: ${box.length}");
    print("Saved Payment: ${box.get(index)}");
  }

  Future<List<PaymentModel>> getAllPayments() async {
    final box = await Hive.openBox<PaymentModel>(boxName);
    return box.values.toList();
  }
}