import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/app_constants.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommendec_product_controller.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/pages/food/popular_food_details.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/app_column.dart';
import 'package:food_delivery_app/utils/show_icon_and_text_row.dart';
import 'package:get/get.dart';
import '/utils/app_colors.dart';
import '/utils/dimension.dart';

import '/widgets/big_text.dart';
import '/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        // print('Current value is ${_currentPageValue.toString()}');
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider for popular food section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded ? Container(
            height: Dimensions.pageView,
            // color: Colors.red,
            child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context, index) {
                return _buildPageItem(index, popularProducts.popularProductList[index]);
              },
            ),
          )
          : CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),

        //dots indicator
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        SizedBox(
          height: Dimensions.height30,
        ),

        //Recommended text
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 3,
                ),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 3,
                ),
                child: SmallText(
                  text: 'Food pairing',
                ),
              ),
            ],
          ),
        ),

        //List of recommended food and images
       GetBuilder<RecommendedProductController>(
         builder: (recommendedProduct) {
           return recommendedProduct.isLoaded ? Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                  ),
                  child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        // primary: false,
                        shrinkWrap: true,
                        itemCount: recommendedProduct.recommendedProductList.length,
                        itemBuilder: (context, index) {
                         
                          return _buildRecommendedListViewItem(index, recommendedProduct.recommendedProductList[index]);
                        },
                      ),
                      ) : const CircularProgressIndicator();
                    }
       ),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      //current page
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      //next page
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale,
          1); //220*(1-0.8)/2 = 220 * 1/10 == 22 pixel goes down
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      //next page
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);
    } else {
      var currentScale = 0.8;
      var currentTransformation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransformation, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index, 'home'));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              decoration: BoxDecoration(
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: DecorationImage(
                  image: NetworkImage(
                    '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${popularProduct.img!}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    right: Dimensions.height15,
                    left: Dimensions.width15),
                width: double.infinity,
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedListViewItem(int index, ProductModel recommendedProduct){
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteHelper.getRecommendedFood(index, 'home'));
      },
      child: Container(
          margin: EdgeInsets.only(
            bottom: Dimensions.height10,
          ),
          child: Row(
            children: [
              //image container
              Container(
                height: Dimensions.listViewImageHeight,
                width: Dimensions.listViewImageWidth,
                decoration: BoxDecoration(                            
                  color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
                  borderRadius: BorderRadius.circular(
                    Dimensions.height20,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${recommendedProduct.img!}',
                      
                    ),
                    
                    fit: BoxFit.cover,
                  ),
                ),
              ),
    
              //text container
              Expanded(
                child: Container(
                  height: Dimensions.listViewTextContainerHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      bottomRight: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.width10,
                      right: Dimensions.width10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: recommendedProduct.name!),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        SmallText(text: 'With German Characteristics'),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        ShowIconAndTextRow().showIconAndTextRow(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
