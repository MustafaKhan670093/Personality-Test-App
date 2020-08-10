import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 5) {
      resultText = 'You are quite a cultured person!';
    } else if (resultScore <= 6) {
      resultText = 'Pretty interesting selections. You seem quite likeable.';
    } else if (resultScore <= 10) {
      resultText = 'You are... quite strange?';
    } else {
      resultText = 'Yikes...';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text('Restart Quiz'),
              textColor: Colors.blue,
              onPressed: resetHandler,
            ),
          ]),
    );
  }
}
