import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/UserViewModel.dart';
import 'User_List.dart';

class Userlist extends StatefulWidget {
  _UserlistState createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).fetchUsers();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Users"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Userlist()),
          );
        },
      ),
      body: Consumer<UserViewModel>(
        builder: (context, vm, child) {
          if (vm.users.isEmpty) {
            return Center(child: Text("No Users Found"));
          }
          return ListView.builder(
            itemCount: vm.users.length,
            itemBuilder: (context, index) {
              final user = vm.users[index];
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ListTile(
                  title: Text("Name: ${user.name}"),
                  subtitle: Text("Email: ${user.email}"),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Userlist()),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
  }

