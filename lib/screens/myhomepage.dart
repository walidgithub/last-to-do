import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/classes/databaseclass.dart';
import 'package:todo_app/components/waveheaderimage.dart';
import 'package:todo_app/screens/addtask.dart';
import 'package:todo_app/screens/taskshome.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Database? database;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            WaveHeaderImage(),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => AddTask()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Add Task',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepOrange.withOpacity(0.7))),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Achived Tasks:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white24),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FutureBuilder(
                            future: DatabaseHelper.instance.getPercentTasks(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: Text(
                                      '0',
                                      style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange
                                              .withOpacity(0.7)),
                                    ),
                                  ),
                                );
                              }
                              return snapshot.data!.isEmpty
                                  ? Text(
                                      '0',
                                      style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange
                                              .withOpacity(0.7)),
                                    )
                                  : Text(
                                      snapshot.data!.toString(),
                                      style: TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange
                                              .withOpacity(0.7)),
                                    );
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Priorities:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white24),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TaskHome(priority: 'high')));
                          },
                          child: Text(
                            'High',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white38)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TaskHome(priority: 'medium')));
                          },
                          child: Text(
                            'Medium',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white38)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TaskHome(priority: 'low')));
                          },
                          child: Text(
                            'Low',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white38)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
