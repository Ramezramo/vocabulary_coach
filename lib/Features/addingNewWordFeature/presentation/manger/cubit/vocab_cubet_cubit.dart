import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vocab_cubet_state.dart';

class VocabCubetCubit extends Cubit<VocabCubetState> {
  VocabCubetCubit() : super(VocabCubetInitial());

  List wordsInCubit = [];
  void addWordToCubit(String word){
    wordsInCubit.add(word);
    // print(wordsInCubit);
    emit(addedNewWord());
  }

}
