import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimension.dart';

class BigText extends StatelessWidget {
  BigText(
    {
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
    Key? key,
  }) : super(key: key);

  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.fontSize20: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
