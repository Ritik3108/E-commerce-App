import 'package:flutter/material.dart';
import 'package:fooddapp/utils/dimensions.dart';
import 'package:fooddapp/widgets/big_text.dart';
import 'package:fooddapp/widgets/icons_and_text_widgets.dart';
import 'package:fooddapp/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimension.font26,
        ),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    )),
          ),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "4.5"),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "1287"),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "comments")
        ]),
        SizedBox(
          height: Dimension.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: Colors.orange),
            IconAndTextWidget(
                icon: Icons.location_on, text: "1.7km", iconColor: Colors.blue),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: Colors.red)
          ],
        )
      ],
    );
  }
}
