import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 const CustomButton({super.key, required this.buttonLabel,required this.ontap});
  final String buttonLabel;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
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
              style:const TextStyle(fontSize: 23),
            ),
          ),
        ),
      ),
    );
  }
}
