import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetailsPage extends StatelessWidget {
  const RecommendedFoodDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.clear_outlined,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                  child: BigText(
                    text: 'Sliver App Bar',
                    size: Dimensions.fontSize26,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/burger.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableTextWidget(
                      text:
                          'The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide.'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height10,
              horizontal: Dimensions.width20 * 2.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove_outlined,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: '\$10.75  X  0',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.fontSize26,
                ),
                AppIcon(
                  icon: Icons.add_outlined,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite_outlined,
                    color: AppColors.mainColor,  
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
        ],
      ),
    );
  }
}
