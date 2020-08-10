import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler,
      this.answerText); //the previous + this line take in the _answerQuestion function from the main.dart flie.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: selectHandler,
      ),
    );
  }
}
