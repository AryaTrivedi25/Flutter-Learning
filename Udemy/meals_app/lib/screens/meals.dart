import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {

    Widget mainData = ListView.builder(itemCount: meals.length,
        itemBuilder: (context,index) => MealItem(meal: meals[index]));
      if(meals.isEmpty){
        mainData = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No data available to Show at this time.!",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.primary)),
              const SizedBox(height: 20,),
              Text("Try selecting different Category..!", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.secondary),)
            ],
          )
        );
      }


    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainData,
    );
  }

  

}