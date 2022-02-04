import 'package:flutter/material.dart';
import 'package:quiz_game/quiz/quiz.dart';
import 'package:quiz_game/quiz/result.dart';

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State {
  int questionIndex = 0;
  int totalScore = 0;
  var questions = [
    {
      'question': 'What animal is this?',
      'imagequest': Image.network(
        'https://www.petmd.com/sites/default/files/styles/article_image/public/orange-tabby-kitten-walking-across-floor.jpg?itok=ApRxY9_r',
        height: 300,
        width: 200,
        fit: BoxFit.cover,
      ),
      'answers': [
        {'text': 'Dog', 'score': 0},
        {'text': 'Crocodile', 'score': 0},
        {'text': 'Cat', 'score': 1}
      ]
    },
    {
      'question': 'What color is this?',
      'imagequest': Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Solid_blue.svg/1280px-Solid_blue.svg.png',
        height: 300,
        width: 200,
        fit: BoxFit.cover,
      ),
      'answers': [
        {'text': 'Blue', 'score': 1},
        {'text': 'Green', 'score': 0},
        {'text': 'Red', 'score': 0}
      ]
    },
    {
      'question': 'What is the name of this fruit?',
      'imagequest': Image.network(
        'https://i.guim.co.uk/img/media/5168ef9fcd3f577c53eb71c65c5182e608258a84/0_135_5027_3016/master/5027.jpg?width=620&quality=85&auto=format&fit=max&s=f8f0605bdab7cdde1777ea149f0d38df',
        height: 300,
        width: 200,
        fit: BoxFit.cover,
      ),
      'answers': [
        {'text': 'Durian', 'score': 1},
        {'text': 'Pineapple', 'score': 0},
        {'text': 'Lychee', 'score': 0}
      ]
    },
    {
      'question': 'What type of object is this?',
      'imagequest': Image.network(
        'https://i.pcmag.com/imagery/reviews/03D1ZXVNpUaqVl6KHkDWl4t-5.fit_lim.size_238x139.v1634846487.jpg',
        height: 300,
        width: 200,
        fit: BoxFit.cover,
      ),
      'answers': [
        {'text': 'Radio', 'score': 0},
        {'text': 'Book', 'score': 0},
        {'text': 'Smartphone', 'score': 1}
      ]
    },
    {
      'question': 'What is the person doing?',
      'imagequest': Image.network(
        'https://vmrw8k5h.tinifycdn.com/news/wp-content/uploads/2021/03/kelly-pash-texas--1024x683.jpg',
        height: 300,
        width: 200,
        fit: BoxFit.cover,
      ),
      'answers': [
        {'text': 'Swimming', 'score': 1},
        {'text': 'Running', 'score': 0},
        {'text': 'Driving', 'score': 0}
      ]
    },
    {
      'question': 'What is the name of the occupation',
      'imagequest': Image.network(
        'https://cdn.statically.io/img/patients.smarterhealth.sg/wp-content/uploads/2019/11/Smarter-Health-General-Practitioner-or-Specialist-Doctor-768x512.jpg?quality=90&f=auto',
        height: 300,
        width: 200,
        fit: BoxFit.cover,
      ),
      'answers': [
        {'text': 'Police', 'score': 0},
        {'text': 'Doctor', 'score': 1},
        {'text': 'Army', 'score': 0}
      ]
    },
    //
  ];

  void resetScore() {
    setState(() {
      totalScore = 0;
      questionIndex = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex += 1;
    });
    print(totalScore);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Simple Quiz App'),
          backgroundColor: Colors.red,
        ),
        body: questionIndex < questions.length
            ? Quiz(questions, answerQuestion, questionIndex)
            : Result(totalScore, resetScore),
      ),
    );
  }
}
