import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/category.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

import '../data/categories.dart';

class NewItem extends StatefulWidget{
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  void _saveItem() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      final url = Uri.https("flutter-prep-443ec-default-rtdb.firebaseio.com", "Shopping-list.json");
      final response = await http.post(url, headers: {
        'Content-Type' : 'application/json',
      },
        body: json.encode({
          'name': _enteredName,
          'quantity': _enteredQuantity,
          'category': _selectedCategory.title

        })
      );

      // print(response.body);
      // print(response.statusCode);

      final Map<String, dynamic> resData = json.decode(response.body);

      if(!context.mounted){
        return;
      }
      Navigator.of(context).pop(
        GroceryItem(id: resData['name'],
            name: _enteredName,
            quantity: _enteredQuantity,
            category: _selectedCategory),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(12.00),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name")
                ),
                validator: (value){
                  if(value == null ||
                      value.isEmpty ||
                      value.trim().length <=1 ||
                      value.trim().length >50
                  ){
                    return "Name Must br between 1 and 50 characters";
                  }
                  return null;
                },
                onSaved: (value){
                  _enteredName = value!;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Quantity"),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      validator: (value){
                        if(value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <=0
                        ){
                          return "Quantity must by a positive value";
                        }
                        return null;
                      },
                      onSaved: (value){
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),

                  Expanded(
                    child: DropdownButtonFormField(
                        value: _selectedCategory,
                        items: [
                          for(final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  SizedBox.square(
                                    dimension: 10,
                                    child: ColoredBox(
                                      color: category.value.color,
                                ),
                              ),
                              const SizedBox(width: 6,),
                              Text(category.value.title)
                            ],
                          ),
                        )
                    ], onChanged: (value){
                          setState(() {
                            _selectedCategory = value!;
                          });

                    }),
                  )
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: _isSending ? null : (){
                    _formKey.currentState!.reset();
                  }, child: const Text("Reset")),
                  const SizedBox(width: 12,),
                  ElevatedButton(onPressed: _isSending ? null : _saveItem ,
                      child: _isSending ? const SizedBox(
                        height: 16,
                        width: 16,
                        child:  CircularProgressIndicator(),
                      ) :
                      const Text("Add Item"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}