import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';
/*void main(){
  runApp(MyApp());
}*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What\'s your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 6},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 0}
      ],
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": [
        {"text": "Eagle", "score": 8},
        {"text": "Lion", "score": 10},
        {"text": "Rabbit", "score": 3},
        {"text": "Elephant", "score": 5}
      ],
    },
    {
      "questionText": "Who\'s your favorite person?",
      "answers": [
        {"text": "Taha", "score": 5},
        {"text": "Enes", "score":5},
        {"text": "Taha Enes", "score": 0},
        {"text":"Aslantürk", "score" : 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz(){
   setState(() {
     _questionIndex = 0;
     _totalScore = 0;
   });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
      setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex < _questions.length) {
        print("We have more questions");
      } else {
        print("No Q's");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Another App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
