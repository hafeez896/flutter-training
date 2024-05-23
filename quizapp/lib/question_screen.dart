import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/models/quiz_questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    if (currentQuestionIndex >= questions.length) {
      return;
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.text),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
              text: answer,
              onPressed: answerQuestion,
            );
          }).toList(),
        ],
      ),
    );
  }
}
