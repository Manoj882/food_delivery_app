

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      'facebook.png',
      'Google.png',
      'twitter.png',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //app logo
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage(
                      'assets/images/splash_logo.PNG',
                    ),
                  ),
                ),
              ),
        
              //email
              AppTextField(
                textController: emailController,
                hintText: 'Email',
                icon: Icons.email_outlined,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              //password
              AppTextField(
                textController: passwordController,
                hintText: 'Password',
                icon: Icons.lock_outline_sharp,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              //name
              AppTextField(
                textController: nameController,
                hintText: 'Name',
                icon: Icons.person_outlined,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              //phone
              AppTextField(
                textController: phoneController,
                hintText: 'Phone',
                icon: Icons.phone_outlined,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
        
              //sign up button
              Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: 'Sign up',
                    size: Dimensions.fontSize14 * 2,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
        
              //tag line
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: 'Have an account already?',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.fontSize20,
                  ),
                ),
              ),
        
              SizedBox(
                height: Dimensions.screenHeight * 0.04,
              ),
        
              //sign up options
              RichText(
                text: TextSpan(
                  text: 'Sign up using one of the following methods',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.fontSize16,
                  ),
                ),
              ),
              Wrap(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: Dimensions.radius30,
                      backgroundImage: AssetImage(
                        'assets/images/${signUpImages[index]}'
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
