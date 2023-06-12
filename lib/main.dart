import 'package:flutter/material.dart';
import 'package:life_coach/screens/login_screen.dart';
import 'package:life_coach/screens/sign_up_screen.dart';
import 'package:life_coach/widgets/drawer.dart';
import './screens/dash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: DrawerWidget(),
    );
  }
}
