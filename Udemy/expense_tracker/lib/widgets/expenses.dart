import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/cupertino.dart';
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
    showModalBottomSheet(context: context, builder: (ctx) {
      return NewExpense();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
        ],
        title: const Text("Expense Tracker"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("The chart"),
            Expanded(child: ExpensesList(expenses: _registeredExpense))
          ],
        ),
      ),
    );
  }
  
}