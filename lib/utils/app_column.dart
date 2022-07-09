import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/show_icon_and_text_row.dart';

import '../widgets/big_text.dart';
import '../widgets/small_text.dart';
import 'app_colors.dart';
import 'dimension.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({required this.text, Key? key}) : super(key: key);

  final String text;
 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.fontSize26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star_outlined,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: '4.5'),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: '1270'),
            const SizedBox(
              width: 10,
            ),
            SmallText(text: 'comments'),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        ShowIconAndTextRow().showIconAndTextRow(),
      ],
    );
  }
}
