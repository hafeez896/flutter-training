import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> favoriteMeals = [];

  int selectedTabIndex = 0;
  String pageTitle = "Categories";

  void onTabClicked(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  void toggleFavoriteStatus(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
    }
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final result = await Navigator.of(context).push<Map<String, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = CategoryScreen(toggleFavoriteStatus);
    pageTitle = "Categories";

    if (selectedTabIndex == 1) {
      screen = Meals(
        meals: favoriteMeals,
        toggleFavoriteStatus: toggleFavoriteStatus,
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
