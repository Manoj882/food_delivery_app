import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommendec_product_controller.dart';
import 'package:food_delivery_app/pages/auth/sign_in_page.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/pages/carts/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_details.dart';
import 'package:food_delivery_app/pages/food/recommended_food_details.dart';
import 'package:food_delivery_app/pages/splash/splash_page.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:get/get.dart';

import 'pages/home/main_food_page.dart';

import 'helper/dependencies.dart' as dep;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData(); 
   
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,

              // home: SignInPage(),

              // home: SplashScreen(),
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,



              //home: CartPage(),
              // home: MainFoodPageScreen(),
              // home: const PopularFoodDetailsPage(),
              // home: const RecommendedFoodDetailsPage(),
            );
          }
        );
      }
    );
  }
}

