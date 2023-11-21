import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:vocabulary_coach/srcW/CONSTANTS/colorConstants.dart';
// import 'package:vocabulary_coach/srcW/pages/addingNewWordPage.dart';
// import 'package:vocabulary_coach/srcW/pages/wordMemorization.dart';
// import 'package:vocabulary_coach/srcW/pages/wordsAddedReview.dart';
//
// import 'core/cubit/vocab_cubet_cubit.dart';
// import 'core/databaseXoperations/WriteOnDataBase.dart';
import 'Features/addingNewWordFeature/presentation/manger/words_cubit/vocab_cubet_cubit.dart';
import 'Features/addingNewWordFeature/presentation/views/addingNewWordPage.dart';
import 'Features/homePage/presentation/views/homePageFile.dart';
import 'Features/wordMemorization/presentation/views/wordMemorization.dart';
import 'Features/wordsAddedReview/presentation/views/wordsAddedReview.dart';
import 'core/utils/app_router.dart';
import 'core/utils/colorConstants.dart';
import 'core/utils/databaseXoperations/WriteOnDataBase.dart';
import 'core/utils/service_locator.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ...

MakeChangesDBM databaseClass = MakeChangesDBM();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(MyApp());
}
// import 'package:dio/dio.dart';
//
// void main() {
//
//   runApp(const appName());
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
          // textTheme:
          //     GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
//
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
