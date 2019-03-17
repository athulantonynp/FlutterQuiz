import 'package:flutter/material.dart';
import 'package:quiz/splash.dart';

class Score extends StatelessWidget {

  final int score;
  final int totalQuestions;

  Score(this.score,this.totalQuestions);

  @override
  Widget build(BuildContext context) {

    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your score is ",style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
          fontSize: 50.0),),

          new Text(score.toString()+ "/"+totalQuestions.toString(),style: new TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,fontSize: 40),),

          new IconButton(
            icon: new Icon(Icons.play_arrow),
            color: Colors.white,
            iconSize: 50,
            onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (BuildContext context)=> new Splash())  ,(Route route) => route==null),
          ),

        ],
      ),
    );
  }
  

}