import 'package:food_delivery_app/constants/app_constants.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:get/get.dart';

class RecommendedproductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedproductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    
    
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
    
    
  }
  
}
