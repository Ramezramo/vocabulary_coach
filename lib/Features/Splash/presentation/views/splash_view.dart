// import 'package:bookly_app_with_tharwat/Features/Splash/presentation/views/widgets/splash_view_body.dart';
// import 'package:bookly_app_with_tharwat_app_with_tharwat/Features/Splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vocabulary_coach/Features/Splash/presentation/views/widgets/splash_view_body.dart';
// import 'package:reusableclasses/Features/Splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewbody(),
    );
  }
}
