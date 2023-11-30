import 'package:flutter/material.dart';

import '../../../../../core/utils/colorConstants.dart';
class BubbleContainer extends StatelessWidget {
  final String borderRadiosIsTop;
  final TextDirection textDirection;
  const BubbleContainer(
      {Key? key,
        required this.text,
        required this.borderRadiosIsTop,
        required this.textDirection})
      : super(key: key);

  final String text;

  BorderRadiusGeometry? borderRadiusGeometry() {
    if (borderRadiosIsTop == "top") {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      );
    } else if (borderRadiosIsTop == "buttom") {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );
    } else {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = borderRadiusGeometry();
    return Column(
      mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
      children: [
        const SizedBox(
          height: 10,
        ),
        Material(
          borderRadius: borderRadius,
          elevation: 5.0,
          color: clr_4cardColor2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 12, right: 20),
              child: Text(
                textDirection: textDirection,
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}