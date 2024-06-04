import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedTabIndex = 0;
  String pageTitle = "Categories";

  void onTabClicked(int index) {
    setState(() {
      selectedTabIndex = index;
      pageTitle = "Favorites";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = const CategoryScreen();

    if (selectedTabIndex == 1) {
      screen = Meals(
        meals: [],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: screen,
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
