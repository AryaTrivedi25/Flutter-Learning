import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses>{

  final List<Expense> _registeredExpense = [
    Expense(
        date: DateTime.now(),
        title: "Flutter Course",
        amount: 499.00,
        category: Category.work),
    Expense(
        date: DateTime.now(),
        title: "Cinema",
        amount: 121.00,
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true, context: context, builder: (ctx) {
      return NewExpense(onAddExpense: addExpense,);
    });

  }

  void addExpense(Expense expense){
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void removeExpense(Expense expense){
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3),
      content: Text("Expense Deleted!"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: (){
          _registeredExpense.insert(expenseIndex, expense);
          setState(() {

          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContent = const Center(
      child: Text("No Expenses to show Click + to add."),
    );
    if(_registeredExpense.isNotEmpty){
      mainContent = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("The chart"),
            Expanded(child: ExpensesList(expenses: _registeredExpense, onRemoveExpense: removeExpense,))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
        title: const Text("Expense Tracker"),
        backgroundColor: Colors.yellow,
      ),
      body: mainContent
    );
  }
  
}