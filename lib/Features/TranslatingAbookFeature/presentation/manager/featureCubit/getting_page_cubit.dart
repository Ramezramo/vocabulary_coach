import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

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

Future<String?> readDataFromFireBase()async {
  late Map<String, dynamic> thePhrases;
  String? theText;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final docRef = db.collection("books").doc("8I0vkfPjS7Bxiw36ImBN").get();
  await docRef.then(
        (DocumentSnapshot doc) {
      thePhrases = doc.data() as Map<String, dynamic>;
      theText = thePhrases["poordadrichdad"]["page1"];
      return theText;
    },
    onError: (e) => print("Error getting document: $e"),
  );
  print("235_#4636");
  print(theText);
  return theText;
}

Future<List<String>?> getDateFromDb() async {
  print("23534_5634573");
  String? theText = await readDataFromFireBase();
  List<String>? phrasesSplited = theText?.split("<spl>");
  return phrasesSplited;
}
