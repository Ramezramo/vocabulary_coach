import 'package:flutter/material.dart';
import 'package:vocabulary_coach/Features/TranslatingAbookFeature/presentation/views/widgets/trasnlating_page_body.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:vocabulary_coach/Features/Splash/presentation/views/widgets/splash_view_body.dart';
// // import 'package:reusableclasses/Features/Splash/presentation/views/widgets/splash_view_body.dart';

class translatingBookMain extends StatelessWidget {
  const translatingBookMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: translatingBookPage(),
    );
  }
}
