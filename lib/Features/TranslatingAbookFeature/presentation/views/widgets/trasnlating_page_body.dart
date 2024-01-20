import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colorConstants.dart';
import '../../../../../core/utils/databaseXoperations/read_from_data_base_fb.dart';
import '../../../../../core/widgets/skeltonloading.dart';
import '../book_pages_count_page.dart';
// import '../../../../chat_page/presentation/views/insideTheBookTranslation.dart';

Future<Map<String, dynamic>> runDataBase()async{
  return await giveMeTheDataBaseAsJson()  ;
}
class translatingBookPage extends StatefulWidget {
  const translatingBookPage({super.key});

  @override
  State<translatingBookPage> createState() => _translatingBookPageState();
}

class _translatingBookPageState extends State<translatingBookPage> {
  late Map<String, dynamic> dataFromDataBase ;
  bool loadOrNo = true;
  late List pagesLen;
  Future<void> gettingData() async {

    dataFromDataBase =  await giveMeTheDataBaseAsJson();
    pagesLen = dataFromDataBase["books"].keys.toList();
    // print("2342_23523");
    // print(dataFromDataBase);
    setState(() {
      loadOrNo = false;
    });



  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingData();

     // runDataBase() as Map<String, dynamic>;
  }
  @override
  Widget build(BuildContext context) {
    return loadOrNo ?  ListView.separated(
      itemCount: 4,
      itemBuilder: (context, index) => const NewsCardSkelton(),
      separatorBuilder: (context, index) =>
      const SizedBox(height: 16.0),
    ):ListView.builder(
      itemCount: pagesLen.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
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
                        builder: (context) => BookPages(dataBaseData:dataFromDataBase,bookName:pagesLen[index]),
                      ),
                    );
                    // Navigator.push(InsideBookPage() as BuildContext);
                  },
                  title:  Row(
                    children: [
                      // Icon(Icons.accessibility_new_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the beginning
                          children: [
                            Text(
                              pagesLen[index],
                              style: TextStyle(fontSize: 20,color: clr_textColor),
                              overflow: TextOverflow.ellipsis,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
