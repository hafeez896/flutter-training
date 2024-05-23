import "package:firstapp/roll_dice.dart";
import "package:flutter/material.dart";

const containerAlignment = Alignment.center;

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: containerAlignment,
      color: Colors.purple,
      width: double.maxFinite,
      height: double.maxFinite,
      child: RollDice(),
    );
  }
}
