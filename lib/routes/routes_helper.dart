import 'package:food_delivery_app/pages/food/popular_food_details.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

import '../pages/food/recommended_food_details.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPageScreen()),

    //popular food page
    GetPage(name: popularFood, page: () {
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetailsPage(pageId: int.parse(pageId!));
    },
    transition: Transition.fadeIn,
    ),

     //recommended food page
     GetPage(name: recommendedFood, page: () {
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetailsPage(pageId: int.parse(pageId!));
    },
    transition: Transition.fadeIn,
    ),


  ];
}