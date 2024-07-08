import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

class GroceryList extends StatelessWidget{
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title : const Text("Your Groceries"),
      ),

      body: ListView.builder(itemBuilder: (ctx, index) => ListTile(
        title: Text(groceryItems[index].name),
        leading: Container(
          width: 24,
          height: 24,
          color: groceryItems[index].category.color,
        ),
        trailing: Text(
          groceryItems[index].quantity.toString()),
      )),

    );
  }

}