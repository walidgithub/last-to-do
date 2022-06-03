import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/classes/databaseclass.dart';
import 'dart:math' as math;

import 'package:todo_app/components/straightwave.dart';
import 'package:todo_app/classes/tasksclass.dart';

import '../classes/tasksjson.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class DoneImage extends StatefulWidget {
  String priority;
  DoneImage(this.priority);

  @override
  State<DoneImage> createState() => _DoneImageState();
}

class _DoneImageState extends State<DoneImage> {
  String status ='Done';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
        listener: (BuildContext context, AppState states) {},
    builder: (BuildContext context, AppState) => Scaffold(
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
                          'Done',
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
              child: FutureBuilder<List<Tasks>>(
                  future: AppCubit.get(context).getTasks(widget.priority,status),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Tasks>> snapshot) {
                    if (!snapshot.hasData) {
                      return  Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return snapshot.data!.isEmpty
                        ? Center(
                      child: Text(
                        'No Tasks Found.',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                        : ListView(
                      children: snapshot.data!.map((tasks) {
                        return Todo(
                          id: tasks.id!,
                          task: tasks.task!,
                          time: tasks.time!,
                          date: tasks.date!,
                          status: tasks.status!,
                          priority: tasks.priority!,
                        );
                      }).toList(),
                    );
                  }),
            ),
          ],
        ))

    ));
  }
}
