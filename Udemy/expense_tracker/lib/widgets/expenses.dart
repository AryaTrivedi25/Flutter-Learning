import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'Chart/chart.dart';

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
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text("No Expenses to show Click + to add."),
    );
    if(_registeredExpense.isNotEmpty){
      mainContent = width < 600 ?  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(child: Chart(expenses: _registeredExpense,)),
            Expanded(child: ExpensesList(expenses: _registeredExpense, onRemoveExpense: removeExpense,))
          ],
        ),
      ) : Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Chart(expenses: _registeredExpense,)),
        Expanded(child: ExpensesList(expenses: _registeredExpense, onRemoveExpense: removeExpense,))
      ],
      ),
    );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add,))
        ],
        title: const Text("Expense Tracker"),
      ),
      body: mainContent
    );
  }
}


