import 'package:hive/hive.dart';

class HiveService {
  static const String userBox = "userBox";

  Future<void> saveUser(Map<String, dynamic> userData) async {
    final box = Hive.box(userBox);
    await box.put("user", userData);
  }

  Map<String, dynamic>? getUser() {
    final box = Hive.box(userBox);
    return box.get("user");
  }

  void clearUser() {
    final box = Hive.box(userBox);
    box.clear();
  }
}
