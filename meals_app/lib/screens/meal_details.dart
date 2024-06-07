import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails(this.meal, {Key? key}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleFavoriteStatus(meal);
              },
              icon: Icon(isFavorite ? Icons.star : Icons.star_outline))
        ],
      ),
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
