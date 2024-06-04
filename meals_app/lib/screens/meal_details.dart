import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(this.meal, {Key? key}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(children: [
        Image.network(
          meal.imageUrl,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Ingredients",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        for (final ingredient in meal.ingredients)
          Text(
            ingredient,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
      ]),
    );
  }
}
