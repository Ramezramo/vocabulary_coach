import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Features/addingNewWordFeature/presentation/manger/cubit/vocab_cubet_cubit.dart';
// import 'Features/addingNewWordFeature/presentation/manger/words_cubit/vocab_cubet_cubit.dart';
import 'Features/addingNewWordFeature/presentation/views/addingNewWordPage.dart';
import 'Features/homePage/presentation/views/homePageFile.dart';
import 'Features/wordMemorization/presentation/views/wordMemorization.dart';
import 'Features/wordsAddedReview/presentation/views/wordsAddedReview.dart';

import 'core/utils/app_router.dart';
import 'core/utils/colorConstants.dart';
import 'core/utils/databaseXoperations/WriteOnDataBase.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MakeChangesDBM databaseClass = MakeChangesDBM();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//
//   const MyApp({super.key});
//
//   // This widget is the rootd of your dpplication.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => VocabCubetCubit(),
//       child: MaterialApp(
//         // title: 'Flutter Demo',
//         theme: ThemeData(
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       ),
//     );
//   }
// }
// import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
// import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
// import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
// import 'package:bookly/constants.dart';
// import 'package:bookly/core/utils/api_service.dart';
// import 'package:bookly/core/utils/app_router.dart';
// import 'package:bookly/core/utils/service_locator.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'Features/Splash/presentation/views/splash_view.dart';
//
// void main() {
//   setupServiceLocator();
//   runApp(const Bookly());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VocabCubetCubit(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          // scaffoldBackgroundColor: kPrimaryColor,
          textTheme:const TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            // bodyText2: TextStyle(color: Colors.black),
            // headline1: TextStyle(color: Colors.black),
            // headline2: TextStyle(color: Colors.black),
          )
          // GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),


    ),
    )
    );
  }
}