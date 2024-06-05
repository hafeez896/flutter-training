import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var vegFilterSet = false;

  // void setScreen(String identifier) {
  //   Navigator.of(context).pop();
  //   if (identifier == "meals") {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (ctx) => const TabsScreen(),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          "veg": vegFilterSet,
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Filter")),
        // endDrawer: MainDrawer(setScreen),
        body: Column(children: [
          SwitchListTile(
            value: vegFilterSet,
            onChanged: (isChecked) {
              setState(() {
                vegFilterSet = isChecked;
              });
            },
            title: const Text(
              "Vegetarian",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: const Text("Only include veg foods"),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ]),
      ),
    );
  }
}
