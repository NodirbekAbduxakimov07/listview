import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final Color color;
  final String text;
  const AppText({Key? key,
    this.size = 16,
    this.color = Colors.black,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
      ),
    );
  }
}
