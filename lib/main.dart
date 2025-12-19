import 'package:flutter/material.dart';
import 'package:flutter_study/day1/Model/UserModel.dart';
import 'package:flutter_study/day1/ViewModel/UserViewModel.dart';
import 'package:flutter_study/day2/Model/Doctor_user_model.dart';
import 'package:flutter_study/day3/Model/AppointmentModel.dart';
import 'package:flutter_study/day3/ViewModel/appointment_viewmodel.dart';
import 'package:flutter_study/day4/Model/PaymentModel.dart';
import 'package:flutter_study/day5/Model/PrescriptionModel.dart';
import 'package:flutter_study/day6/Model/ClinicModel.dart';
import 'package:flutter_study/day7/Model/MedicalReport_Model.dart';
import 'package:flutter_study/dashboard/dayListScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(DoctorusermodelAdapter());
  Hive.registerAdapter(AppointmentModelAdapter());
  Hive.registerAdapter(PaymentModelAdapter());
  Hive.registerAdapter(PrescriptionModelAdapter());
  Hive.registerAdapter(ClinicModelAdapter());
  Hive.registerAdapter(MedicalReportAdapter());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => AppointmentViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: DayListScreen(),
    );
  }
}
