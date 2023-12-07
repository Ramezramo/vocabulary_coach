import 'package:flutter/material.dart';
import 'package:vocabulary_coach/Features/TranslatingAbookFeature/presentation/views/widgets/trasnlating_page_body.dart';

import '../../../../core/utils/colorConstants.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:vocabulary_coach/Features/Splash/presentation/views/widgets/splash_view_body.dart';
// // import 'package:reusableclasses/Features/Splash/presentation/views/widgets/splash_view_body.dart';

class translatingBookMain extends StatelessWidget {
  const translatingBookMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        // actions: const <Widget>[
        // ],
        title: Text("books",
            style:  TextStyle(color: clr_textColor)),
        backgroundColor: clr_UpNavigationBar,
        iconTheme:
        IconThemeData(color: clr_textColor), // Change the color here
      ),
      body: const translatingBookPage(),
    );
  }
}
