import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_column.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

import '../../utils/app_colors.dart';

import '../../widgets/big_text.dart';

class PopularFoodDetailsPage extends StatelessWidget {
  const PopularFoodDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image position
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImageHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/burger.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //app bar position
          Positioned(
            top: Dimensions.height50,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_outlined,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),

          //text container position for introduction of food
          Positioned(
            top: Dimensions.popularFoodImageHeight - 20,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.height20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: 'Veggie Burger',
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: 'Introduce'),
                  SizedBox(
                    height: Dimensions.height20,
                  ),

                  //expandable text widget
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              'The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //Bottom Navigator Bar Container
      bottomNavigationBar: Container(
        height: Dimensions.bottomNavBarHeight,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height20,
          horizontal: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonbackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Dimensions.radius20,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove_outlined,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  BigText(text: '0'),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  Icon(
                    Icons.add_outlined,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(
                  Dimensions.radius20,
                ),
              ),
              child: BigText(
                text: '\$2.50 | Add to Cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
