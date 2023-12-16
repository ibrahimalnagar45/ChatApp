import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/show_snak_bar.dart';
import '../widgets/Custom_button.dart';
import '../widgets/Custom_text_field.dart';
import 'Register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String? email;
  String? password;
  bool isloading = false;
  GlobalKey<FormState> keyform = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 80,
              ),
              const CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/Logo - Dra_ Patrícia Moura.jpg"),
                radius: 80,
              ),
              const SizedBox(
                height: 20,
              ),
           const   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    kAppName,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: "Rubik",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              const Row(
                children: [
                  Text(
                    "LOGIN",
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
                validator: (data) {
                  if (data!.isEmpty) return 'required feild';
                },
                onchanged: (data) {
                  email = data;
                },
                hintText: "Email",
              ),
              CustomTextField(
                validator: (data) {
                  if (data!.isEmpty) return 'required feild';
                },
                onchanged: (data) {
                  password = data;
                },
                hintText: "password",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButton(
                ontap: () async {
                  if (keyform.currentState!.validate()) {
                    isloading = true;
                    setState(() {});
                    try {
                      await userlogin();
                      showsnakbar(context, "login succeded");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == "user-not-found") {
                        showsnakbar(context, "No user found for that email.");
                      } else if (e.code == "'wrong-password'")
                        showsnakbar(context,
                            "Wrong password provided for that user."); // TODO
                    } catch (e) {
                      print(e);
                      showsnakbar(context, "there is an error try later ");
                    }
                  }
                  ;

                  isloading = false;
                  setState(() {});
                },
                buttonLabel: "LOG IN",
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: Text(
                      "Sing UP",
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
      ),
    );
  }

  Future<void> userlogin() async {
    final UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
