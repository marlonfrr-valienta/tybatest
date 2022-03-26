import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String value) onChangeCallback;

  const CustomTextField({this.controller, this.hintText, required this.onChangeCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // key: Key('search-bar-field'),
      controller: controller,
      onChanged: (String value) => onChangeCallback(value),
      style: const TextStyle(fontSize: 14),
      autofocus: true,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        suffixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
      ),
    );
  }
}
