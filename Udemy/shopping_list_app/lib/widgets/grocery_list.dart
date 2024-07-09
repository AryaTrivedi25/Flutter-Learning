import 'dart:convert';


import 'package:flutter/material.dart';

import 'package:shopping_list_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;

import '../data/categories.dart';
import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget{
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  String? _error;

  var isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loadItems();
    });
  }

  void _loadItems() async{
    final url = Uri.https("flutter-prep-443ec-default-rtdb.firebaseio.com", "Shopping-list.json");


    try{
      final response = await http.get(url);

      if(response.statusCode >=400){
        setState(() {
          _error = "Failed to fetch Data. Please try again later.";
          isLoading = false;
        });
      }
      if(response.body == 'null'){
        setState(() {
          isLoading = false;
        });
        return;
      }
      final Map<String,dynamic> listData = jsonDecode(response.body);
      final List<GroceryItem> loadedItems = [];
      for(final item in listData.entries){
        final category = categories.entries.firstWhere((catItem) => catItem.value.title == item.value['category']).value;
        loadedItems.add(GroceryItem(id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category));
      }
      setState(() {
        _groceryItems = loadedItems;
        isLoading = false;
      });

    }catch(error){
      setState(() {
        _error = "Something went wrong..! Please try again later.";
      });

    }

    // print(response.body);
    // print("Helo ${response.statusCode}");


    


  }

  void _addItem() async{
    final newItem = await Navigator.of(context).push<GroceryItem>
      (MaterialPageRoute(builder: (ctx) {
      return const NewItem();
    }));

    if(newItem == null){
      return;
    }
    setState(() {
      _groceryItems.add(newItem);

    });
  }

  Future<void> _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https("flutter-prep-443ec-default-rtdb.firebaseio.com",
        "Shopping-list/${item.id}.json");

    final response = await http.delete(url);
    
    if(response.statusCode >= 400){
      setState(() {
        _groceryItems.insert(index, item);
      });
    }


  }

  @override
  Widget build(BuildContext context) {

    Widget mainContent;
    if(_error != null){
      mainContent = Center(
        child: Text(_error!),
      );
      setState(() {
        isLoading = false;
      });
    }
    else if(isLoading){
      mainContent = const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              const SizedBox(width: 20,),
              Text("Loading..", style:
              TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ],
          )
      );
    }
    else if(_groceryItems.isEmpty){
      mainContent =const Center(child: Text("Opps..! No Items in the list.", style:
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),));
    }
    else{
      mainContent = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(_groceryItems[index].id),
            onDismissed: (direction){
              _removeItem(_groceryItems[index]);
            },
            child: ListTile(
              title: Text(_groceryItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: _groceryItems[index].category.color,
              ),
              trailing: Text(
                  _groceryItems[index].quantity.toString()),

            ),
          ));

    }


    return Scaffold(
      appBar: AppBar(
        title : const Text("Your Groceries"),
        actions: [
          IconButton(onPressed: (){
            _addItem();
          }, icon: const Icon(Icons.add)),
        ],
      ),

      body: mainContent,

    );
  }
}