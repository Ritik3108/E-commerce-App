import 'package:flutter/material.dart';
import 'package:fooddapp/controllers/popular_product_controller.dart';
import 'package:fooddapp/controllers/recommended_product_controller.dart';
import 'package:fooddapp/pages/home/food_page_body.dart';
import 'package:fooddapp/pages/home/main_food_page.dart';
import 'package:fooddapp/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      home: MainFoodPage(),
    );
  }
}
