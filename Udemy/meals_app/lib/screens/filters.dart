import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

enum Filters{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters,bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegetarianFilterSet = false;
  var veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    glutenFreeFilterSet = widget.currentFilters[Filters.glutenFree]!;
    lactoseFreeFilterSet = widget.currentFilters[Filters.lactoseFree]!;
    vegetarianFilterSet = widget.currentFilters[Filters.vegetarian]!;
    veganFilterSet = widget.currentFilters[Filters.vegan]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: (String identifier) {
      //   Navigator.pop(context);
      //   if(identifier == "Meals"){
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> const TabsScreen()));
      //   }
      // },),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop){
          if(didPop){
            return;
          }
          Navigator.of(context).pop(
            {
              Filters.glutenFree : glutenFreeFilterSet,
              Filters.lactoseFree: lactoseFreeFilterSet,
              Filters.vegetarian : vegetarianFilterSet,
              Filters.vegan : veganFilterSet
            }
          );
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeFilterSet,
              onChanged: (bool isCheckedGluten) {
                setState(() {
                  glutenFreeFilterSet = isCheckedGluten;
                });
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
              value: lactoseFreeFilterSet,
              onChanged: (bool isCheckedLactose) {
                setState(() {
                  lactoseFreeFilterSet = isCheckedLactose;
                });
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
              value: vegetarianFilterSet,
              onChanged: (bool isCheckedVegetarian) {
                setState(() {
                  vegetarianFilterSet = isCheckedVegetarian;
                });
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
              value: veganFilterSet,
              onChanged: (bool isCheckedVegan) {
                setState(() {
                  veganFilterSet = isCheckedVegan;
                });
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
      ),
    );
  }
}