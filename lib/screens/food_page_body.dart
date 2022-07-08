import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/constant.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodPageBody extends StatelessWidget {
  FoodPageBody({Key? key}) : super(key: key);

  final pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      // color: Colors.red,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildPageItem(index);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/burger.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 15, right: 15, left: 15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Veggie Burgers'),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                        height: 20,
                      ),
                      Row(
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
                      ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
