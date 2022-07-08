import 'package:get/get.dart';

class Dimensions{
  //height : 825
  //width : 392
  
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dynamic vertical and horizontal size for basePadding
  static double verticalSize = screenHeight/103.125;
  static double horizontalSize = screenWidth/24.5;

  //dynamic height of Container
  static double pageView = screenHeight/2.578;
  static double pageViewContainer = screenHeight/3.75;
  static double pageViewTextContainer = screenHeight/6.875;

  //dynamic height for top and bottom padding and margin
  static double height10 = screenHeight/82.5;
  static double height15 = screenHeight/55;
  static double height20 = screenHeight/41.25;
  static double height30 = screenHeight/27.5;

  //dynamic width for right and left padding and margin
  static double width5 = screenWidth/78.4;
  static double width10 = screenWidth/39.2;
  static double width15 = screenWidth/26.13;
  static double width20 = screenWidth/19.6;
  static double width30 = screenWidth/13.06;

  
  //dynamic font size
  static double fontSize12 = screenHeight/68.75;
  static double fontSize20 = screenHeight/41.25;

  //dynamic borderRadius
  static double radius15 = screenHeight/55;
  static double radius20 = screenHeight/41.25;
  static double radius30 = screenHeight/27.5;

  //dynamic icon size
  static double iconSize24 = screenHeight/34.375;

  //dynamic size of image container and text container used in ListView
  static double listViewImageHeight = screenHeight/6.875;
  static double listViewImageWidth = screenWidth/3.267;

  static double listViewTextContainerHeight = screenHeight/8.25;
  
}