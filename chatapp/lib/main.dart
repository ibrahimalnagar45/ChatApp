import 'package:chatapp/pages/Login_page.dart';
import 'package:chatapp/pages/Register_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterPage.id: (context) => RegisterPage(),
        "LoginPage": (context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "LoginPage",
    );
  }
}
