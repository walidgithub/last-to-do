import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/classes/databaseclass.dart';
import 'package:todo_app/classes/tasksjson.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class Todo extends StatefulWidget {
  int id;
  String task;
  String time;
  String date;
  String status;
  String priority;

  Todo(
      {required this.id,
      required this.task,
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
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (BuildContext context, AppState states) {},
        builder: (BuildContext context, AppState) => Column(children: [
          Container(
            width: double.infinity,
            height: 110,
            margin: EdgeInsets.only(bottom: 5, left: 3, right: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.2)),
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
                      ConditionalBuilder(
                        // condition: t1.length >= 0,
                        condition: widget.status == 'Task' ||
                            widget.status == 'Archived',
                        builder: (context) {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                AppCubit.get(context).update(Tasks(
                                    id: widget.id,
                                    task: widget.task,
                                    time: widget.time,
                                    date: widget.date,
                                    status: 'Done',
                                    priority: widget.priority));
                              });
                            },
                            icon: Icon(Icons.check_circle_outline),
                            color: Colors.blue,
                          );
                        },
                        fallback: (context) {
                          return Text('');
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ConditionalBuilder(
                        // condition: t1.length >= 0,
                        condition: widget.status == 'Task' ||
                            widget.status == 'Archived' ||
                            widget.status == 'Done',
                        builder: (context) {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                AppCubit.get(context).remove(widget.id);
                              });
                            },
                            icon: Icon(Icons.delete_outline),
                            color: Colors.red,
                          );
                        },
                        fallback: (context) {
                          return Text('');
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ConditionalBuilder(
                        // condition: t1.length >= 0,
                        condition: widget.status == 'Task',
                        builder: (context) {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                AppCubit.get(context).update(Tasks(
                                    id: widget.id,
                                    task: widget.task,
                                    time: widget.time,
                                    date: widget.date,
                                    status: 'Archived',
                                    priority: widget.priority));
                              });
                            },
                            icon: Icon(Icons.archive_outlined),
                            color: Colors.black,
                          );
                        },
                        fallback: (context) {
                          return Text('');
                        },
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
                        "Priority: " + widget.priority,
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
        ]),
      ),
    );
  }
}
