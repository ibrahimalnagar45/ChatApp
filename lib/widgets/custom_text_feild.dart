import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
 const CustomFormTextField({
    super.key,
    this.hintText,
    required this.onchanged,
    required this.validator,
  });
  final String? hintText;
 final Function(String) onchanged;
 final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
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
