import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

var myColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(
    255, 5, 47, 255));

var myDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromRGBO(
    200, 1, 255, 1.0));

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((fn){
    runApp( MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: myDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myDarkColorScheme.onPrimaryContainer,
            foregroundColor: myDarkColorScheme.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
          color: myDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: myDarkColorScheme.tertiaryContainer,
        )),
        textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(
            textStyle: const TextStyle(color: Colors.black)
        )),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: myDarkColorScheme.secondary,
                fontSize: 25
            ),
            headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: myDarkColorScheme.onSecondaryContainer,
                fontSize: 18
            ),
            bodySmall: TextStyle(
                color: myDarkColorScheme.tertiaryContainer ,
                fontSize: 14,
                backgroundColor: myDarkColorScheme.tertiary
            )
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: myColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myColorScheme.onPrimaryContainer,
            foregroundColor: myColorScheme.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: myColorScheme.primaryContainer,
        )),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: myColorScheme.secondary,
                fontSize: 25
            ),
            headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: myColorScheme.secondary,
                fontSize: 18
            ),
            bodySmall: TextStyle(
                color: myColorScheme.tertiary,
                fontSize: 14
            )
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ));
  // });
}