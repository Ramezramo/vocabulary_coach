import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> readDataFromFireBase() async {
  late Map<String, dynamic> thePhrases;
  String? theText;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final docRef = db.collection("books").doc("8I0vkfPjS7Bxiw36ImBN").get();
  await docRef.then(
    (DocumentSnapshot doc) {
      ///this is the data base MAP contains all data in the collection <<book>>
      ///with the collection name  <<8I0vkfPjS7Bxiw36ImBN>>
      thePhrases = doc.data() as Map<String, dynamic>;

      ///you can choose the data that you want from here
      theText = thePhrases["poordadrichdad"]["page1"];
      return theText;
    },
    onError: (e) => print("Error getting document: $e"),
  );
  // print(theText);
  return theText;
}
