import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/app_constants.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utils/app_column.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

import '../../widgets/big_text.dart';

class PopularFoodDetailsPage extends StatelessWidget {
  const PopularFoodDetailsPage({required this.pageId, Key? key})
      : super(key: key);

  final int pageId;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    // print('Page id is ${pageId.toString()}');
   

    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    

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
                  image: NetworkImage(
                    '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${product.img}',
                  ),
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodPageScreen());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios_outlined,
                  ),
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
                    text: product.name,
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
                        text: product.description,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //Bottom Navigator Bar Container
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
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
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove_outlined,
                        color: AppColors.signColor,
                      ),
                    ),

                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    BigText(text: popularProduct.inCarItems.toString()),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    //
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add_outlined,
                        color: AppColors.signColor,
                      ),
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
                child: GestureDetector(
                  onTap: (){
                    popularProduct.addItem(product);
                  },
                  child: BigText(
                    text: '\$${product.price} | Add to Cart',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
