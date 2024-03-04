import 'package:flutter/material.dart';

class CustomFilledIconButton extends StatelessWidget {
  final onPress;
  final IconData icons;
  final MaterialColor backgroundColor;

  const CustomFilledIconButton({super.key, required this.onPress, required this.icons, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      child: FilledButton(
          onPressed: onPress,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Icon(icons, size: 25,),
          ),
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor
      ),),
    );
  }
}
