// import 'package:flutter_study/day1/Model/UserModel.dart';
// import 'package:hive/hive.dart';
//
// class UserRepository {
//     final String boxName = "usersBox";
//
// Future<void> addUser(UserModel user)async {
//     final box = await Hive.openBox<UserModel>(boxName);
//     await box.add(user);
//   }
//
//   Future<List<UserModel>> getAllUsers() async {
//     final box = await Hive.openBox<UserModel>(boxName);
//     return box.values.toList();
//   }
//
// }
