import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fooddapp/controllers/popular_product_controller.dart';
import 'package:fooddapp/controllers/recommended_product_controller.dart';
import 'package:fooddapp/models/products_model.dart';
import 'package:fooddapp/pages/food/popular_food_detail.dart';
import 'package:fooddapp/routes/route_helper.dart';
import 'package:fooddapp/utils/app_constants.dart';
import 'package:fooddapp/utils/dimensions.dart';
import 'package:fooddapp/widgets/app_column.dart';
import 'package:fooddapp/widgets/big_text.dart';
import 'package:fooddapp/widgets/icons_and_text_widgets.dart';
import 'package:fooddapp/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;
  @override
  void initState() {
    super.initState();
    setState(() {
      pageController.addListener(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimension.pageView,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getPopularFood());
                    },
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularProducts.popularProductList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position,
                              popularProducts.popularProductList[position]);
                        }),
                  ),
                )
              : CircularProgressIndicator(
                  color: Colors.blue,
                );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
                activeColor: Colors.blue,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
        }),
        SizedBox(
          height: Dimension.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: SmallText(text: "Food pairing"))
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimension.width20,
                            right: Dimension.width20,
                            bottom: Dimension.height10),
                        child: Row(
                          children: [
                            Container(
                              width: Dimension.listViewImgSize,
                              height: Dimension.listViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimension.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          AppConstants.BASE_URL +
                                              AppConstants.UPLOAD_URL +
                                              recommendedProducts
                                                  .recommendedProductList[index]
                                                  .img!))),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimension.listViewTextContSize,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(Dimension.radius20),
                                        bottomRight: Radius.circular(
                                            Dimension.radius20))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimension.width10,
                                      right: Dimension.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProducts
                                              .recommendedProductList[index]
                                              .name!),
                                      SizedBox(
                                        height: Dimension.height10,
                                      ),
                                      SmallText(
                                          text: "with chinese characteristics"),
                                      SizedBox(
                                        height: Dimension.height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor: Colors.orange),
                                          IconAndTextWidget(
                                              icon: Icons.location_on,
                                              text: "1.7km",
                                              iconColor: Colors.blue),
                                          IconAndTextWidget(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: Colors.red)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: Colors.blue,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: Dimension.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimension.width10, right: Dimension.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                color: index.isEven ? Color(0XFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularProduct.img!))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                  bottom: Dimension.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height15, left: 15, right: 15),
                  child: AppColumn(
                    text: popularProduct.name!,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
