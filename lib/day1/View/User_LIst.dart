import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/UserViewModel.dart';
import 'UserRegistration.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Users"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserRegistration()),
          );
        },
      ),
      body: Consumer<UserViewModel>(
        builder: (context, vm, child) {
          if (vm.users.isEmpty) {
            return const Center(child: Text("No Users Found"));
          }
          return ListView.builder(
            itemCount: vm.users.length,
            itemBuilder: (context, index) {
              final user = vm.users[index];
              return Card(
                margin:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
