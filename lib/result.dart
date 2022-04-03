import 'package:flutter/material.dart';
import 'package:max_try/answer.dart';

class Result extends StatelessWidget {
  final VoidCallback goBack;
  final int resultScore;

  const Result({
    Key? key,
    required this.goBack,
    required this.resultScore,
  }) : super(key: key);

  Color get resultColor {
    Color resultColorTemp;
    if (resultScore < 0) {
      resultColorTemp = const Color.fromARGB(255, 221, 82, 82);
    } else if (resultScore < 5) {
      resultColorTemp = const Color.fromARGB(255, 221, 219, 87);
    } else {
      resultColorTemp = const Color.fromARGB(255, 125, 221, 87);
    }
    return resultColorTemp;
  }

  Color calcResultColor() {
    Color resultColorTemp;
    if (resultScore < 0) {
      resultColorTemp = const Color.fromARGB(255, 221, 82, 82);
    } else if (resultScore < 5) {
      resultColorTemp = const Color.fromARGB(255, 221, 219, 87);
    } else {
      resultColorTemp = const Color.fromARGB(255, 125, 221, 87);
    }
    return resultColorTemp;
  }

  String calcResultText() {
    String resultTextTemp;
    if (resultScore < 0) {
      resultTextTemp = "Go AFK pls...";
    } else if (resultScore < 5) {
      resultTextTemp = "Get Gud!";
    } else {
      resultTextTemp = "U R Gud!";
    }
    return resultTextTemp;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: const Text(
              'Quiz Done!',
              style: TextStyle(
                fontSize: 28,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Text(
              'Score: ' + resultScore.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Text(
              calcResultText(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Answer(answerQuestion: goBack, answerText: 'Retake Quiz?'),
        ],
      ),
    );
  }
}
