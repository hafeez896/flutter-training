import "dart:math";
import "package:flutter/material.dart";

var randomizer = Random();

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() {
    return _RollDiceState();
  }
}

class _RollDiceState extends State<RollDice> {
  var diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/dice-$diceNumber.png",
          width: 200,
        ),
        const SizedBox(
          height: 50,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: const Text(
            "Roll Dice",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        )
      ],
    );
  }
}
