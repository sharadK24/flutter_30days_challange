import 'package:flutter/material.dart';
import 'package:flutter_study/day1/View/UserRegistration.dart';
import 'package:flutter_study/day2/View/Doctor_Registration.dart';
import 'package:flutter_study/day3/View/Appointment_Registration.dart'; 

class DayListScreen extends StatelessWidget {
  final List<String> days = ["Day 1", "Day 2", "Day 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Study Days")),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: days.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => UserRegistration()),
                  );
                } 
                else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DoctorRegistration()),
                  );
                } 
                else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AppointmentRegistration()),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      days[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
