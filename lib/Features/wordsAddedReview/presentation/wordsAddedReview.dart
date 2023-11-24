import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/databaseXoperations/WriteOnDataBase.dart';
import '../../../core/widgets/skeltonloading.dart';
import '../../addingNewWordFeature/presentation/manger/cubit/vocab_cubet_cubit.dart';


MakeChangesDBM _changesDB_M = MakeChangesDBM();

class WordsAdded extends StatefulWidget {
  const WordsAdded({Key? key}) : super(key: key);

  @override
  State<WordsAdded> createState() => _WordsAddedState();
}

class _WordsAddedState extends State<WordsAdded> {
  late Map<String, dynamic> data;

  late String _userID;

  var wordsIntheCubit;
  late Stream<QuerySnapshot> _stream;
  Future<void> userID() async {
    _userID = (await _changesDB_M.getCurrentUser())!;
  }

  @override
  bool get wantKeepAlive => true;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    userID();
    _stream = FirebaseFirestore.instance.collection('users').snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF628EEC),
      body: BlocConsumer<VocabCubetCubit, VocabCubetState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is addedNewWord) {
            wordsIntheCubit =
                BlocProvider.of<VocabCubetCubit>(context).wordsInCubit;
          }
        },
        builder: (context, state) {

          return Center(
            child: StreamBuilder<QuerySnapshot>(
              stream:
              _stream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {

                if (snapshot.hasError) {
                  return const Text('Error in database');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, index) => const NewsCardSkelton(),
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
                  );
                }
                // List messageBubbles = [];
                DocumentSnapshot? desiredDocument;

                for (final document in snapshot.data!.docs) {
                  if (document.id == _userID) {
                    desiredDocument = document;
                    break;
                  }
                }

                if (desiredDocument == null) {
                  return const Text('Document not found');
                }
                Map<String, dynamic> data =
                    desiredDocument.data() as Map<String, dynamic>;
                Map<String, dynamic> insideWordssmap = data["words"];
                List websitesNames = insideWordssmap.keys.toList();

                if (kDebugMode) {
                  print("websitesNames");
                  print(websitesNames);
                }

                return ListView.builder(
                  itemCount: websitesNames.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (kDebugMode) {
                      print("creating the ${websitesNames.length} cards");
                      print(websitesNames[index]);
                    }
                    if (kDebugMode) {
                      print(insideWordssmap[websitesNames[index]]);
                    }
                    String translationValue =
                        insideWordssmap[websitesNames[index]]
                            ['translationtoarabic'];

                    return Column(
                      children: [
                        ListTile(
                          onLongPress: () {
                            if (kDebugMode) {
                              print("long pressed");
                            }

                            // showAlertDialog(context,null,"besoes",websitesNames[index],false);
                          },
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(userID: _userID,pagename: websitesNames[index],)));
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage(pagename: keys[index],)));
                          },
                          title: Row(
                            children: [
                              const Icon(Icons.accessibility_new_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the beginning
                                  children: [
                                    Text(
                                      websitesNames[index],
                                      style: const TextStyle(fontSize: 20),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      translationValue.toString(),
                                      style: const TextStyle(fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          // Add a Divider below each ListTile to separate the items
                          endIndent: 20,
                          thickness:
                              1.4, // You can adjust the thickness as needed
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
