import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Features/TranslatingAbookFeature/presentation/manager/dataBaseChangedCubit/conge_data_base_cubit.dart';
import 'Features/TranslatingAbookFeature/presentation/manager/featureCubit/getting_page_cubit.dart';
import 'Features/addingNewWordFeature/presentation/manger/cubit/vocab_cubet_cubit.dart';
import 'core/utils/app_router.dart';

import 'core/utils/databaseXoperations/WriteOnDataBase.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MakeChangesDBM databaseClass = MakeChangesDBM();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  databaseClass.forceLogin();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => CongeDataBaseCubit()),
        BlocProvider(create: (context) => VocabCubetCubit()),
        BlocProvider(create: (context) => GettingPageCubit()),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF628EEC),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black87),
            // Customize other text styles as needed
          ),
        ),
    )
    );
  }
}