import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          child: Image(
            image: AssetImage(kPrimaryLogo),
          ),
        ),
        Expanded(
          child: Text(
            "Chat App",
            style: TextStyle(fontSize: 25, fontFamily: "Rubik"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: kPrimaryPadding),
          child: Icon(Icons.person),
        )
      ],
    );
  }
}
