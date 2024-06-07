import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Filter")),
      body: Column(children: [
        SwitchListTile(
          value: activeFilters[Filter.veg]!,
          onChanged: (isChecked) {
            ref.read(filtersProvider.notifier).setFilter(Filter.veg, isChecked);
          },
          title: const Text(
            "Vegetarian",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("Only include veg foods"),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filter.vegan]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, isChecked);
          },
          title: const Text(
            "Vegan",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("Only include vegan foods"),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        SwitchListTile(
          value: activeFilters[Filter.glutenFree]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, isChecked);
          },
          title: const Text(
            "Gluten Free",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text("Only include gluten free foods"),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
      ]),
    );
  }
}
