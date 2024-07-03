import 'package:flutter/material.dart';
import 'package:meals_app/Providers/favourites_provider.dart';
import 'package:meals_app/Providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';


const kInitialFilters = {
  Filters.glutenFree : false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  int selectedPageIndex = 0;
  Map<Filters, bool> selectedFilters = kInitialFilters;

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

    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal){
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

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,);

    var activePageTitle = "Categories";

    if(selectedPageIndex == 1){
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,);
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