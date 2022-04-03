import 'package:flutter/material.dart';
import 'package:max_try/answer.dart';
import 'package:max_try/question.dart';

class Quiz extends StatelessWidget {
  final Function(int) answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  const Quiz(
      {Key? key,
      required this.answerQuestion,
      required this.questions,
      required this.questionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
            questionText: questions[questionIndex]['questionText'] as String),
        //Answers
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
          return Answer(
            answerQuestion: (() => answerQuestion(answer['score'] as int)),
            answerText: answer['text'] as String,
          );
        }).toList(),
        //Answers
      ],
    );
  }
}
