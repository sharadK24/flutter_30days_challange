import 'package:flutter/material.dart';
import 'package:flutter_study/day1/View/UserRegistration.dart';
import 'package:flutter_study/day2/View/Doctor_Registration.dart';

class DayListScreen extends StatelessWidget {
  final List<String> days = [
    "Day 1",
    "Day 2"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Study Days")),
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(days[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => UserRegistration()));
              } else if (index == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorRegistration()));
               } 
            },
          );
        },
      ),
    );
  }
}
