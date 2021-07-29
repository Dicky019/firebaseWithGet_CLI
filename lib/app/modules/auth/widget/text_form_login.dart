import 'package:flutter/material.dart';

class TextFormLogin extends StatelessWidget {
  const TextFormLogin({
    Key? key,
    required this.labelText,
    this.hintText,
    this.validator,
    required this.controller,
    required this.prefix, this.suffix, this.obscure = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final validator;
  final Widget prefix;
  final Widget? suffix;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      controller: controller,
      validator: validator,
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 22, 12, 14),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}