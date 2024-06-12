import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Login'),
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
  int _counter = 0;
  var emailText = TextEditingController();
  var passText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailText,
                  decoration: InputDecoration(
                      hintText: "Enter E-mail",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.00),
                        borderSide: const BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 2
                          )
                        ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.00),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent
                  )
                ),
                      disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.00),
                      borderSide: const BorderSide(
                          color: Colors.black
                  )
                  ),

                      prefixIcon: Icon(Icons.email, color: Colors.blueAccent,)
                  ),

                ),
                Container(height: 15),
                TextField(
                  obscureText: true,
                  obscuringCharacter: 'a',
                  controller: passText,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.00)
                      ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye,color: Colors.blueAccent,),
                      onPressed: (){},
                    ),
                  ),

                ),
                Container(height: 15),
                ElevatedButton(onPressed: (){
                  String uEmail = emailText.text.toString();
                  String uPass = passText.text.toString();

                  print("Email : $uEmail, pass : $uPass");

                }, child: Text("Login"))
              ],
            )

        ),
      )

    );
  }
}
