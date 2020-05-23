import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;
  Result(this.resultScore, this.resetQuiz);

  get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = "You are awesome and innocent";
    } else if (resultScore <= 15) {
      resultText = "Pretty likeable";
    } else if (resultScore <= 20) {
      resultText = "You are strange?!";
    } else {
      resultText = "You are so bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text("Restart Quiz"),
            onPressed: resetQuiz,
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
