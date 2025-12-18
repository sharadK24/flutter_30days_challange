import 'package:flutter/material.dart';
import 'package:flutter_study/day1/Model/UserModel.dart';
import 'package:flutter_study/day1/Repository/UserRepository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository repo = UserRepository();
  String name = "";
  String email = "";
  String password = "";
  String username = "";
  String address = "";

  List<UserModel> users = [];
  void updateName(String v) {
    name = v;
  }
  void updateEmail(String v) {
    email = v;
  }
  void updatePassword(String v) {
    password = v;
  }
  void updateUsername(String v) {
    username = v;
  }
  void updateAddress(String v) {
    address = v;
  }
  Future<void> saveUser() async {
    final user = UserModel(
      name: name,
      email: email,
      password: password,
      username: username,
      address: address,
    );
    await repo.addUser(user);
    await fetchUsers();
  }
  Future<void> fetchUsers() async {
    users = await repo.getAllUsers();
    notifyListeners();
  }
}
