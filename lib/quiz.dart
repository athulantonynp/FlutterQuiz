import 'package:flutter/material.dart';
import 'package:quiz/score.dart';
import 'utils/question.dart';
import 'utils/quiz.dart';
import 'ui/choice_button.dart';
import 'ui/question_text.dart';
import 'ui/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new QuizStatePage();
}

class QuizStatePage extends State<QuizPage> {
  Question currentQuestion;

  Quiz quiz =new Quiz([
    new Question("Elon Musk is human? ", false),
    new Question("Narendra Modi is a traveller? ", true),
    new Question("Flutter is awesome? ", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool hasOverLay=false;

  @override
  void initState() {
    super.initState();
    currentQuestion=quiz.nextQuestion;
    questionText=currentQuestion.question;
    questionNumber=quiz.questionNumber;
    print(currentQuestion);
  }

  void handleAnswer(bool answer){
    isCorrect=(currentQuestion.answer==answer);
    quiz.answer(isCorrect);
    this.setState((){
        hasOverLay=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new ChoiceButton(true,()=> handleAnswer(true)),
            new QuestionText(questionNumber,questionText),
            new ChoiceButton(false, ()=> handleAnswer(false))
          ],
        ),
       hasOverLay==true ?  new CorrectWrongOverlay(isCorrect,
       (){
         if(quiz.length==questionNumber){
           Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Score(quiz.score,
           quiz.length)));
           return;
         }
         currentQuestion=quiz.nextQuestion;
         this.setState((){
            hasOverLay=false;
            questionText=currentQuestion.question;
            questionNumber=quiz.questionNumber;
         });
       }) : new Container(),
      ],
      
    );
  }
}
