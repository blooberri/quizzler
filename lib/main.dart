import 'package:flutter/material.dart';

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
  List<String> questions = [
    'Mount Everest is the tallest mountain in the world',
    'The Great Wall of China can be seen from the Moon with the naked eye.',
    'The capital city of Australia is Sydney',
    'Sound travels faster in air than it does in water.',
    'Jupiter is the closest planet to the Sun',
    'An adult human skeleton has more bones than a baby\'s skeleton',
  ];
  List<bool> answers = [true, false, false, false, false, false];
  //TODO: Add a score keeper
  List<Icons> score = [];

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
                questions[questionNumber],
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
                bool correctAnswer = answers[questionNumber];
                if(correctAnswer == true){
                  print('Correct');
                }else{
                  print('Incorrect');
                }
                setState(() {
                  questionNumber++;
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
                bool correctAnswer = answers[questionNumber];
                if(correctAnswer == true){
                  print('Incorrect');
                }else{
                  print('Correct');
                }
                setState(() {
                  questionNumber++;
                });
                print(questionNumber);
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
