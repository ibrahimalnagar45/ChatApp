
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/Custom_button.dart';
import '../widgets/Custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = "regesterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/Logo - Dra_ Patrícia Moura.jpg"),
                  radius: 70,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
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
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'required feild';
                    }
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
                    buttonLabel: "Register",
                    ontap: () async {
                      if (formKey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});
                        try {
                          await registerUser();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "weak-password") {
                            showSnakBar(context,
                                "the password is weak try something else");
                            if (e.code == "emial-already-in-use") {
                              showSnakBar(
                                  context, "the email is already exits");
                            }
                          }
                        }
                        ;
                        isloading = false;
                        setState(() {});

                        showSnakBar(
                            context, "registeration done you can login ");
                      }
                      ;
                    }),
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
        ),
      ),
    );
  }

  void showSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        elevation: 0,
        content: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
