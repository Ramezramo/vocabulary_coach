import "package:flutter/material.dart";
import "package:vocabulary_coach/Features/chat_page/presentation/views/widgets/viewDataInGoodContainer.dart";

import "chat_constants.dart";
class buttom_Text_reciever_and_data_in_good_shape extends StatelessWidget {
  const buttom_Text_reciever_and_data_in_good_shape({
    super.key,
    required this.messageSenderControler,
  });

  final TextEditingController messageSenderControler;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const ShowTextInAGoodContainer(
                borderButtom: false,
                textEnglish: true,
                thePhrase:
                "ShowTextInAGoodContainer",
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                // controller: pass_Controller,
                controller: messageSenderControler,
                decoration:
                kDecoration("enter your message", 5.0).copyWith(
                  suffixIcon: IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
