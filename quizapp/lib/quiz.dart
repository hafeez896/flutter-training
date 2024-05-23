import 'package:flutter/material.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void goToQuestionScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void goToStartScreen() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screen = StartScreen(goToQuestionScreen);

    if (activeScreen == 'question-screen') {
      screen = QuestionScreen(goToStartScreen);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: screen,
      ),
    );
  }
}
