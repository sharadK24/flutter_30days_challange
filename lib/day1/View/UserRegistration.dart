import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/UserViewModel.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final _formKey = GlobalKey<FormState>();

  InputDecoration buildInput(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    );
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("User Registration")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: buildInput("Name"),
                  onChanged: vm.updateName,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter name" : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: buildInput("Email"),
                  onChanged: vm.updateEmail,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter email" : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: buildInput("Password"),
                  onChanged: vm.updatePassword,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter password" : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: buildInput("Username"),
                  onChanged: vm.updateUsername,
                  validator: (v) =>
                  v == null || v.isEmpty ? "Enter Username" : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: buildInput("Address"),
                  onChanged: vm.updateAddress,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await vm.saveUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("User Registered Successfully")),
                        );
                        Navigator.pop(context); // 🔥 back to list
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
