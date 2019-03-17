import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  
  final bool _answer;
  final VoidCallback _onTap;

  ChoiceButton(this._answer,this._onTap);

  @override
  Widget build(BuildContext context) {
    
    return new Expanded(
              child: new Material(
              color: _answer==true ? Colors.greenAccent :Colors.redAccent,
              child: new InkWell(
                onTap: ()=> _onTap(),
                child: new Center(
                  child: new Container(
                    
                    padding: EdgeInsets.all(20.0),
                    decoration: new BoxDecoration(
                      border: new Border.all(
                        color: Colors.white,width: 5.0
                      )
                    ),
                    child: new Text( _answer==true ? "True" :"False",
                      style: new TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ),
              ),
            ),
            )
    );
  }
}