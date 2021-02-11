import 'package:flutter/material.dart';
import 'package:wheres_my_bus/pages/forgot_password.dart';
import 'package:wheres_my_bus/pages/home/home.dart';
import 'package:wheres_my_bus/pages/login.dart';
import 'package:wheres_my_bus/pages/map/map.dart';
import 'package:wheres_my_bus/pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Where\'s My Bus?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0XFF08994D),
        fontFamily: 'Prompt',
      ),
      routes: {
        '/register': (context) => RegisterPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/home': (context) => HomePage(),
        '/map': (context) => MapPage(),
      },
      home: LoginPage(),
    );
  }
}
