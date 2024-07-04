import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key, });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filters.glutenFree]!,
              onChanged: (bool isCheckedGluten) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filters.glutenFree, isCheckedGluten);
              },
              title: Text("Gluten-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary
              ),),
              subtitle: Text("only include Gluten-Free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.lactoseFree]!,
              onChanged: (bool isCheckedLactose) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filters.lactoseFree, isCheckedLactose);
              },
              title: Text("Lactose-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                ),),
              subtitle: Text("only include Lactose-Free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegetarian]!,
              onChanged: (bool isCheckedVegetarian) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filters.vegetarian, isCheckedVegetarian);
              },
              title: Text("Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                ),),
              subtitle: Text("only include Vegetarian meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegan]!,
              onChanged: (bool isCheckedVegan) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filters.vegan, isCheckedVegan);
              },
              title: Text("Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                ),),
              subtitle: Text("only include Vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary
                ),),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ]
        ),
    );
  }
}