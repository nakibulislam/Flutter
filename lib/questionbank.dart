import 'questions.dart';

class QuestionStor{
int _questionNumber=0;
  List <Question> _questionbank=[
    Question("1) Bangladesh is Large country?", false),
    Question("2) Dhaka is the capital of Bangladesh?", true),
    Question("3) Bangladesh have 62 district?", false),
    Question("4) Bangladesh is Beside India?", true),
    Question("5) Bangla is the mother toung of Bangladesh?", true),
    Question("6) Padma is the river of Bangladesh?", true),
    Question("7) Japan is beside Bangladesh", false),
    Question("8) You are a Robot?", false),
    Question("9) Before Last Question?", true),
    Question("10) Last Question", true),
  ];

getQuestion(){
    return _questionbank[_questionNumber].questionText;  
}
getAnswer(){
   print(_questionNumber);
   return _questionbank[_questionNumber-1].questionaAnswer;  
}

getNext(){
  if(_questionNumber < _questionbank.length)
  _questionNumber++;
  print(_questionNumber);
}

getBack(){
  if(_questionNumber > 0)
  _questionNumber--;
}

getFinished(){
  if(_questionNumber == _questionbank.length){
    print("true");
    return true;
  }
  else{
    return false;
  }
}

getRestart(){
  _questionNumber=0;
}

}
