import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/classes/databaseclass.dart';
import 'dart:math' as math;

import 'package:todo_app/components/straightwave.dart';
import 'package:todo_app/classes/tasksclass.dart';

class TaskImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ClipPath(
              child: Stack(
                children: [
                  Image.asset('assets/images/task.png'),
                  Positioned(
                      top: 120,
                      left: 20,
                      child: Transform.rotate(
                        angle: math.pi / -50,
                        child: Text(
                          'Tasks',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ))
                ],
              ),
              clipper: BottomWaveClipper(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: t1.length,
                itemBuilder: (context, index) {
                  return Todo(
                    task: t1[index]['task'],
                    time: t1[index]['time'],
                    date: t1[index]['date'],
                    status: t1[index]['status'],
                    priority: t1[index]['priority'],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
