import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import '../../reuseableClasses/widgets/Reuseable_widgets/myCatButton.dart';
// import '../../reuseableClasses/widgets/Reuseable_widgets/myCatTextField.dart';
import '../reuseableClasses/widgets/Reuseable_widgets/myCatButton.dart';
import '../reuseableClasses/widgets/Reuseable_widgets/myCatTextField.dart';
import '../utils/colorConstants.dart';
import '../utils/databaseXoperations/WriteOnDataBase.dart';

MakeChangesDBM ddb = MakeChangesDBM();
class ButtonAndTextField extends StatelessWidget {
  TextEditingController newWordTextFieldController = TextEditingController();
  TextEditingController newWordTranslationController = TextEditingController();
  ButtonAndTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            MyTextField(borderSide_color: clr_3cardColor1,borderSide_color_infocas: clr_3cardColor1,is_password: false,hint_text: "type the new word",textEditingController:newWordTextFieldController,addDecaration: true, ),
            const SizedBox(height: 20,),

            Row(
              children: [
                Expanded(child: MyTextField(borderSide_color: clr_3cardColor1,borderSide_color_infocas: clr_3cardColor1,is_password: false,hint_text: "type its translation",textEditingController:newWordTranslationController,addDecaration: true, )),
                IconButton(onPressed: (){}, icon: const Icon(Icons.translate))
              ],
            ),
            MyButton(curveDegree: 4,onPressed: (){
              if (kDebugMode) {
                // print(newWordTextFieldController.text);
              }
              ddb.addNewWordGoogleLevel(newWordTextFieldController.text,newWordTranslationController.text,"users","words","teKESef7NCcCZwGgZzjSlfVsNgG2");
              newWordTextFieldController.clear();
              newWordTranslationController.clear();
            },color: clr_textColor,title: const Text("add")),

          ],
        ),

      ],
    );
  }
}
