import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/app_bar.dart';
import 'package:chat_app/widgets/reciver_bubble.dart';
import 'package:chat_app/widgets/sender_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = "ChatPage";

  // CollectionReference message =
  //     FirebaseFirestore.instance.collection('messages');

  final TextEditingController controller = TextEditingController();
  final scrollController = ScrollController();
  String text = '';
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        final List<Message> messages = [];
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messages.add(Message.fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              // automaticallyImplyLeading: false, // to hide the arrow to the bage before
              backgroundColor: kPrimaryColor,
              title: const CustomAppBar(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return messages[index].id == email
                          ? SenderBubble(message: messages[index])
                          : RecivererBubble(message: messages[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kPrimaryPadding, vertical: kPrimaryPadding),
                  child: TextField(
                    controller: controller,
                    onChanged: (data) {
                      text = data;
                    },
                    onSubmitted: (data) {
                      message.add({
                        kMessage: data,
                        kCreatedAt: DateTime.now(),
                        kId: email,
                      });
                      controller.clear();
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          message.add({
                            kMessage: text,
                            kCreatedAt: DateTime.now(),
                            kId: email,
                          });
                          controller.clear();
                          scrollController.animateTo(
                            0,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.fastEaseInToSlowEaseOut,
                          );
                        },
                        icon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: kPrimaryColor, width: 2),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(color: kPrimaryColor, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text("there is an error ");
        }
      },
    );
  }
}
