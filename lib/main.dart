import "package:flutter/material.dart";
import "package:hexcolor/hexcolor.dart";
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _data = [
    {
      'questionText':
          'Flutter is an _____ mobile aplication development framework developed by Google.',
      'answers': [
        {'text': 'Open-source', 'score': 9.73},
        {'text': 'Shareware', 'score': 4.61},
        {'text': 'Both', 'score': 1.95},
        {'text': 'None of the above', 'score': 0.00},
      ]
    },
    {
      'questionText':
          'Flutter apps are written in the _____ language and make use of many advanced features of this language.',
      'answers': [
        {'text': 'Java', 'score': 2.3},
        {'text': 'HTML', 'score': 0.32},
        {'text': 'JavaScript', 'score': 3.00},
        {'text': 'Dart', 'score': 9.98},
      ]
    },
    {
      'questionText': 'Which of the following widgets is used for layouts?',
      'answers': [
        {'text': 'Text', 'score': 0.64},
        {'text': 'Column', 'score': 10.00},
        {'text': 'Inkwell', 'score': 3.28},
        {'text': 'Expanded', 'score': 1.02}
      ]
    },
    {
      'questionText': 'When was Flutter first described?',
      'answers': [
        {'text': '2012', 'score': 0.12},
        {'text': '2013', 'score': 2.13},
        {'text': '2017', 'score': 6.42},
        {'text': '2015', 'score': 9.99}
      ]
    },
    {
      'questionText': 'When was Flutter released?',
      'answers': [
        {'text': '2016', 'score': 5.53},
        {'text': '2017', 'score': 10.00},
        {'text': '2013', 'score': 2.47},
        {'text': '2019', 'score': 2.35}
      ]
    }
  ];

  var _indexQuestion = 0;
  double _totalScore = 0.00;

  void _answerQuestion(double score) {
    _totalScore += score;

    setState(() {
      _indexQuestion += 1;
    });
  }

  void _restart() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                "Flutter Quiz App",
                style: TextStyle(
                  color: HexColor("#F5FFF0"),
                ),
              ),
            ),
            backgroundColor: Colors.purple,
          ),
          body: Align(
              alignment: Alignment.center,
              child: (_indexQuestion <= 4 && _indexQuestion >= 0)
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      indexQuestion: _indexQuestion,
                      data: _data)
                  : Result(_totalScore, _restart))),
    );
  }
}
