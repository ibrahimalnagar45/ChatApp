import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class RecivererBubble extends StatelessWidget {
  const RecivererBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin:const EdgeInsets.all(8),
      constraints:const BoxConstraints(minHeight: 40, maxWidth: 250),
      decoration:const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kPrimaryPadding),
          topRight: Radius.circular(kPrimaryPadding),
          bottomRight: Radius.circular(kPrimaryPadding),
        ),
      ),
      child: const Text(
        "ensendIco  sendsendIco send",
        style: TextStyle(color: Colors.white),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
