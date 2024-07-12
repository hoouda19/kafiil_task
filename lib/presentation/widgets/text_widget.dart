import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign textalign;
  final double height;

  const TextWidget(
      {super.key,
      required this.text,
      this.size = 13,
      this.color = Colors.black,
      this.weight = FontWeight.normal,
      this.textalign = TextAlign.right,
      this.height = 1.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textalign,
      style: TextStyle(
          color: color, fontSize: size, fontWeight: weight, height: height),
    );
  }
}
