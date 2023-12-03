import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.buttonLabel});
  String buttonLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      height: 40,
      width: double.infinity,
      child: GestureDetector(
        child: Center(
          child: Text(
            buttonLabel,
            style: TextStyle(fontSize: 23),
          ),
        ),
      ),
    );
  }
}
