import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedTabIndex = 0;
  String pageTitle = "Categories";

  void onTabClicked(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  void setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      Navigator.of(context).push<Map<String, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = const CategoryScreen();
    pageTitle = "Categories";

    final favoriteMeals = ref.watch(favoriteMealsProvider);

    if (selectedTabIndex == 1) {
      screen = Meals(
        meals: favoriteMeals,
      );
      pageTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: screen,
      endDrawer: MainDrawer(setScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTabIndex,
        onTap: onTabClicked,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "Favorites"),
        ],
      ),
    );
  }
}
