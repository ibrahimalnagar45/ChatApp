import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class SenderBubble extends StatelessWidget {
  const SenderBubble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.all(8),
        constraints:
            const BoxConstraints(minHeight: 40, maxWidth: 250, minWidth: 70),
        decoration: BoxDecoration(
          color: kPrimaryColor.withAlpha(200),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kPrimaryPadding),
            topRight: Radius.circular(kPrimaryPadding),
            bottomLeft: Radius.circular(kPrimaryPadding),
          ),
        ),
        child: Column(
          children: [
            Text(
              message.text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 15),
              textDirection: TextDirection.ltr,
            ),
            
          ],
        ),
      ),
    );
  }
}
