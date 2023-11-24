import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_coach/Features/TranslatingAbookFeature/presentation/manager/featureCubit/getting_page_cubit.dart';

import '../../../../core/widgets/Reuseable_Widgets_Ram/myCatTextField.dart';

class InsideBookPage extends StatefulWidget {
  const InsideBookPage({super.key});

  @override
  State<InsideBookPage> createState() => _InsideBookPageState();
}

class _InsideBookPageState extends State<InsideBookPage> {
  bool viewTextReceiver = false;
  int indexCount = 0;
  List<String> theData = [
    "hola user how are you are you ok",
    "user hola ok you are ",
    " _InsideBookPageState extends State<InsideBookPage>",
    "State<InsideBookPage> createState() => _InsideBookPageState()"
  ];
  // List<String> phrases = theData.split("<spl>");
  TextEditingController _textEditingController = TextEditingController();
  List<String> _undoHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF628EEC),
      body: BlocConsumer<GettingPageCubit, GettingPageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          print("234_235098");
          List<String> thePhrases =
              BlocProvider.of<GettingPageCubit>(context).getDateFromDb();
          // print(.length);
          return SafeArea(
            child: ListView.builder(
              itemCount: thePhrases.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // viewTextReceiver = !viewTextReceiver;
                // if (viewTextReceiver && theData.length + theData.length != theData.length + theData.length ) {
                //   indexCount ++;
                // }
                // print("234_452265");
                // print(indexCount);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
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
                              thePhrases[index],
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                               TextField(
                                controller: _textEditingController,
                                onChanged: (value) {
                                  // Save the previous state before updating the text
                                  _undoHistory.add(_textEditingController.text);
                                },
                                maxLines: null, // Set maxLines to null for multiline
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your translation here...',
                                ),
                              ),
                              const SizedBox(height: 8.0), // Add some spacing between TextField and buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.save),
                                    onPressed: () {
                                      // Handle edit button press
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.undo),
                                    onPressed: () {
                                      if (_undoHistory.isNotEmpty) {
                                        setState(() {
                                          _textEditingController.text = _undoHistory.removeLast();
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )

                      ,
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}




