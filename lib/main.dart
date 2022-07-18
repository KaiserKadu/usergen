import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './randomWords.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.deepPurple.shade900,
          appBarTheme: AppBarTheme(color: Colors.deepPurple.shade800),
        ),
        home: RandomPair());
  }
}




