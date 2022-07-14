import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCarItems => _inCartItems + _quantity;


  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print('got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print('increment');
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print('decrement ${_quantity.toString()}');
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        'Item count',
        'You can\'t reduce more !',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        'Item count',
        'You can\'t add more !',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart){
  
    _quantity = 0;
    _inCartItems = 0;

    _cart = cart;
    bool exist = false;
    exist = _cart.existInCart(product);
    //if exist 
    //get from storage _inCartItems = 3

   

    // print('exist or not ${exist.toString()}');

    if(exist){
      _inCartItems = cart.getQuantity(product);
    }
    print('The quantity in the cart is ${_inCartItems.toString()}');



  }

  void addItem(ProductModel product){
    // if(_quantity > 0){
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _cart.items.forEach((key, value) { 
      print('The id is ${value.id.toString()} The quantiy is ${value.quantity.toString()}');
    });
    // } else{
    //   Get.snackbar(
    //     'Item count',
    //     'You should add at least an item in the cart',
    //     backgroundColor: AppColors.mainColor,
    //     colorText: Colors.white,
    //   );

    // }

  }
}
