import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/databaseXoperations/read_from_data_base_fb.dart';
import '../../../../../core/widgets/skeltonloading.dart';
import '../../../../core/utils/databaseXoperations/update_data_base.dart';
import '../../../chat_page/presentation/views/chat_page.dart';
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
    if (kDebugMode) {
      print(dataFromDataBase);
    }
    setState(() {
      loadOrNo = false;
    });
  }

  Future<void> getDataBAse() async {
    print("changing the database data for secon time ");
    if (kDebugMode) {
      print("sdkfj");
    }
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
                  return Column(
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
                                    pagesInTheBook[index],
                                    style: const TextStyle(fontSize: 20),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        endIndent: 5,
                        thickness: 1.4,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
