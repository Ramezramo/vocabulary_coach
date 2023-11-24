import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../insideTheBookTranslation.dart';

class translatingBookPage extends StatelessWidget {
  const translatingBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onLongPress: () {},
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InsideBookPage(),
                  ),
                );
                // Navigator.push(InsideBookPage() as BuildContext);
              },
              title: const Row(
                children: [
                  // Icon(Icons.accessibility_new_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align text to the beginning
                      children: [
                        Text(
                          "poor dad rich dad",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "lines",
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: 5,
              thickness: 1.4,
            ),
          ],
        );
      },
    );
  }
}
