import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// CollectionReference message = FirebaseFirestore.instance.collection('messages');
TextEditingController controller = TextEditingController();
String text = '';

class MessageTextFeild extends StatelessWidget {
  const MessageTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kPrimaryPadding, vertical: kPrimaryPadding),
      child: TextField(
        controller: controller,
        onChanged: (data) {
          text = data;
        },
        onSubmitted: (data) {
          message.add({
            'message': data,
          });
          controller.clear();
        },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              message.add({
                'message': text,
              });
              controller.clear();
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
    );
  }
}
