import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/classes/archivedimage.dart';
import 'package:todo_app/classes/doneimage.dart';
import 'package:todo_app/classes/taskimage.dart';
import 'dart:math' as math;
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:todo_app/screens/addtask.dart';

import '../classes/databaseclass.dart';

class TaskHome extends StatefulWidget {
  @override
  _TaskHomeState createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  int activeTab = 0;

  List<Widget> Screens = [TaskImage(), DoneImage(), ArchivedImage()];

  void initState(){
    super.initState();
    DatabaseF.createDb();
    // DatabaseF.gatAllData;
  }

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
            condition: t1.length >= 0,
            builder: (context) => Screens[activeTab],
            fallback: (context) => CircularProgressIndicator(),
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
