import 'package:flutter/material.dart';
import 'package:word_book/screens/words_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
            backgroundColor: MaterialStateProperty.all(Colors.indigo),
          ))),
      home: WordsScreen(),
    );
  }
}
