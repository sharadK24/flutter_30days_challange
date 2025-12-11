import 'package:flutter/material.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";
  String password = "";
  String username = "";
  String address = "";
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
  void saveUser() {
    print("----- USER SAVED -----");
    print("Name: $name");
    print("Email: $email");
    print("Password: $password");
    print("Username: $username");
    print("Address: $address");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User Registered Successfully")),
    );
  }
  InputDecoration buildInput(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Registration")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: buildInput("Name"),
                  onChanged: updateName,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: buildInput("Password"),
                  onChanged: updatePassword,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: buildInput("Email"),
                  onChanged: updateEmail,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: buildInput("Username"),
                  onChanged: updateUsername,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: buildInput("Address"),
                  onChanged: updateAddress,
                  validator: (v) =>
                      v == null || v.isEmpty ? "Please enter address" : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveUser();
                      }
                    },
                    child: const Text("Register"),
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
