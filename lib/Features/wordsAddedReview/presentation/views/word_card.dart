

import "package:flutter/foundation.dart";
import"package:flutter/material.dart";

class wordCardData extends StatelessWidget {
  late int index;
  late List<dynamic> websitesNames;
  late String translationValue;
   wordCardData({super.key,required  websitesNames, required  index, required translationValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onLongPress: () {
            if (kDebugMode) {
              print("long pressed");
            }

            // showAlertDialog(context,null,"besoes",websitesNames[index],false);
          },
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(userID: _userID,pagename: websitesNames[index],)));
            // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(pagename: keys[index],)));
          },
          title: Row(
            children: [
              const Icon(Icons.accessibility_new_outlined),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align text to the beginning
                  children: [
                    Text(
                      websitesNames[index],
                      style: const TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      translationValue.toString(),
                      style: const TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          // Add a Divider below each ListTile to separate the items
          endIndent: 20,
          thickness:
          1.4, // You can adjust the thickness as needed
        ),
      ],
    );
  }
}
//
// Column cardData(List<dynamic> websitesNames, int index, String translationValue) {
//   return ;
// }