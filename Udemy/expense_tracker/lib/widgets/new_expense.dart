import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart' as expense;

import '../models/expense.dart';


class NewExpense extends StatefulWidget{
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  TextEditingController title = TextEditingController();
  TextEditingController amount = TextEditingController();
  DateTime? selectedDate;
  expense.Category selectedCategory = expense.Category.leisure;

  void submitExpenseData(){
    final enteredAmount = double.tryParse(amount.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount<0;
    if(title.text.trim().isEmpty || amountIsInvalid || selectedDate == null){
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          title: const Text("Invalid Input..!!"),
          content: const Text("Please make sure that all the values entered are correct"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text("okay"),
            style: Theme.of(context).textButtonTheme.style,),
          ],
        );
      });
      return;
    }
    widget.onAddExpense(expense.Expense(date: selectedDate!, title: title.text, amount: enteredAmount, category: selectedCategory));
    Navigator.pop(context);
  }

  Future<void> presentDatePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate =  DateTime(now.year-1, now.month, now.day);
    DateTime pickedDate = await showDatePicker(context: context,initialDate: now,
        firstDate: firstDate, lastDate: now) as DateTime;
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void dispose(){
    title.dispose();
    amount.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final keySpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx,constrains){
      final width = constrains.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(padding:  EdgeInsets.fromLTRB(16, 16, 16,keySpace + 16),
            child: Column(
              children: [
                if(width >= 600)
                  Row(children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: title,
                        decoration: const InputDecoration(
                          label: Text("Title"),
                          hintText: "Enter Title",
                        ),
                      ),
                    ),
                    const SizedBox(width: 24,),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: amount,
                        decoration: const InputDecoration(
                          prefix: Text("₹ ") ,
                          label: Text("Amount"),
                          hintText: "Enter Amount",
                        ),
                      ),
                    ),
                  ],)
                else
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: title,
                    decoration: const InputDecoration(
                      label: Text("Title"),
                      hintText: "Enter Title",
                    ),
                  ),
                const SizedBox(height: 16,),
              if(width>= 600)
                Row(children: [
                  DropdownButton(
                      style: Theme.of(context).textTheme.bodySmall,
                      value: selectedCategory ,
                      items: expense.Category.values.map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase(),))).toList() ,
                      onChanged: (value){
                        if(value == null){
                          return;
                        }
                        setState(() {
                          selectedCategory = value;
                        });
                      }),
                  const SizedBox(width: 24,),
                  const Spacer(),
                  Text(selectedDate == null ? "No date Selected" :
                  (DateFormat.yMMMd().format(selectedDate!)).toString()),
                  IconButton(onPressed: () {presentDatePicker();},
                      icon: const Icon(Icons.calendar_month, color: Colors.black,)),
                ],)
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: amount,
                      decoration: const InputDecoration(
                        prefix: Text("₹ ") ,
                        label: Text("Amount"),
                        hintText: "Enter Amount",
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(selectedDate == null ? "No date Selected" :
                    (DateFormat.yMMMd().format(selectedDate!)).toString()),
                    IconButton(onPressed: () {presentDatePicker();},
                        icon: const Icon(Icons.calendar_month, color: Colors.black,)),
                  ],
                ),
                const SizedBox(height: 16,),
                if(width >= 600)
                  Row(children: [
                    const Spacer(),
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, child: const Text("Cancel", style: TextStyle(color: Colors.black),)),
                    ElevatedButton(onPressed: submitExpenseData, child: const Text("Save",))
                  ],)
                else
                  Row(
                  children: [
                    DropdownButton(
                        style: Theme.of(context).textTheme.bodySmall,
                        value: selectedCategory ,
                        items: expense.Category.values.map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase(),))).toList() ,
                        onChanged: (value){
                          if(value == null){
                            return;
                          }
                          setState(() {
                            selectedCategory = value;
                          });
                        }),
                    const Spacer(),
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, child: const Text("Cancel", style: TextStyle(color: Colors.black),)),
                    ElevatedButton(onPressed: submitExpenseData, child: const Text("Save",))
                  ],
                )
              ],
            ),

          ),
        ),
      );
    });
  }
}