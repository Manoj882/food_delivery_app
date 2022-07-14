import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../utils/app_colors.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity){
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),

        );
      });

    } else{

      if(quantity > 0){
        _items.putIfAbsent(product.id!, () { 

          return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
        });
      } else{
         Get.snackbar(
        'Item count',
        'You should add at least an item in the cart',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );

      }
    }

    // // print('Length of the item is ${_items.length.toString()}');
    
    //   _items.putIfAbsent(product.id!, () { 

    //   // print('adding item to the cart ${product.id.toString()} Quantity: ${quantity.toString()}');

    //   // _items.forEach((key, value) { 
    //   //   print('quantity is ${value.quantity.toString()}');
    //   // });

    //   return CartModel(
    //   id: product.id,
    //   name: product.name,
    //   price: product.price,
    //   img: product.img,
    //   quantity: quantity,
    //   isExist: true,
    //   time: DateTime.now().toString(),
    // );
    // });
    

  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity = 0;
    if(_items.containsKey(product.id!)){
      _items.forEach((key, value) { 
        if(key == product.id){
          quantity = value.quantity!;

        }
      });
    }
    return quantity;
  }
}