import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.goToQuestionScreen, {Key? key}) : super(key: key);

  final void Function() goToQuestionScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          TextButton.icon(
              onPressed: goToQuestionScreen,
              label: const Text(
                'Start',
                style: TextStyle(fontSize: 32.0),
              ),
              icon: const Icon(
                Icons.turn_right,
                size: 32.0,
              ))
        ],
      ),
    );
  }
}
