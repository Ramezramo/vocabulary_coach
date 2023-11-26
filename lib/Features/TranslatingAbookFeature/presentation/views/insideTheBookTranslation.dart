
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_coach/Features/TranslatingAbookFeature/presentation/manager/featureCubit/getting_page_cubit.dart';

import '../../../../core/widgets/skeltonloading.dart';

final databaseReference = FirebaseDatabase.instance.reference();



class InsideBookPage extends StatefulWidget {
  const InsideBookPage({super.key});

  @override
  State<InsideBookPage> createState() => _InsideBookPageState();
}

class _InsideBookPageState extends State<InsideBookPage> {
  bool viewTextReceiver = false;
  int indexCount = 0;

  String collectionPath = "8I0vkfPjS7Bxiw36ImBN/ykUIOTASOjelAYHTe5Fx/";
  late String fieldName = "page1";

  List<String>? _thePhrases  ;
  bool loadOrNo = true;



  // List<QueryDocumentSnapshot> data = [];
  Future<void> gettingData() async {



      _thePhrases =  await getDateFromDb();
      print(_thePhrases);

      setState(() {
        loadOrNo = false;
      });



  }



  @override
  void initState() {
    super.initState();

    gettingData();
    // loadOrNo = ;


  }

  @override
  Widget build(BuildContext context) {
    // readField();

    // print(ref.);
// Access a child of the current reference
//     DatabaseReference child = ref.child("page1");
//     print(child.key); // "123"
    return Scaffold(
        backgroundColor: Color(0xFF628EEC),

        body:BlocConsumer<GettingPageCubit, GettingPageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return loadOrNo ?  ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => const NewsCardSkelton(),
              separatorBuilder: (context, index) =>
              const SizedBox(height: 16.0),
            ):SafeArea(
              child: ListView.builder(
                itemCount: _thePhrases?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        // await getDataBase();

                      },
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // Set mainAxisSize to MainAxisSize.min
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  _thePhrases![index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  TextField(
                                    // controller: _textEditingController,
                                    onChanged: (value) {
                                      // Save the previous state before updating the text
                                      // _undoHistory.add(_textEditingController.text);
                                    },
                                    maxLines:
                                    null, // Set maxLines to null for multiline
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                      'Enter your translation here...',
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                      8.0), // Add some spacing between TextField and buttons
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.save),
                                        onPressed: () {
                                          // Handle edit button press
                                        },
                                      ),
                                      // IconButton(
                                      //   icon: const Icon(Icons.undo),
                                      //   onPressed: () {
                                      //     if (_undoHistory.isNotEmpty) {
                                      //       setState(() {
                                      //         _textEditingController.text = _undoHistory.removeLast();
                                      //       });
                                      //     }
                                      //   },
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ));
//
//
    // body: StreamBuilder<DocumentSnapshot>(
    //     stream: FirebaseFirestore.instance.doc(collectionPath).snapshots(),
    //     // stream: stream,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return Text('Error: ${snapshot.error}');
    //       }
    //
    //       if (!snapshot.hasData) {
    //         return Text('Loading...');
    //       }
    //
    //       // Access the value of the specified field
    //       var fieldValue = snapshot.data!.get(fieldName);
    //       //
    //       // builder:
    //       // (context, snapshot) {


    // );
  }
}









// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/utils/databaseXoperations/WriteOnDataBase.dart';
// import '../../../../core/widgets/skeltonloading.dart';
// import '../manager/featureCubit/getting_page_cubit.dart';
// // import '../../../core/utils/databaseXoperations/WriteOnDataBase.dart';
// // import '../../../core/widgets/skeltonloading.dart';
// // import '../../addingNewWordFeature/presentation/manger/cubit/vocab_cubet_cubit.dart';
//
// MakeChangesDBM _changesDB_M = MakeChangesDBM();
//
// class InsideBookPage extends StatefulWidget {
//   const InsideBookPage({Key? key}) : super(key: key);
//
//   @override
//   State<InsideBookPage> createState() => _WordsAddedState();
// }
//
// class _WordsAddedState extends State<InsideBookPage> {
//   late Map<String, dynamic> data;
//
//   late String _userID;
//
//   var wordsIntheCubit;
//   late Stream<QuerySnapshot> _stream;
//   Future<void> userID() async {
//     _userID = (await _changesDB_M.getCurrentUser())!;
//   }
//
//   @override
//   bool get wantKeepAlive => true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     userID();
//     // _stream = ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF628EEC),
//       body: BlocConsumer<GettingPageCubit, GettingPageState>(
//         listener: (context, state) {
//           // TODO: implement listener
//           // if (state is addedNewWord) {
//           //   wordsIntheCubit =
//           //       BlocProvider.of<VocabCubetCubit>(context).wordsInCubit;
//           // }
//         },
//         builder: (context, state) {
//           return ListView.builder(
//             itemCount: websitesNames.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               if (kDebugMode) {
//                 print("creating the ${websitesNames.length} cards");
//                 print(websitesNames[index]);
//               }
//               if (kDebugMode) {
//                 print(insideWordssmap[websitesNames[index]]);
//               }
//               String translationValue =
//               insideWordssmap[websitesNames[index]]
//               ['translationtoarabic'];
//
//               return Column(
//                 children: [
//                   ListTile(
//                     onLongPress: () {
//                       if (kDebugMode) {
//                         print("long pressed");
//                       }
//
//                       // showAlertDialog(context,null,"besoes",websitesNames[index],false);
//                     },
//                     onTap: () {
//                       // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(userID: _userID,pagename: websitesNames[index],)));
//                       // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(pagename: keys[index],)));
//                     },
//                     title: Row(
//                       children: [
//                         const Icon(Icons.accessibility_new_outlined),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment
//                                 .start, // Align text to the beginning
//                             children: [
//                               Text(
//                                 websitesNames[index],
//                                 style: const TextStyle(fontSize: 20),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               Text(
//                                 translationValue.toString(),
//                                 style: const TextStyle(fontSize: 15),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Divider(
//                     // Add a Divider below each ListTile to separate the items
//                     endIndent: 20,
//                     thickness:
//                     1.4, // You can adjust the thickness as needed
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/utils/databaseXoperations/WriteOnDataBase.dart';
// import '../../../../core/widgets/skeltonloading.dart';
// import '../manager/featureCubit/getting_page_cubit.dart';
// // import '../../../core/utils/databaseXoperations/WriteOnDataBase.dart';
// // import '../../../core/widgets/skeltonloading.dart';
// // import '../../addingNewWordFeature/presentation/manger/cubit/vocab_cubet_cubit.dart';
//
// MakeChangesDBM _changesDB_M = MakeChangesDBM();
//
// class InsideBookPage extends StatefulWidget {
//   const InsideBookPage({Key? key}) : super(key: key);
//
//   @override
//   State<InsideBookPage> createState() => _WordsAddedState();
// }
//
// class _WordsAddedState extends State<InsideBookPage> {
//   late Map<String, dynamic> data;
//
//   late String _userID;
//
//   var wordsIntheCubit;
//   late Stream<QuerySnapshot> _stream;
//   Future<void> userID() async {
//     _userID = (await _changesDB_M.getCurrentUser())!;
//   }
//
//   @override
//   bool get wantKeepAlive => true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     userID();
//     // _stream = ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF628EEC),
//       body: BlocConsumer<GettingPageCubit, GettingPageState>(
//         listener: (context, state) {
//           // TODO: implement listener
//           // if (state is addedNewWord) {
//           //   wordsIntheCubit =
//           //       BlocProvider.of<VocabCubetCubit>(context).wordsInCubit;
//           // }
//         },
//         builder: (context, state) {
//           return Center(
//             child: StreamBuilder<QuerySnapshot>(
//               stream:
//                   FirebaseFirestore.instance.collection('books').snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text('Error in database');
//                 } else if (snapshot.connectionState ==
//                     ConnectionState.waiting) {
//                   return ListView.separated(
//                     itemCount: 5,
//                     itemBuilder: (context, index) => const NewsCardSkelton(),
//                     separatorBuilder: (context, index) =>
//                         const SizedBox(height: 16.0),
//                   );
//                 }
//                 // List messageBubbles = [];
//                 DocumentSnapshot? desiredDocument;
//
//                 for (final document in snapshot.data!.docs) {
//                   if (document.id == _userID) {
//                     desiredDocument = document;
//                     break;
//                   }
//                 }
//
//                 // if (desiredDocument == null) {
//                 //   return const Text('Document not found');
//                 // }
//                 Map<String, dynamic> data =
//                 desiredDocument?.data() as Map<String, dynamic>;
//                 Map<String, dynamic> insideWordssmap = data["words"];
//                 List websitesNames = insideWordssmap.keys.toList();
//
//                 if (kDebugMode) {
//                   print("websitesNames");
//                   print(websitesNames);
//                 }
//
//                 return ListView.builder(
//                   itemCount: websitesNames.length,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     if (kDebugMode) {
//                       print("creating the ${websitesNames.length} cards");
//                       print(websitesNames[index]);
//                     }
//                     if (kDebugMode) {
//                       print(insideWordssmap[websitesNames[index]]);
//                     }
//                     String translationValue =
//                         insideWordssmap[websitesNames[index]]
//                             ['translationtoarabic'];
//
//                     return Column(
//                       children: [
//                         ListTile(
//                           onLongPress: () {
//                             if (kDebugMode) {
//                               print("long pressed");
//                             }
//
//                             // showAlertDialog(context,null,"besoes",websitesNames[index],false);
//                           },
//                           onTap: () {
//                             // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(userID: _userID,pagename: websitesNames[index],)));
//                             // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(pagename: keys[index],)));
//                           },
//                           title: Row(
//                             children: [
//                               const Icon(Icons.accessibility_new_outlined),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment
//                                       .start, // Align text to the beginning
//                                   children: [
//                                     Text(
//                                       websitesNames[index],
//                                       style: const TextStyle(fontSize: 20),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     Text(
//                                       translationValue.toString(),
//                                       style: const TextStyle(fontSize: 15),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Divider(
//                           // Add a Divider below each ListTile to separate the items
//                           endIndent: 20,
//                           thickness:
//                               1.4, // You can adjust the thickness as needed
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vocabulary_coach/Features/TranslatingAbookFeature/presentation/manager/featureCubit/getting_page_cubit.dart';
//
// import '../../../../core/widgets/Reuseable_Widgets_Ram/myCatTextField.dart';
// import '../../../../core/widgets/skeltonloading.dart';
//
// class InsideBookPage extends StatefulWidget {
//   const InsideBookPage({super.key});
//
//   @override
//   State<InsideBookPage> createState() => _InsideBookPageState();
// }
//
// class _InsideBookPageState extends State<InsideBookPage> {
//   bool viewTextReceiver = false;
//   int indexCount = 0;
//   // fieldName;
//   // late Stream<DocumentSnapshot> stream;
//   String collectionPath = "8I0vkfPjS7Bxiw36ImBN/ykUIOTASOjelAYHTe5Fx/";
//   late String fieldName = "page1";
// // find why cant get to the field name and i will look for it in the last page i have made a stream in it already
//   List<String> theData = [
//     "hola user how are you are you ok",
//     "user hola ok you are ",
//     " _InsideBookPageState extends State<InsideBookPage>",
//     "State<InsideBookPage> createState() => _InsideBookPageState()"
//   ];
//   // List<String> phrases = theData.split("<spl>");
//   // TextEditingController _textEditingController = TextEditingController();
//
//   // List<String> _undoHistory = [];
//   @override
//   void initState() {
//     super.initState();
//
//     // Replace "books", "8I0vkfPjS7Bxiw36ImBN", "poordadrichdad", "ykUIOTASOjelAYHTe5Fx", and "page1"
//     // with your actual collection and document IDs and field name
//
//     // // Create a stream to listen for changes in the specified field
//     // stream = ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // readField();
//     return Scaffold(
//       backgroundColor: Color(0xFF628EEC),
//
//       body:StreamBuilder<QuerySnapshot>(
//         stream:
//         FirebaseFirestore.instance.collection('books').snapshots(),
//         builder: (BuildContext context,
//             AsyncSnapshot<QuerySnapshot> snapshot) {
//
//           if (snapshot.hasError) {
//             return const Text('Error in database');
//           } else if (snapshot.connectionState ==
//               ConnectionState.waiting) {
//             return
//
//               ListView.separated(
//               itemCount: 5,
//               itemBuilder: (context, index) => const NewsCardSkelton(),
//               separatorBuilder: (context, index) =>
//               const SizedBox(height: 16.0),
//             );
//           }
//           // List messageBubbles = [];
//
//           DocumentSnapshot? desiredDocument;
//           print("234_239487");
//
//           List<QueryDocumentSnapshot<Object?>> document = snapshot.data!.docs;
//           print(document);
//
//           // for (final document in snapshot.data!.docs) {
//           //   print(document);
//           //   // if (document.id == '8I0vkfPjS7Bxiw36ImBN') {
//           //   //   desiredDocument = document;
//           //   //   break;
//           //   // }
//           // }
//           //
//           // if (desiredDocument == null) {
//           //   return const Text('Document not found');
//           // }
//           //
//           // Map<String, dynamic> data = desiredDocument.data() as Map<String, dynamic>;
//           //
//           // // Navigate to the "poordadrichdad" subcollection
//           // Map<String, dynamic> poordadrichdadMap = data['poordadrichdad'];
//           //
//           // // Navigate to the "ykUIOTASOjelAYHTe5Fx" document
//           // DocumentSnapshot poordadrichdadDocument = poordadrichdadMap['ykUIOTASOjelAYHTe5Fx'];
//           //
//           // // Check if the document exists
//           // if (!poordadrichdadDocument.exists) {
//           //   return const Text('poordadrichdad Document not found');
//           // }
//           //
//           // // Access the value of the "page1" field
//           // var fieldValue = poordadrichdadDocument['page1'];
//           //
//           // if (kDebugMode) {
//           //   print('Page 1: $fieldValue');
//           // }
//
//
//           return BlocConsumer<GettingPageCubit, GettingPageState>(
//             listener: (context, state) {
//               // TODO: implement listener
//             },
//             builder: (context, state) {
//               // print("234_235098");
//               // BlocProvider.of<GettingPageCubit>(context).readField();
//
//               List<String> thePhrases =
//               BlocProvider.of<GettingPageCubit>(context).getDateFromDb();
//               // print(.length);
//               return ;
//             },
//           );
//         },
//       ),);
//
//
//     // body: StreamBuilder<DocumentSnapshot>(
//     //     stream: FirebaseFirestore.instance.doc(collectionPath).snapshots(),
//     //     // stream: stream,
//     //     builder: (context, snapshot) {
//     //       if (snapshot.hasError) {
//     //         return Text('Error: ${snapshot.error}');
//     //       }
//     //
//     //       if (!snapshot.hasData) {
//     //         return Text('Loading...');
//     //       }
//     //
//     //       // Access the value of the specified field
//     //       var fieldValue = snapshot.data!.get(fieldName);
//     //       //
//     //       // builder:
//     //       // (context, snapshot) {
//
//
//     // );
//   }
// }
//
