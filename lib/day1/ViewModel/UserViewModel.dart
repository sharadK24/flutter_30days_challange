import 'package:flutter/widgets.dart';
import 'package:flutter_study/day1/Model/UserModel.dart';
import 'package:flutter_study/day1/Repository/UserRepository.dart';

class UserViewModel extends ChangeNotifier {
  final repo = UserRepository();

  String name = "";
  String email = "";
  String password = "";
  String username = "";
  String address = "";

  updateName(String v) {
    name = v;
    notifyListeners();
  }

  updateEmail(String v) {
    email = v;
    notifyListeners();
  }

  updatePassword(String v) {
    password = v;
    notifyListeners();
  }

  updateUsername(String v) {
    username = v;
    notifyListeners();
  }

  updatAddress(String v) {
    address = v;
    notifyListeners();
  }

  Future<void> saveUser() async {
    notifyListeners();

    final user = UserModel(
      name: name,
      email: email,
      password: password,
      username: username,
      address: address,
    );

    await repo.addUser(user);
    notifyListeners();
  }
}
