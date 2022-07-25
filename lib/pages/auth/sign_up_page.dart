import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/base/show_custom_snackbar.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/models/signup_body_model.dart';
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

    void _registration(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar('Enter your name', title: 'Name');
      } else if (phone.isEmpty) {
        showCustomSnackBar('Enter your phone number', title: 'Phone Number');
      } else if (email.isEmpty) {
        showCustomSnackBar('Enter your email address', title: 'Email Address');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('Enter your valid email address',
            title: 'Valid email address');
      } else if (password.isEmail) {
        showCustomSnackBar('Enter your password', title: 'password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password can not be less than six characters',
            title: 'Password');
      } else {
        showCustomSnackBar('All went well', title: 'Perfect');
        SignUpBody signUpBody = SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        // print(signUpBody.toString());

        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print('Success registration');
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
          builder: (_authController) {
            return !_authController.isLoading ? SingleChildScrollView(
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
                    isObscure: true,
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
                  GestureDetector(
                    onTap: () {
                      _registration(_authController);
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
                          text: 'Sign up',
                          size: Dimensions.fontSize14 * 2,
                          color: Colors.white,
                        ),
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
                          backgroundImage:
                              AssetImage('assets/images/${signUpImages[index]}'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ) 
            : const CustomLoader();
          }
        ),
      ),
    );
  }
}
