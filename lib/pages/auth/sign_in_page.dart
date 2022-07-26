import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/base/show_custom_snackbar.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
     
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

       if (email.isEmpty) {
        showCustomSnackBar('Enter your email address', title: 'Email Address');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('Enter your valid email address',
            title: 'Valid email address');
      } else if (password.isEmpty) {
        showCustomSnackBar('Enter your password', title: 'password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password can not be less than six characters',
            title: 'Password');
      } else {

        authController.login(email, password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          } else{
            showCustomSnackBar(status.message);
          }
        }); 
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<AuthController>(
          builder: (authController) {
            return !authController.isLoading ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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

                  //welcome section
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(
                            fontSize: Dimensions.fontSize20 * 3 +
                                Dimensions.fontSize20 / 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Sign into your account',
                          style: TextStyle(
                            fontSize: Dimensions.fontSize20,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
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
                    isObscure: true,
                    hintText: 'Password',
                    icon: Icons.lock_outline_sharp,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),

                  //tag line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Sign into your account',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width20,
                      )
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.04,
                  ),

                  //sign in button
                  GestureDetector(
                    onTap: (){
                      _login(authController);
                    },
                    child: Container(
                      width: Dimensions.screenWidth / 2,
                      height: Dimensions.screenHeight / 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                        color: AppColors.mainColor,
                      ),
                      child: Center(
                        child: BigText(
                          text: 'Sign in',
                          size: Dimensions.fontSize14 * 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: Dimensions.screenHeight * 0.04,
                  ),

                  //sign up options
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.fontSize20,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(
                                  () => SignUpPage(),
                                  transition: Transition.fade,
                                ),
                          text: ' Create',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainBlackColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ) : const CustomLoader();
          }
        ),
      ),
    );
  }
}
