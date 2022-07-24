import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommendec_product_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '/constants/constant.dart';

import '/utils/app_colors.dart';
import '/utils/dimension.dart';
import '/widgets/big_text.dart';
import '/widgets/small_text.dart';
import 'food_page_body.dart';

class MainFoodPageScreen extends StatefulWidget {
  const MainFoodPageScreen({Key? key}) : super(key: key);

  @override
  State<MainFoodPageScreen> createState() => _MainFoodPageScreenState();
}

class _MainFoodPageScreenState extends State<MainFoodPageScreen> {
  Future<void>_loadResource()async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    
    return RefreshIndicator(
      onRefresh: _loadResource,
      child: SafeArea(
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
