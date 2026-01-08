import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF161616),
        body: SafeArea(child: Quiz()),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Questions> questionBank = [
    Questions(
      qText: 'Mount Everest is the tallest mountain in the world',
      ans: true,
    ),
    Questions(
      qText:
          'The Great Wall of China can be seen from the Moon with the naked eye.',
      ans: false,
    ),
    Questions(qText: 'The capital city of Australia is Sydney', ans: false),
    Questions(
      qText: 'Sound travels faster in air than it does in water.',
      ans: false,
    ),
    Questions(qText: 'Jupiter is the closest planet to the Sun', ans: false),
    Questions(
      qText: 'An adult human skeleton has more bones than a baby\'s skeleton',
      ans: false,
    ),
  ];
  //TODO: Add a score keeper
  List<Icon> score = [];

  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                questionBank[questionNumber].qText, //IMP!!!
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                bool correctAnswer = questionBank[questionNumber].ans;
                if (correctAnswer == true) {
                  print('Correct');
                } else {
                  print('Incorrect');
                }
                setState(() {
                  if (questionNumber < questionBank.length - 1) {
                    questionNumber++;
                  }
                });
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                bool correctAnswer = questionBank[questionNumber].ans;
                if (correctAnswer == true) {
                  print('Incorrect');
                } else {
                  print('Correct');
                }
                setState(() {
                  if (questionNumber < questionBank.length - 1) {
                    questionNumber++;
                  }
                });
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        //TODO: Add a score keeper
        Row(),
      ],
    );
  }
}
