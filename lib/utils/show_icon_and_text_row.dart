import 'package:flutter/material.dart';

import '../widgets/icon_and_text_widget.dart';
import 'app_colors.dart';

class ShowIconAndTextRow{
  showIconAndTextRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconAndTextWidget(
          icon: Icons.circle_sharp,
          text: 'Normal',
          iconColor: AppColors.iconColor1,
        ),
        IconAndTextWidget(
          icon: Icons.location_on_outlined,
          text: '1.5km',
          iconColor: AppColors.mainColor,
        ),
        IconAndTextWidget(
          icon: Icons.access_time_rounded,
          text: '23min',
          iconColor: AppColors.iconColor2,
        ),
      ],
    );
}
}