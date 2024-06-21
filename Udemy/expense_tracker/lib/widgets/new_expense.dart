import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  TextEditingController title = TextEditingController();
  TextEditingController amount = TextEditingController();
  DateTime? selectedDate;

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
    return Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: title,
            decoration: const InputDecoration(
              label: Text("Title"),
              hintText: "Enter Title",
            ),
          ),
          Row(
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
              Expanded(child: IconButton(onPressed: (){presentDatePicker();}, icon: Icon(Icons.calendar_month))),
              Expanded(child: Text(selectedDate == null ? "No date Selected" :(DateFormat.yMMMd().format(selectedDate!)).toString())),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(items: Category, onChanged: (value){}),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Cancel")),
              ElevatedButton(onPressed: (){
                print("Output : ${title.text.toString()} && Amount : ${amount.text}");

              }, child: Text("Save"))
            ],
          )
        ],
      ),

    );
  }
}