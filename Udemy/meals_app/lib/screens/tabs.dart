import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];

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

  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen(onToggleFavourite: toggleMealFavouriteStatus);
    var activePageTitle = "Categories";
    if(selectedPageIndex == 1){
      activePage = MealsScreen( meals: favouriteMeals, onToggleFavourite: (Meal meal) { toggleMealFavouriteStatus(meal); },);
      activePageTitle = "Your Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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