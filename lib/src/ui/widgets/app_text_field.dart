import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key key,
    @required this.prefixIconData,
    @required this.labelText,
    this.validator,
    this.obscureText,
  }) : super(key: key);

  final IconData prefixIconData;
  final String labelText;
  final bool obscureText;
  final Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        fillColor: Color(0xFFE5E5E5),
        filled: true,
        labelText: labelText,
        labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
        prefixIcon: Icon(prefixIconData, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
