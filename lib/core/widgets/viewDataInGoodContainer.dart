// import 'package:flutter/cuper/tino.dart';
import 'package:flutter/material.dart';

class ShowTextInAGoodContainer extends StatelessWidget {
  final bool borderButtom;
  final bool textEnglish;
  const ShowTextInAGoodContainer(
      {super.key,
        required this.thePhrase,
        required this.borderButtom,
        required this.textEnglish});

  final String thePhrase;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: borderButtom
            ? const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10))
            : const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textDirection:
            textEnglish ? TextDirection.ltr : TextDirection.rtl,
            thePhrase,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}