import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colorConstants.dart';
import '../../../../core/utils/databaseXoperations/WriteOnDataBase.dart';
import '../../../../core/widgets/AddingNewWordColumnTextFAndButtons.dart';
import '../../../../core/widgets/Reuseable_Widgets_Ram/myCatButton.dart';
import '../../../../core/widgets/Reuseable_Widgets_Ram/myCatTextField.dart';
import '../manger/cubit/vocab_cubet_cubit.dart';

class addWordPage extends StatefulWidget {
  const addWordPage({Key? key}) : super(key: key);


  @override
  State<addWordPage> createState() => _DetailPageState();
}



class _DetailPageState extends State<addWordPage> {
  TextEditingController newWordTextFieldController = TextEditingController();
  TextEditingController newWordTranslationController = TextEditingController();
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
                          color: clr_2backGround2
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
                      // height: 520,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child:   ButtonAndTextField(),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
