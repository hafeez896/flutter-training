import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen>
    with SingleTickerProviderStateMixin {
  void goToMealsScreen(BuildContext context, Category category, WidgetRef ref) {
    final meals = ref.watch(filteredMealsProvider);

    final categoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Meals(
          categoryName: category.title,
          meals: categoryMeals,
        ),
      ),
    );
  }

  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (ctx, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: animationController, curve: Curves.easeInOut)),
          child: child,
        );
      },
      child: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              goToMealsScreen: () {
                goToMealsScreen(context, category, ref);
              },
            )
        ],
      ),
    );
  }
}
