import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimension.dart';

class SmallText extends StatelessWidget {
  SmallText(
    {
    this.color = const Color(0xFFccc7c5),
    this.size =  0,
    required this.text,
    this.height = 1.2,
    Key? key,
  }) : super(key: key);

  Color? color;
  final String text;
  double size;
  double height;
  

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.fontSize12: size,
        height: height,
      ),
    );
  }
}
