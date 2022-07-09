import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class PopularProductController extends GetxController {
  final PopularproductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;


  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();

        
    if(response.statusCode == 200){
  
      print('got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
      
      
    } else{
      

    }
 
  }

}
