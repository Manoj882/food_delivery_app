import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/account_widget.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: BigText(
          text: 'Profile',
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: Dimensions.height20,
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person_outlined,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height15 * 5,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            //name
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                    appIcon: AppIcon(
                    icon: Icons.person_outlined,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height50/2,
                    size: Dimensions.height50,
                  ),
                    bigText: BigText(text: 'Manoj'),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  //phone
                  AccountWidget(
                    appIcon: AppIcon(
                    icon: Icons.phone_outlined,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height50/2,
                    size: Dimensions.height50,
                  ),
                    bigText: BigText(text: '9823858256'),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  //email
                  AccountWidget(
                    appIcon: AppIcon(
                    icon: Icons.email_outlined,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height50/2,
                    size: Dimensions.height50,
                  ),
                    bigText: BigText(text: 'manojbk488@gmail.com'),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  //address
                  AccountWidget(
                    appIcon: AppIcon(
                    icon: Icons.location_on_outlined,
                    backgroundColor: AppColors.yellowColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height50/2,
                    size: Dimensions.height50,
                  ),
                    bigText: BigText(text: 'Fill in your address'),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  //message
                  AccountWidget(
                    appIcon: AppIcon(
                    icon: Icons.message_outlined,
                    backgroundColor: Colors.redAccent,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height50/2,
                    size: Dimensions.height50,
                  ),
                    bigText: BigText(text: 'Message'),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  //message
                  GestureDetector(
                    onTap: (){
                      if(Get.find<AuthController>().userLoggedIn()){
                        Get.find<AuthController>().clearSharedData();
                        Get.find<CartController>().clear();
                        Get.find<CartController>().clearCartHistory();
                        Get.offNamed(RouteHelper.getSignInPage());

                      } else{
                        print('You logged out');  
                      }
                      

                    },
                    child: AccountWidget(
                      appIcon: AppIcon(
                      icon: Icons.logout_outlined,
                      backgroundColor: Colors.redAccent,
                      iconColor: Colors.white,
                      iconSize: Dimensions.height50/2,
                      size: Dimensions.height50,
                    ),
                      bigText: BigText(text: 'Logout'),
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
