part of 'conge_data_base_cubit.dart';

@immutable
abstract class CongeDataBaseState {}

class CongeDataBaseInitial extends CongeDataBaseState {}
class DataBAseChanged extends CongeDataBaseState{
  static bool dbChangedOrNot = false;

}
