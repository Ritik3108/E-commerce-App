import 'package:flutter/material.dart';
import 'package:fooddapp/utils/dimensions.dart';
import 'package:fooddapp/widgets/app_column.dart';
import 'package:fooddapp/widgets/app_icon.dart';
import 'package:fooddapp/widgets/big_text.dart';
import 'package:fooddapp/widgets/expandable_text_widget.dart';
import 'package:fooddapp/widgets/icons_and_text_widgets.dart';
import 'package:fooddapp/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/food0.png"))),
              )),
          Positioned(
              top: Dimension.height45,
              left: Dimension.width20,
              right: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimension.popularFoodImgSize - 20,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimension.width20,
                      right: Dimension.width20,
                      top: Dimension.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimension.radius20),
                      topLeft: Radius.circular(Dimension.radius20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: "",
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  "assets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.pngassets/images/food0.png"),
                        ),
                      ),
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.bottomHeightBar,
        padding: EdgeInsets.only(
            left: Dimension.width20,
            right: Dimension.width20,
            top: Dimension.height30,
            bottom: Dimension.height30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimension.radius20 * 2),
            topLeft: Radius.circular(Dimension.radius20 * 2),
          ),
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height20,
                  bottom: Dimension.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.radius20)),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
                    top: Dimension.height20,
                    bottom: Dimension.height20),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(Dimension.radius20)),
                child: BigText(
                  text: "\$10 | Add to cart",
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
