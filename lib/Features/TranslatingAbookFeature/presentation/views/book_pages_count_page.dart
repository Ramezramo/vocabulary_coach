import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/databaseXoperations/read_from_data_base_fb.dart';
import '../../../../../core/widgets/skeltonloading.dart';
import '../../../../core/utils/colorConstants.dart';
import '../../../../core/utils/databaseXoperations/update_data_base.dart';
import '../../../chat_page/presentation/views/chat_page.dart';
import '../../../chat_page/presentation/views/widgets/phrases_stream.dart';
import '../manager/dataBaseChangedCubit/conge_data_base_cubit.dart';
import '../manager/dataBaseChangedCubit/class_check_if_there_is_change_in_db.dart';

Future<Map<String, dynamic>> runDataBase() async {
  return await giveMeTheDataBaseAsJson();
}

class BookPages extends StatefulWidget {
  Map<String, dynamic> dataBaseData;

  String bookName;
  BookPages({super.key, required this.dataBaseData, required this.bookName});

  @override
  State<BookPages> createState() => _translatingBookPageState();
}

class _translatingBookPageState extends State<BookPages> {
  late Map<String, dynamic> dataFromDataBase;
  bool loadOrNo = true;
  late List pagesInTheBook;


  Future<void> gettingData() async {
    dataFromDataBase = widget.dataBaseData;
    pagesInTheBook = dataFromDataBase["books"][widget.bookName].keys.toList();

    // Sort the keys based on the numeric part after the underscore
    pagesInTheBook.sort((a, b) {
      int aNum = int.parse(a.split('_')[1]);
      int bNum = int.parse(b.split('_')[1]);
      return aNum.compareTo(bNum);
    });

    // if (kDebugMode) {
    //   print(dataFromDataBase);
    // }

    setState(() {
      loadOrNo = false;
    });
  }


  Future<void> getDataBAse() async {
    // if (kDebugMode) {
    //   print("changing the database data for secon time ");
    // }
    // if (kDebugMode) {
    //   print("sdkfj");
    // }
    dataFromDataBase = await giveMeTheDataBaseAsJson();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingData();
    // dataBaseUpdater();
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<CongeDataBaseCubit, CongeDataBaseState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is DataBAseChanged) {
          getDataBAse();
          BlocProvider.of<CongeDataBaseCubit>(context)
              .discordChangesInDataBAse();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button pressed
              Navigator.of(context).pop();
            },
          ),
          actions: const <Widget>[
            // Other actions
          ],
          title: Text("book pages [${pagesInTheBook.length}]",
              style:  TextStyle(color: clr_textColor)),
          backgroundColor: clr_UpNavigationBar,
          iconTheme:
          IconThemeData(color: clr_textColor), // Change the color here
        ),
        body: loadOrNo
            ? ListView.separated(
                itemCount: 4,
                itemBuilder: (context, index) => const NewsCardSkelton(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
              )
            : ListView.builder(
                itemCount: pagesInTheBook.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String onePage = pagesInTheBook[index];
                  // print(onePage);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: clr_3cardColor1,
                      child: Column(
                        children: [
                          ListTile(
                            onLongPress: () {},
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                      dataBaseData: dataFromDataBase,
                                      pageName: pagesInTheBook[index],
                                      bookName: widget.bookName),
                                ),
                              );
                            },
                            title: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Align text to the beginning
                                    children: [
                                      Text(
                                        onePage.replaceAll('_', ''),
                                        style:  TextStyle(fontSize: 20,color: clr_textColor),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   height: 10,
                          //   color: clr_2backGround2,
                          //
                          // )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
