import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    this.text = 'Hint Text',
    this.fontSize = 16,
    this.iconData,
    this.backgroundColor,
    this.fontColor,
    this.cursorColor,
    this.controller,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? cursorColor;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? const Color(0xFF5A6F82),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 50),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Color(0xFF20374B),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xFF20374B),
                ),
              ),
              hintStyle: TextStyle(color: fontColor ?? Colors.white),
              hintText: text,
            ),
            style:
                TextStyle(color: fontColor ?? Colors.white, fontSize: fontSize),
            cursorColor: cursorColor ?? Colors.white,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 10,
            child: Icon(
              iconData ?? Icons.person,
              color: fontColor ?? Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
