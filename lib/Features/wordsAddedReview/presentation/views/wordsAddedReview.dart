import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../addingNewWordFeature/presentation/manger/cubit/vocab_cubet_cubit.dart';
// import '../../../addingNewWordFeature/presentation/manger/words_cubit/vocab_cubet_cubit.dart';

// import '../../core/cubit/vocab_cubet_cubit.dart';
// import '../cubit/vocab_cubet_cubit.dart';


class wordsAdded extends StatelessWidget {
  wordsAdded({Key? key}) : super(key: key);

  var wordsIntheCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VocabCubetCubit,VocabCubetState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is addedNewWord){
          wordsIntheCubit = BlocProvider.of<VocabCubetCubit>(context).wordsInCubit;
        }
      },
      builder: (context, state) {
        return Container(
          child: Center(
            child: Text(
                "${BlocProvider.of<VocabCubetCubit>(context).wordsInCubit}"
            ),
          ),
        );
      },
    );
  }
}
