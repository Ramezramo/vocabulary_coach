import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'conge_data_base_state.dart';

class CongeDataBaseCubit extends Cubit<CongeDataBaseState> {
  CongeDataBaseCubit() : super(CongeDataBaseInitial());
  void dataBAseChange()  async {
    DataBAseChanged.dbChangedOrNot = true;
    if (DataBAseChanged.dbChangedOrNot){

      // print("dataBAseChange");
      emit(DataBAseChanged());
    }
  }
  void discordChangesInDataBAse(){
    // print("discord Changes in Data Base");
    DataBAseChanged.dbChangedOrNot = false;
  }
}
