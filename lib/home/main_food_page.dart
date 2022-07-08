import 'package:flutter/material.dart';
import '/constants/constant.dart';
import '/home/food_page_body.dart';
import '/utils/app_colors.dart';
import '/utils/dimension.dart';
import '/widgets/big_text.dart';
import '/widgets/small_text.dart';

class MainFoodPageScreen extends StatelessWidget {
  const MainFoodPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: basePadding,
          child: Column(
            children: [
              //header section
              Container(
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
              Expanded(
                child: SingleChildScrollView(
                  child: FoodPageBody(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
