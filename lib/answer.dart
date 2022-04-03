import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerQuestion;
  final String answerText;
  const Answer({Key? key, required this.answerQuestion, required this.answerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue[100],
        child: Text(answerText),
        onPressed: answerQuestion,
      ),
    );
  }
}
