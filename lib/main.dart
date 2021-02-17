import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wheres_my_bus/pages/forgot_password.dart';
import 'package:wheres_my_bus/pages/home/home.dart';
import 'package:wheres_my_bus/pages/loading_page.dart';
import 'package:wheres_my_bus/pages/login.dart';
import 'package:wheres_my_bus/pages/map/map.dart';
import 'package:wheres_my_bus/pages/map/pages/map_options.dart';
import 'package:wheres_my_bus/pages/my_account.dart';
import 'package:wheres_my_bus/pages/project.dart';
import 'package:wheres_my_bus/pages/register.dart';
import 'package:wheres_my_bus/pages/register_driver.dart';

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
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/home': (context) => HomePage(),
        '/map': (context) => MapPage(),
        '/project': (context) => ProjectPage(),
        '/register_driver': (context) => RegisterDriver(),
        '/my_account': (context) => MyAccountPage(),
        '/map_options': (context) => MapOptionsPage(),
      },
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return LoadingPage();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return LoadingPage();
        },
      ),
    );
  }
}
