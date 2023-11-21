import 'package:flutter/material.dart';

import 'buttonsAndTextFeilds.dart';

class AddWrdsBody extends StatelessWidget {


  const AddWrdsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(color: Color(0xFF628EEC)),
              )),
          const Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [],
              )),
          Positioned(
              top: 130,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 520,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    viewButtonsAndTextFeilds(),
                  ],
                ),
              )),
        ],
      ),
    );
  }

}
// SizedBox buildSizedBox(BuildContext context) {
//   return
// }
