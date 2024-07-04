import 'package:flutter/material.dart';
import 'package:meals_app/Providers/favourites_provider.dart';
import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerWidget{
  const MealDetailsScreen({super.key, required this.meal, });

   final Meal meal;



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isFavourite = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
         title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            bool wasAdded  = ref.read(favouriteMealsProvider.notifier).toggleMealsFavouriteStatus(meal);
            String message;
            if(wasAdded){
              message = "Item added to Favourites..!";
            }
            else{
              message = "Item removed from Favourites..!";
            }
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message))
              );
          },
              icon: Icon(isFavourite ? Icons.star : Icons.star_border))
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