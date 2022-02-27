import 'package:fooddapp/controllers/popular_product_controller.dart';
import 'package:fooddapp/data/api/api_client.dart';
import 'package:fooddapp/data/repositories/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: "appBaseUrl"));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
