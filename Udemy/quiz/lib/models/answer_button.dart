import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  final String answerText;
  void Function() onTap;

  AnswerButton({required this.answerText,super.key,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40
        ),
        backgroundColor: Colors.blue,
        foregroundColor: CupertinoColors.white
      ), child: Text(answerText, textAlign: TextAlign.center,));
  }

}