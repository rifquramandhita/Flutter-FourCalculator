import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final onPress;
  final String text;
  final MaterialColor backgroundColor;

  const CustomFilledButton({super.key, required this.onPress, required this.text, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      child: FilledButton(
          onPressed: onPress,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(text, style: TextStyle(fontSize: 25),),
          ),
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor
      ),),
    );
  }
}
