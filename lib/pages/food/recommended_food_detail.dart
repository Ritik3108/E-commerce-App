import 'package:flutter/material.dart';
import 'package:fooddapp/utils/dimensions.dart';
import 'package:fooddapp/widgets/app_icon.dart';
import 'package:fooddapp/widgets/big_text.dart';
import 'package:fooddapp/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child:
                        BigText(size: Dimension.font26, text: "Chinese Side")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimension.radius20),
                    topLeft: Radius.circular(Dimension.radius20),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.orange,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimension.width20, right: Dimension.width20),
                  child: ExpandableTextWidget(
                    text:
                        "Chinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese Side",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimension.width20 * 2.5,
                right: Dimension.width20 * 2.5,
                top: Dimension.height10,
                bottom: Dimension.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimension.iconSize24,
                  icon: Icons.remove,
                  backgroundColor: Colors.blue,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$12.88 " + " X " + " 0 ",
                  color: Colors.black,
                  size: Dimension.font26,
                ),
                AppIcon(
                    iconSize: Dimension.iconSize24,
                    icon: Icons.add,
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white)
              ],
            ),
          ),
          Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimension.radius20)),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.blue,
                    )),
                Container(
                    padding: EdgeInsets.only(
                        left: Dimension.width20,
                        right: Dimension.width20,
                        top: Dimension.height20,
                        bottom: Dimension.height20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.circular(Dimension.radius20)),
                    child: BigText(
                      text: "\$10 | Add to cart",
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
