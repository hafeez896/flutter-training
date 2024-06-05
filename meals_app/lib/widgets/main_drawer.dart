import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer(this.setScreen, {Key? key}) : super(key: key);

  final void Function(String identifier) setScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 48,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              const SizedBox(
                width: 18,
              ),
              const Text(
                "Cooking",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
            ],
          ),
        ),
        ListTile(
          title: const Text("Meals"),
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onTap: () {
            setScreen("meals");
          },
        ),
        ListTile(
          title: const Text("Filters"),
          leading: Icon(
            Icons.settings,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onTap: () {
            setScreen("filters");
          },
        ),
      ]),
    );
  }
}
