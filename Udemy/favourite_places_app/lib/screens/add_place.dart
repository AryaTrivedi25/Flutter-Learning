import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget{
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new place")
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: titleController,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton.icon(icon: const Icon(Icons.add), label: Text("save place"), onPressed: () {  },),


          ],
        ),
      ),
    );

  }
}