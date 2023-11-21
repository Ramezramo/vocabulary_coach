import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_coach/Features/addingNewWordFeature/presentation/views/widgets/add_words_body.dart';

import '../../../../core/utils/colorConstants.dart';
import '../../../../core/widgets/Reuseable_Widgets_Ram/myCatButton.dart';
import '../../../../core/widgets/Reuseable_Widgets_Ram/myCatTextField.dart';
import '../manger/words_cubit/vocab_cubet_cubit.dart';
// import 'package:vocabulary_coach/Reuseable_widgets/myCatButton.dart';

// import '../../core/cubit/vocab_cubet_cubit.dart';
// import '../CONSTANTS/colorConstants.dart';
// import '../Reuseable_widgets/myCatButton.dart';
// import '../Reuseable_widgets/myCatTextField.dart';

class addWordPage extends StatefulWidget {
  const addWordPage({Key? key}) : super(key: key);

  @override
  State<addWordPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<addWordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VocabCubetCubit, VocabCubetState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: AddWrdsBody( ),
    );
  },
);
  }


}
