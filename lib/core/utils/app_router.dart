// import 'package:bookly_app_with_tharwat/Features/home/presentation/views/book_details_view.dart';
// import 'package:bookly_app_with_tharwat/Features/home/presentation/views/home_view.dart';
// import 'package:bookly_app_with_tharwat/Features/search/presentation/views/search_view.dart';
// import 'package:go_router/go_router.dart';

import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/addingNewWordFeature/presentation/views/addingNewWordPage.dart';
import '../../Features/homePage/presentation/views/homePageFile.dart';
import '../../Features/wordMemorization/presentation/views/wordMemorization.dart';
import '../../Features/wordsAddedReview/presentation/views/wordsAddedReview.dart';
// import '../../Features/home/presentation/views/book_details_view.dart';
// import '../../Features/home/presentation/views/home_view.dart';
// import '../../Features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kAddWordPage = '/addWordPage';
  static const kWordMemorizationPage = '/wordMemorizationPage';
  static const kWordsAdded = '/wordsAdded';
  static const kmyHomePage = '/MyHomePage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kmyHomePage,
        builder: (context, state) => const MyHomePage(title: 'hola ',),
      ),
      GoRoute(
        path: kAddWordPage,
        builder: (context, state) => const addWordPage(),
      ),
      GoRoute(
        path: kWordMemorizationPage,
        builder: (context, state) => const wordMemorizationPage(),
      ),
      GoRoute(
        path: kWordsAdded,
        builder: (context, state) =>  wordsAdded(),
      ),
    ],
  );
}
