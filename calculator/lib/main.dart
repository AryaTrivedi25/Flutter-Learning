import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 850,
          color: Colors.blue.shade100,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 5.0,right: 5.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: no1Controller,
                    decoration: InputDecoration(
                      hintText: "Enter the number",
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.orangeAccent,
                              width: 2
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20),
                          borderSide:const BorderSide(
                              color: Colors.black,
                              width: 1
                          )
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.blueAccent
                          )
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 40,),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: no2Controller,
                    decoration: InputDecoration(
                      hintText: "Enter the number",
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.orangeAccent,
                          width: 2
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(20),
                        borderSide:const BorderSide(
                          color: Colors.black,
                          width: 1
                        )
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.blueAccent
                        )
                      ),
                    ),
                  ),
                  const SizedBox.square(
                    dimension: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.center,
                        spacing: 40,
                        runSpacing: 10,
                        children: [
                          ElevatedButton(onPressed: (){

                            setState(() {
                              var no1 = int.parse(no1Controller.text.toString());
                              var no2 = int.parse(no2Controller.text.toString());

                              var sum = no1+no2;
                              result = "The sum of $no1 and $no2 is $sum";
                            });
                          }, child: Text("Addition")),
                          ElevatedButton(onPressed: (){

                            setState(() {
                              var no1 = int.parse(no1Controller.text.toString());
                              var no2 = int.parse(no2Controller.text.toString());

                              var sum = no1-no2;
                              result = "The substraction of $no1 and $no2 is $sum";
                            });
        
                          }, child: Text("Subtraction")),
                          ElevatedButton(onPressed: (){

                            setState(() {
                              var no1 = int.parse(no1Controller.text.toString());
                              var no2 = int.parse(no2Controller.text.toString());

                              var sum = no1*no2;
                              result = "The multiplication of $no1 and $no2 is $sum";
                            });
        
                          }, child: Text("Multiplication")),
                          ElevatedButton(onPressed: (){

                            setState(() {
                              var no1 = int.parse(no1Controller.text.toString());
                              var no2 = int.parse(no2Controller.text.toString());

                              var sum = no1/no2;
                              result = "The division of $no1 and $no2 is $sum";
                            });
        
                          }, child: Text("Division"))
                      ]
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(21),
                    child: Text("Result : $result", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}
