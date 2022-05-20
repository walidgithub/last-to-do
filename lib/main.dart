import 'package:flutter/material.dart';
import 'package:todo_app/screens/myhomepage.dart';
import 'package:todo_app/screens/taskshome.dart';
import 'package:todo_app/screens/addtask.dart';

import 'package:todo_app/classes/tasksclass.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFF212121)
      ),
      home: MyHomePage(),
    );
  }
}
