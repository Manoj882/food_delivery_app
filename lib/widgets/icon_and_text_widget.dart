import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      {required this.icon,
      required this.text,
      required this.iconColor,
      Key? key})
      : super(key: key);

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
