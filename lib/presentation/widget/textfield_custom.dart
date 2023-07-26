import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {Key? key,
      this.maxLines = 1,
      this.controller,
      this.hintText = 'Hint Text'})
      : super(key: key);
  final int maxLines;
  final TextEditingController? controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Color(0xFF20374B),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFFF7C125),
          ),
        ),
        hintStyle: const TextStyle(color: Color(0xFF8F949C)),
        hintText: hintText,
      ),
      style: const TextStyle(color: Color(0xFF20374B), fontSize: 14),
      cursorColor: const Color(0x0f8f949c),
    );
  }
}
