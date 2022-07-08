import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/constant.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

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

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      // color: Colors.red,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildPageItem(index);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if(index == _currentPageValue.floor()){ //current page
      var currentScale = 1-(_currentPageValue-index) * (1-_scaleFactor);
      var currentTransformation = _height * (1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);

    }else if(index == _currentPageValue.floor()+1){ //next page
      var currentScale = _scaleFactor + (_currentPageValue-index+1) * (1-_scaleFactor);
      var currentTransformation = _height * (1-currentScale)/2; 
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);//220*(1-0.8)/2 = 220 * 1/10 == 22 pixel goes down
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);

    }else if(index == _currentPageValue.floor()-1){ //next page
      var currentScale = 1-(_currentPageValue-index) * (1-_scaleFactor);
      var currentTransformation = _height * (1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);

    }else{
      var currentScale = 0.8;
      var currentTransformation = _height * (1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);
      
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/burger.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Veggie Burgers'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star_outlined,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '4.5'),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: '1270'),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: 'comments'),
                        
                      ],
                    ),
                    const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: 'Normal',
                              iconColor: AppColors.iconColor1,
                            ),
                            IconAndTextWidget(
                              icon: Icons.location_on_outlined,
                              text: '1.5km',
                              iconColor: AppColors.mainColor,
                            ),
                            IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: '23min',
                              iconColor: AppColors.iconColor2,
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
