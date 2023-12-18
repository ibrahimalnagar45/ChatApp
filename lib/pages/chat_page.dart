import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/app_bar.dart';
import 'package:chat_app/widgets/reciver_bubble.dart';
import 'package:chat_app/widgets/sender_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = "ChatPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: CustomAppBar(),
        // Text(
        //   "Chat App",
        //   style: TextStyle(fontSize: 25, fontFamily: "Rubik"),
        // ),
        // leadingWidth: 50,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: kPrimaryPadding),
        //     child: Icon(Icons.person),
        //   )
        // ],
      ),
      persistentFooterButtons: [ 
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPrimaryPadding),
        child: TextField(
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
                            
                            
            suffixIcon: IconButton(
              onPressed: () {},
              icon:const  Icon(
                Icons.send,
                color: kPrimaryColor,
              ),
            ),
            focusedBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
            enabledBorder:const  OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
          ),
        ),
      ),],
        body: ListView.builder(
        itemBuilder: (context, index) {
          return const SenderBubble();
        },
      ),
    );
  }
}
