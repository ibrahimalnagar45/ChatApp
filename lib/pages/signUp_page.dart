import 'package:chat_app/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/show_snak_bar.dart';
import '../widgets/custom_bottom.dart';
import '../widgets/custom_text_feild.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
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
                CustomFormTextField(
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
                CustomFormTextField(
                  obscure: true,
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
                        // registerUser();
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          showSnakBar(context,
                              'the password is weak try something els');
                        } else if (e.code == 'email-already-in-use') {
                          showSnakBar(context, "the email is already exits");
                        } else if (e.code == "invalid-email") {
                          showSnakBar(
                              context, "the email is invalid use another one");
                        } else {
                          showSnakBar(
                              context, "there is an error ${e.toString()}");
                        }
                      } catch (e) {
                        print(e);
                        showSnakBar(
                          context,
                          "there is an error  ",
                        );
                      }

                      // Navigator.pushNamed(context, ChatPage.id);

                      isloading = false;
                      setState(() {});
                    }
                  },
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
        ),
      ),
    );
  }

  // void showSnakBar(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: Colors.white,
  //       elevation: 0,
  //       content: Text(
  //         message,
  //         style: const TextStyle(color: Colors.black),
  //       ),
  //     ),
  //   );
  // }

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
