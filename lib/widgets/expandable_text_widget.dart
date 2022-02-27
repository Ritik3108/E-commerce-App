import 'package:flutter/material.dart';
import 'package:fooddapp/utils/dimensions.dart';
import 'package:fooddapp/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimension.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? SmallText(
                size: Dimension.font16,
                height: 1.8,
                color: Colors.grey,
                text: firstHalf)
            : Column(
                children: [
                  SmallText(
                      size: Dimension.font16,
                      color: Colors.grey,
                      height: 1.8,
                      text: hiddenText
                          ? (firstHalf + '...')
                          : (firstHalf + secondHalf)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          hiddenText = !hiddenText;
                        });
                      },
                      child: Row(
                        children: [
                          SmallText(
                            text: hiddenText ? "Show more" : "Show less",
                            color: Colors.blue,
                          ),
                          Icon(
                            hiddenText
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: Colors.blue,
                          )
                        ],
                      ))
                ],
              ));
  }
}
