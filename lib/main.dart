import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

//void indicates that main will return no output.
void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp());      This is another way to tell dart that
//this is a function with only one expression that needs to be executed.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//The reason we have two classes when the app is stateful is so that the first one can be reloaded and changed
//with new information while the second class can remain constant with its data not being wiped away.

//The lines State<MyApp> tells flutter that the State belongs to MyApp.
//The next thing that needs to be done to connect the two classes, is
//to go to the stateful class above and write createState(), then write return MyAppState();

//Note as well that the leading _ before MyAppState turns the class into a private one from a public one.
//This now means MyAppState is a class that can only be used in this, main.dart, file.
//This same _ can be used for variables and functions.

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //'final' is used to refer to something that is a run-time constant (locked at run-time). 'const' is used to refer to something that is a compile-time constant (locked right now).
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Pink', 'score': 1},
        {'text': 'Blood Red', 'score': 4},
        {'text': 'Blue', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Lion', 'score': 2},
        {'text': 'Snake', 'score': 5},
        {'text': 'Spider', 'score': 5},
      ],
    },
    {
      'questionText': 'Who\'s your favourite person from this list?',
      'answers': [
        {'text': 'Mustafa', 'score': 1},
        {'text': 'Jack The Ripper', 'score': 5},
        {'text': 'Hannible', 'score': 5},
        {'text': 'Taylor Swift', 'score': 3},
      ],
    },
    //This is the map datastrcutre. {} is the shorthand way of creating it. Map() can also be used.
    //What we have created is a list of maps with string keys.
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //Calling setState notifies the framework that the internal state of this object has changed in a way
    //that might impact the user interface in this subtree, which causes the framework to
    //schedule a build for this State object.
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Personality Test'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                _totalScore,
                _resetQuiz,
              ),
      ),
    );
  }
}

//The code in body: conditional check ? ____ and then : is the same as if conditional is true execute ___, else execute everything after :.
