import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget{
  const MealDetailsScreen({super.key, required this.meal, required this.onToggleFavourite});

   final Meal meal;
   final void Function(Meal meal) onToggleFavourite;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavourite(meal);
          },
              icon: Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20,),
              Text("Ingredients", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 10,),
              for(final ingredient in meal.ingredients)
                Text(ingredient, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary
                ),),
        
              const SizedBox(height: 20,),
              Text("Steps", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 10,),
              for(final step in meal.steps)

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 8
                  ),
                  child: Text(step, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary
                  ),),
                ),
            ],
          ),
        ),
      ),
    );
  }

}