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
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                    child: child,
                  );
                },
                child: Icon(isFavorite ? Icons.star : Icons.star_outline,
                    key: ValueKey(isFavorite)),
              ))
        ],
      ),
      body: Column(children: [
        Hero(
          tag: meal.id,
          child: Image.network(
            meal.imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
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
