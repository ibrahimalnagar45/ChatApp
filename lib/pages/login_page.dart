import 'package:chat_app/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/show_snak_bar.dart';
import '../widgets/custom_bottom.dart';
import '../widgets/custom_text_feild.dart';
import 'signUp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "Login page";
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
          child: Form(
            key: keyform,
            child: ListView(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/Logo - Dra_ Patrícia Moura.jpg"),
                  radius: 80,
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
                CustomFormTextField(
                  onchanged: (data) {
                    email = data;
                  },
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'required feild';
                    }
                  },
                  hintText: "Email",
                ),
                CustomFormTextField(
                  obscure: true,
                  onchanged: (data) {
                    password = data;
                  },
                  validator: (data) {
                    if (data!.isEmpty) return 'required feild';
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
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email!, password: password!);
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "user-not-found") {
                          showSnakBar(context, "No user found for that email.");
                        } else if (e.code == "invalid-credential") {
                          showSnakBar(context,
                              "invalid information the password or the email is wrong");
                        } else {
                          showSnakBar(context, "NO internet conection");
                        }
                      } catch (e) {
                        print(e);
                        showSnakBar(context, "there is an error");
                      }

                      // try {
                      //   userlogin();
                      // } on FirebaseAuthException catch (e) {
                      //   if (e.code == 'user-not-found') {
                      //     print('No user found for that email.');
                      //   } else if (e.code == 'wrong-password') {
                      //     print('Wrong password provided for that user.');
                      //   }
                      // }
                    } else {}

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
                    const Text(
                      "don't have an account ",
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
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
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
      ),
    );
  }

  // Future<void> userlogin() async {
  //   final credential = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email!, password: password!);
  // }
}
