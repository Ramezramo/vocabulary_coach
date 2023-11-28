import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/databaseXoperations/read_from_data_base_fb.dart';

part 'getting_page_state.dart';

class GettingPageCubit extends Cubit<GettingPageState> {
  GettingPageCubit() : super(GettingPageInitial());

  List<String> getDateFromDb() {
    String text =
        """  """;

    List<String> phrasesSplited = text.split("<spl>");
    // print(phrasesSplited.length);
    emit(SuccessPage(phrasesSplited));
    return phrasesSplited;
  }
}


