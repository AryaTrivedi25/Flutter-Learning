import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget{
  MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {

    mainData() {
      if(meals.isEmpty){
        const Text("No data available to Show at this time.!");
      }
      else{
        Container(
          child: Column(
            children: ListView.builder(itemBuilder: (context,index) {
              return meals.map((meal) => )
            }),
          ),
        )
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainData(),
    );
  }

  

}