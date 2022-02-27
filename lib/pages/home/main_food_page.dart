import 'package:flutter/material.dart';
import 'package:fooddapp/pages/home/food_page_body.dart';
import 'package:fooddapp/utils/dimensions.dart';
import 'package:fooddapp/widgets/big_text.dart';
import 'package:fooddapp/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current device height is " +
        MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimension.height45, bottom: Dimension.height15),
              padding: EdgeInsets.only(
                  left: Dimension.width20, right: Dimension.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "India",
                        color: Colors.purpleAccent,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Muradnagar",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_up_rounded),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: Dimension.height45,
                    height: Dimension.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimension.iconSize24,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimension.radius15)),
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }
}
