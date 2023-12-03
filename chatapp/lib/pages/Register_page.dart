import 'package:chatapp/pages/Login_page.dart';
import 'package:flutter/material.dart';

import '../widgets/Custom_button.dart';
import '../widgets/Custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff274460),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/Logo - Dra_ Patrícia Moura.jpg"),
              radius: 60,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "ChatApp",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontFamily: "Rubik",
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Row(
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              hintText: "Email",
            ),
            CustomTextField(
              hintText: "password",
            ),
            const SizedBox(
              height: 8,
            ),
            CustomButton(
              buttonLabel: "Register",
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "already have an account? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Long In",
                    style: TextStyle(
                      color: Color(0xffBAD9E1),
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
