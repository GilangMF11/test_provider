import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider_dzikir/Dashboard.dart';
import 'package:provider_dzikir/screens/auth/v_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {  
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale('id'),
          home: LoginPage(),
        );
      },
    );
  }
}