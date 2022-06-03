import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/backgrounds/archivedimage.dart';
import 'package:todo_app/backgrounds/taskimage.dart';
import 'dart:math' as math;
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:todo_app/screens/addtask.dart';

import '../backgrounds/doneimage.dart';

class TaskHome extends StatefulWidget {
  String priority;

  TaskHome({required this.priority});

  @override
  _TaskHomeState createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  int activeTab = 0;

  List<Widget> Screens = [TaskImage(''), DoneImage(''), ArchivedImage('')];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: getFooter(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartDocked,
        floatingActionButton: getFloatingButton(),
        body: Center(
          child: ConditionalBuilder(
            condition: activeTab >= 0,
            builder: (context) {
              if (Screens[activeTab].toString() == 'TaskImage') {
                return TaskImage(widget.priority);
              } else if (Screens[activeTab].toString() == 'DoneImage') {
                return DoneImage(widget.priority);
              } else if (Screens[activeTab].toString() == 'ArchivedImage') {
                return ArchivedImage(widget.priority);
              } else {
                return TaskImage(widget.priority);
              }
            },
            fallback: (context) {
              return Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 90,
      margin: EdgeInsets.only(bottom: 5, left: 3, right: 3),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 1)),
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 0;
                  });
                },
                child: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: activeTab == 0 ? Colors.blue : Colors.black,
                )),
            SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
              child: Icon(
                Icons.check_box_outlined,
                size: 30,
                color: activeTab == 1 ? Colors.blue : Colors.black,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 2;
                });
              },
              child: Icon(
                Icons.archive_outlined,
                size: 30,
                color: activeTab == 2 ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFloatingButton() {
    return Stack(
      children: [
        Transform.rotate(
            angle: math.pi / 4,
            child: Container(
              width: 65,
              height: 65,
              margin: EdgeInsets.only(top: 10, left: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
            )),
        Positioned(
          top: 2,
          left: -3,
          child: GestureDetector(
            onTap: () {
              setState(() {
                activeTab = 3;
              });
            },
            child: Transform.rotate(
                angle: math.pi / 4,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddTask()));
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(bottom: 10, left: 13),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: Transform.rotate(
                      angle: math.pi / 4,
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                )),
          ),
        )
      ],
    );
  }
}
