import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {

  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect,this._onTap);

  @override
  State<StatefulWidget> createState() => new CorrectWrongOverlayState();

  
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> {
  @override
  Widget build(BuildContext context) {

      return new Material(
        color: Colors.black54,
        child: new InkWell(
          onTap: ()=>widget._onTap(),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: new Icon(widget._isCorrect? Icons.done :Icons.clear,size: 80.0),
              ),
              new Padding(
                padding: new EdgeInsets.only(bottom: 20),
              ),
              new Text(widget._isCorrect? "Correct!": "Wrong!",
              style: new TextStyle(color: Colors.white,fontSize: 30.0),)
            ],
          ),
        ),
      );
  }
  
}