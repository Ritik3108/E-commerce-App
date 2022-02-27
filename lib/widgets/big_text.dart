import 'package:flutter/material.dart';
import 'package:fooddapp/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      this.size = 0,
      required this.text,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? Dimension.font20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
