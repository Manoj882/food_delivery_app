import 'package:food_delivery_app/constants/app_constants.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/user_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/data/repository/user_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/recommendec_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async{

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);


  //loading for api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  //loading for repos
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedproductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));

  

}