import 'package:food_delivery_app/constants/app_constants.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularproductRepo extends GetxService {
  final ApiClient apiClient;
  PopularproductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    
    
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
    
    
  }
  
}
