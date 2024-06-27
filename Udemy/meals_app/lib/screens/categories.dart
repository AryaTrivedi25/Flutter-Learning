import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../models/category.dart';

class CategoriesScreen extends StatelessWidget{

  void selectCategory(BuildContext context, Category category){
    final filteredMeals =  dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pick your category !", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow,
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children : availableCategories.map((category) {
          return CategoryGridItem(category: category, onSelectCategory: (){
            selectCategory(context, category);
          },);
        }).toList())
    );
  }

}