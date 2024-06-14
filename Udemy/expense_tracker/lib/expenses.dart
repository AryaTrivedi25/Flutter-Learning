import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(child: ExpensesList(expenses: _registeredExpense))
        ],

      ),
    );
  }
  
}