import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, this.title, required this.meals, });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal){
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal, )));
  }

  @override
  Widget build(BuildContext context) {

    Widget mainData = ListView.builder(itemCount: meals.length,
        itemBuilder: (context,index) => MealItem(meal: meals[index], onSelectMeal: (Meal meal) { selectMeal(context, meal); },));
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
      if(title == null){
        return mainData;
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: mainData,
    );
  }

  

}