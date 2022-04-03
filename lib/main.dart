import 'package:flutter/material.dart';
import 'package:max_try/quiz.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your Favorite Color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your Favorite Animal?',
      'answers': [
        {'text': 'Tiger', 'score': 1},
        {'text': 'Fish', 'score': -1},
        {'text': 'Cat', 'score': -2},
        {'text': 'Dog', 'score': -3}
      ],
    },
    {
      'questionText': 'Who\'s your Favorite Teacher?',
      'answers': [
        {'text': 'Miss D', 'score': 4},
        {'text': 'Miss A', 'score': -3},
        {'text': 'Miss B', 'score': 7},
        {'text': 'Miss C', 'score': -2}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
    }
    //   else if (_questionIndex >= _questions.length) {
    //     setState(() {
    //       _questionIndex = 0;
    //     });
    //   }
  }

  void _goBack() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Quiz App')),
        body: (_questionIndex < _questions.length)
            ? (Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ))
            : (Result(
                goBack: _goBack,
                resultScore: _totalScore,
              )),
      ),
    );
  }
}
