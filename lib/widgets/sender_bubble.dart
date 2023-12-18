import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class SenderBubble extends StatelessWidget {
  const SenderBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.all(8),
      constraints: BoxConstraints(minHeight: 40, maxWidth: 250),
      decoration: BoxDecoration(
        color: kPrimaryColor.withAlpha(200),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kPrimaryPadding),
          topRight: Radius.circular(kPrimaryPadding),
          bottomLeft: Radius.circular(kPrimaryPadding),
        ),
      ),
      child: Text(
        "ensendIco  sendsendIco send",
        style: TextStyle(color: Colors.white),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
