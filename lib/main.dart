import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:english_words/english_words.dart';

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
      theme:ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.deepPurple.shade900,
      appBarTheme: AppBarTheme(color: Colors.deepPurple.shade800),
      ),
      home: RandomPair()
    );
  }
}

class RandomPair extends StatefulWidget {
  RandomPair({Key? key}) : super(key: key);

  @override
  State<RandomPair> createState() => _RandomPairState();
}

class _RandomPairState extends State<RandomPair> {
  final username = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Username Generator'),
        ),
        body:  Center(child:  Text(username.asPascalCase),),
      );
  }
}
