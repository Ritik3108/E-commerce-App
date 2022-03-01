import 'package:fooddapp/controllers/popular_product_controller.dart';
import 'package:fooddapp/controllers/recommended_product_controller.dart';
import 'package:fooddapp/data/api/api_client.dart';
import 'package:fooddapp/data/repositories/popular_product_repo.dart';
import 'package:fooddapp/data/repositories/recommended_product_repo.dart';
import 'package:fooddapp/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
