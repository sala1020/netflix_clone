import 'package:flutter/material.dart';

class CustumButtonWidget extends StatelessWidget {
  const CustumButtonWidget(
      {super.key, required this.icon, required this.title,required this.iconSize,required this.textSize});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        )
      ],
    );
  }
}