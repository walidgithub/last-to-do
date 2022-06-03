import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/backgrounds/addtaskimage.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/taskshome.dart';
import '../classes/databaseclass.dart';
import '../classes/tasksjson.dart';
import '../components/components.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var tasknameController = TextEditingController();
  var tasktimeController = TextEditingController();
  var taskdateController = TextEditingController();
  var taskpriorityController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: getFooter(),
        body: Column(
          children: [
            AddTaskImage(),
            Expanded(
                child: Column(
              children: [
                Container(
                  height: 300,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextForm(
                            controller: tasknameController,
                            type: TextInputType.text,
                            label: 'Task Name',
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'task name must not be empty';
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        TextForm(
                            controller: tasktimeController,
                            type: TextInputType.text,
                            label: 'Task Time',
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'task time must not be empty';
                              } else {
                                return null;
                              }
                            },
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) => tasktimeController.text =
                                      value!.format(context).toString());
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        TextForm(
                            controller: taskdateController,
                            type: TextInputType.text,
                            label: 'Task Date',
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'task date must not be empty';
                              } else {
                                return null;
                              }
                            },
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-12-22'),
                              ).then((value) {
                                //package intl
                                taskdateController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        TextForm(
                            controller: taskpriorityController,
                            type: TextInputType.text,
                            label: 'Priority Name',
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'task priority must not be empty';
                              } else {
                                return null;
                              }
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
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
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await DatabaseHelper.instance.add(Tasks(
                      task: tasknameController.text,
                      time: tasktimeController.text,
                      date: taskdateController.text,
                      status: 'Task',
                      priority: taskpriorityController.text,
                    ));
                  }
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => TaskHome(priority: taskpriorityController.text,)));
                },
                child: Icon(
                  Icons.save_outlined,
                  size: 40,
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}
