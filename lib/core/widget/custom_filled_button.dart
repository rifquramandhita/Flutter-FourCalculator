import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final onPress;
  final String text;
  final MaterialColor backgroundColor;

  const CustomFilledButton({super.key, required this.onPress, required this.text, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: FilledButton(
          onPressed: onPress,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
            child: Text(text, style: TextStyle(fontSize: 15),),
          ),
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor
      ),),
    );
  }
}
