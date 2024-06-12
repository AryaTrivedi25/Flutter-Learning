import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      debugShowCheckedModeBanner: false,
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

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Container"),
      ),
      body:
      Container(
        height: 500,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Current Time : ${DateFormat('jms').format(time)}", style: TextStyle(fontSize: 25),),
            Center(
                child: InkWell(
                  onTap: (){
                    print("Box tapped!!");
                  },
                  onDoubleTap: (){
                    print("Box double tapped");
                  },
                  child: Container(
                      height: 250,
                      width: 250,
                      color: Colors.pinkAccent,
                      child: Center(
                        child: InkWell(
                            onTap: (){
                              print("Text clicked..!!");
                              setState(() {

                              });
                            },
                            onDoubleTap: (){
                              print("Text Double clicked..!!");
                            },
                            child: Text("To get current Time click me..!!",
                              style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold),
                            )),
                      )
                  ),
                )
            ),
            ElevatedButton(onPressed: () async {
              DateTime? datepicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2050));

              if(datepicked!= null){
                print("Date selected : ${datepicked.day}-${datepicked.month}-${datepicked.year}");
              }
            },
                child: Text("Pick Date")),
            ElevatedButton(onPressed: () async {
              TimeOfDay? timepicked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.dial
              );
              if(timepicked!=null){
                print("Picked time is : ${timepicked.hour}:${timepicked.minute}");
              }
            }, child: Text("Pick Time"))
          ],
        ),
      )

    );
  }
}
