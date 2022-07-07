import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText(
    {
    this.color,
    this.size=20.0,
    
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
    Key? key,
  }) : super(key: key);

  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
