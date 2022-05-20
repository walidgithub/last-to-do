import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  String task;
  String time;
  String date;
  String status;
  String priority;

  Todo(
      {required this.task,
      required this.time,
      required this.date,
      required this.status,
      required this.priority});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 110,
        margin: EdgeInsets.only(bottom: 5, left: 3, right: 3),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 1)),
        ], borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: ListTile(
          leading: Icon(
            Icons.task,
            color: Colors.blue,
            size: 40.0,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.task,
                style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.check_circle_outline),
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline),
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.archive_outlined),
                    color: Colors.black,
                  ),
                ],
              )
            ],
          ),
          subtitle: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.time,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Status: " + widget.status,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    "Priority: "+ widget.priority,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Divider(
        height: 5.0,
      )
    ]);
  }
}
