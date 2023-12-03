import 'package:chatapp/pages/Login_page.dart';
import 'package:chatapp/pages/Register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
"RegisterPage": (context) => RegisterPage(),
"LoginPage":(context) => LoginPage(),

      },
      debugShowCheckedModeBanner: false,
      initialRoute: "LoginPage",
    );
  }
}
