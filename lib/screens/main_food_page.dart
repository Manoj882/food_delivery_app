import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/constant.dart';
import 'package:food_delivery_app/screens/food_page_body.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class MainFoodPageScreen extends StatelessWidget {
  const MainFoodPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('The height is: ${MediaQuery.of(context).size.height}');
    print('The width is: ${MediaQuery.of(context).size.width}');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: basePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  //header section

                  child: Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: 'Nepal',
                              color: AppColors.mainColor,
                            ),
                            Row(
                              children: [
                                SmallText(
                                  text: 'kathmandu',
                                  color: Colors.black54,
                                ),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search_outlined,
                              color: Colors.white,
                              size: Dimensions.iconSize24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //body section
                FoodPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
