import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
    CustomFormTextField({
    super.key,
    this.hintText,
    required this.onchanged,
    required this.validator,
      this.obscure=false,
  });
  final String? hintText;
  final Function(String) onchanged;
  final String? Function(String?) validator;
    bool? obscure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obscure!,
      
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        onChanged: onchanged,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
