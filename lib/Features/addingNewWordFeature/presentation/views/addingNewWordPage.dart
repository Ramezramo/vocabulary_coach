import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colorConstants.dart';
import '../../../../core/utils/databaseXoperations/WriteOnDataBase.dart';
import '../../../../core/widgets/Reuseable_Widgets_Ram/myCatButton.dart';
import '../../../../core/widgets/Reuseable_Widgets_Ram/myCatTextField.dart';
import '../manger/cubit/vocab_cubet_cubit.dart';

class addWordPage extends StatefulWidget {
  const addWordPage({Key? key}) : super(key: key);


  @override
  State<addWordPage> createState() => _DetailPageState();
}

MakeChangesDBM ddb = MakeChangesDBM();
TextEditingController newWordTextFieldController = TextEditingController();
TextEditingController newWordTranslationController = TextEditingController();
class _DetailPageState extends State<addWordPage> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VocabCubetCubit, VocabCubetState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 300,
                      decoration:  BoxDecoration(
                          color: clr_1backGround1
                      ),
                    )),
                const Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [

                      ],
                    )),
                Positioned(
                    top: 130,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 520,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              MyTextField(borderSide_color: clr_4cardColor2,borderSide_color_infocas: clr_3cardColor1,is_password: false,hint_text: "type the new word",textEditingController:newWordTextFieldController,addDecaration: true, ),
                              const SizedBox(height: 20,),

                              Row(
                                children: [
                                  Expanded(child: MyTextField(borderSide_color: clr_4cardColor2,borderSide_color_infocas: clr_3cardColor1,is_password: false,hint_text: "type its translation",textEditingController:newWordTranslationController,addDecaration: true, )),
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.translate))
                                ],
                              ),
                              MyButton(curveDegree: 4,onPressed: (){
                                if (kDebugMode) {
                                  print(newWordTextFieldController.text);
                                }
                                ddb.addNewWordGoogleLevel(newWordTextFieldController.text,newWordTranslationController.text,"users","words","teKESef7NCcCZwGgZzjSlfVsNgG2");
                                newWordTextFieldController.clear();
                                newWordTranslationController.clear();
                              },color: clr_6cardColor3,title: const Text("add")),

                            ],
                          ),

                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
