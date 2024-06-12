import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    getValue();
  }

  var nameController = TextEditingController();
  var nameValue = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              ElevatedButton(onPressed: () async {
                var name = nameController.text.toString();

                var pref = await SharedPreferences.getInstance();

                pref.setString("name", name);

              },
                  child: const Text("Save")),
              Text(nameValue)
        ],
          ),
        ),
      )

    );
  }

  Future<void> getValue() async {
    var pref = await SharedPreferences.getInstance();
    var getName = pref.getString("name");

    nameValue = getName ?? "NO Value Saved";

    setState(() {

    });
  }
}
