import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}

//Notes:

//Seperating widgets into different files is considered good practice.

//A variable with the final keyword will be initialized at runtime and can only be assigned for a single time.
//'final' is used when one doesn't want a particular attribute to be modifed by other classes.

//The Text() widget takes in more than just text. It also has a 'style:' attribute.
//Click control+space to see what styling options are there.

//The textAlign option requires a container widget surrounding the Text() widget
//+ you need to add width: double.infinity, which causes the container to take the size of the entire screen.
//This is because the Text() widget itself will only take as much space as it needs and won't needlessly go to the centre.
//With the container widget however, it will now use the surrounding container widget as a measure for how much space it should take.

//The Container() widget has a margin: option (along with padding, borders, etc. look online/in the vid for a diagram at 4:03:59).
//EdgeInsets is used to add spacing around a widget. It has different construcors accessed by writing '.' after EdgeInsets.
//The .all(10) constructor adds 10 px of space in all directions of the container.
