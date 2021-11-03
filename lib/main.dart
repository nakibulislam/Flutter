import 'dart:html';

import 'package:flutter/material.dart';
import 'questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionStor questionStor=QuestionStor();

void main(List<String> args) {
  runApp(Question());
}

class Question extends StatelessWidget {
  const Question({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Quiz(),
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text('Welcome to Question Seasson',
        textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({ Key? key }) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> ScoreKeeper= [];
  int countRight=0;
  int countWrong=0;


  void checkAnswer(bool Picked){
    bool correctAnswer = questionStor.getAnswer();
    setState(() {
      if(questionStor.getFinished() == true){
        Alert(
          context: context, 
          title: "You have finished all the Questions." , 
          desc: "Total Correct Answer - "+ countRight.toString()).show();

          questionStor.getRestart();
          ScoreKeeper= [];
          countRight=0;
      }
      else{
        if(Picked==correctAnswer){
        print("Right Answer");
        //print(countRight);
        countRight++;
        ScoreKeeper.add(Icon(Icons.check_box_rounded, color: Colors.green));
        }
        else{
        print("Wrong Answer");
        countWrong++;
        ScoreKeeper.add(Icon(Icons.close_rounded,color: Colors.red));
        }
      }      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget> [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(questionStor.getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20, ),
                ),
              ),
            ),
          ),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: ScoreKeeper
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: FlatButton(
                child: Text('True'),
                color: Colors.green,
                onPressed: (){
                setState(() {
                  questionStor.getNext();
                  checkAnswer(true);
                });   
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: FlatButton(
                color: Colors.red,
                child: Text('False'),
                onPressed: (){
                  setState(() {
                    questionStor.getNext();
                    checkAnswer(false);
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  color: Colors.white,
                  onPressed: (){
                  setState(() {
                    questionStor.getBack();
                  });
                },
                  child: Text("Back"),
                ),
                FlatButton(
                  color: Colors.white,
                  onPressed: (){
                    setState(() {
                      questionStor.getNext();
                    });
                  },
                  child: Text("Next"),
                ),             
              ],
            ),  
          ),
        ],
      ),
    );
  }
}




