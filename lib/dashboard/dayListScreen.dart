import 'package:flutter/material.dart';
import 'package:flutter_study/day1/View/UserRegistration.dart';
import 'package:flutter_study/day1/View/User_LIst.dart';
import 'package:flutter_study/day2/View/Doctor_Registration.dart';
import 'package:flutter_study/day3/View/Appointment_Registration.dart'; 
import 'package:flutter_study/day4/View/Payment_Registration.dart';
import 'package:flutter_study/day5/View/Prescription_registration.dart';
import 'package:flutter_study/day6/View/Clinic_Registration.dart';
import 'package:flutter_study/day7/View/MedicalReport_Registration.dart';



class DayListScreen extends StatelessWidget {
  final List<String> days = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7"];

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
                    MaterialPageRoute(builder: (_) => Userlist()),
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
                else if (index == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentRegistration()),
                  );
                }
                else if (index == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PrescriptionRegistration()),
                  );
                }
                else if (index == 5) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ClinicRegistration()),
                  );
                }
                else if (index == 6) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MedicalReportRegistration()),
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
