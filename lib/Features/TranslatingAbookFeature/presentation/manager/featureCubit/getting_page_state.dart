part of 'getting_page_cubit.dart';

@immutable
abstract class GettingPageState {}

class GettingPageInitial extends GettingPageState {}
class SuccessPage extends GettingPageState {
  List<String> phrasesSplited;
   SuccessPage(this.phrasesSplited);
}
class FailurePage extends GettingPageState {

}
