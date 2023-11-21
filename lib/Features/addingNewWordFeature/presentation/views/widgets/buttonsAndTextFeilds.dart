
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/colorConstants.dart';
import '../../../../../core/widgets/Reuseable_Widgets_Ram/myCatButton.dart';
import '../../../../../core/widgets/Reuseable_Widgets_Ram/myCatTextField.dart';
import '../../../../homePage/presentation/manger/words_cubit/vocab_cubet_cubit.dart';
class viewButtonsAndTextFeilds extends StatelessWidget {
   viewButtonsAndTextFeilds({super.key});
  TextEditingController newWordTextField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyTextField(
          borderSide_color: clr_cardColor,
          borderSide_color_infocas: clr_slectedcardColor,
          is_password: false,
          hint_text: "type the new word",
          textEditingController: newWordTextField,
          addDecaration: true,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: MyTextField(
                  borderSide_color: clr_cardColor,
                  borderSide_color_infocas: clr_slectedcardColor,
                  is_password: false,
                  hint_text: "type its translation",
                  textEditingController: newWordTextField,
                  addDecaration: true,
                )),
            IconButton(onPressed: () {}, icon: const Icon(Icons.translate))
          ],
        ),
        MyButton(
            curveDegree: 4,
            onPressed: () {
              if (kDebugMode) {
                print(newWordTextField.text);
              }
              BlocProvider.of<VocabCubetCubit>(context)
                  .addWordToCubit(newWordTextField.text);
            },
            color: clr_cardColor,
            title: const Text("add")),
      ],
    );
  }
}

// Column userPageInteractions(BuildContext context) {
//   return
// }