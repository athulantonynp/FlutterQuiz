import 'package:quiz/utils/question.dart';

class  Quiz {
  List<Question> _questions;
  int _currentQuestionIndex=-1;
  int _score=0;

  Quiz(this._questions){
    _questions.shuffle();
  }
  
  int get score => _score;
   List<Question> get questions=> _questions;
   int get length=> _questions.length;
   int get questionNumber => _currentQuestionIndex+1;

   Question get nextQuestion{
     _currentQuestionIndex++;
      if(_currentQuestionIndex>=length){
        return null;
      }else{
        return _questions[_currentQuestionIndex];
      }
   }

    void answer(bool isCorrect){
      if(isCorrect) _score++;
    }
}