import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

const kInitialFilters = {
  Filters.glutenFree : false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false
};

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];
  Map<Filters, bool> selectedFilters = kInitialFilters;

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  void toggleMealFavouriteStatus(Meal meal){
    final isExisting = favouriteMeals.contains(meal);
    if(isExisting){
      setState(() {
        favouriteMeals.remove(meal);
      });
      showInfoMessage("Meal is removed from favourite.");
    }
    else{
      setState(() {
        favouriteMeals.add(meal);
      });
      showInfoMessage("Meal is added to favourite.");

    }
  }

  void selectPage( int index){
    setState(() {
      selectedPageIndex = index;
    });
  }

  Future<void> setScreen(String identifier) async {
    Navigator.pop(context);
    if(identifier == "Filters"){
      final result = await Navigator.push<Map<Filters, bool>>
        (context, MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: selectedFilters,)));

      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal){
      if(selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(selectedFilters[Filters.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(selectedFilters[Filters.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(onToggleFavourite: toggleMealFavouriteStatus, availableMeals: availableMeals,);
    var activePageTitle = "Categories";
    if(selectedPageIndex == 1){
      activePage = MealsScreen( meals: favouriteMeals, onToggleFavourite: (Meal meal) { toggleMealFavouriteStatus(meal); },);
      activePageTitle = "Your Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer:  MainDrawer(onSelectScreen: setScreen ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}