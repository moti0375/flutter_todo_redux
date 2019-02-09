import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Dodo Redux",
      theme: ThemeData.dark(),
      home: new AppHomePage(),
    );
  }
}