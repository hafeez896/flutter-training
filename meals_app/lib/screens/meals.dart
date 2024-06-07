import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({
    this.categoryName,
    required this.meals,
    Key? key,
  }) : super(key: key);

  final String? categoryName;
  final List<Meal> meals;

  void goToMealDetails(BuildContext context, Meal meal) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => MealDetails(meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) => MealItem(meals[index], () {
        goToMealDetails(context, meals[index]);
      }),
      itemCount: meals.length,
    );

    if (categoryName == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(categoryName!)),
      body: content,
    );
  }
}
