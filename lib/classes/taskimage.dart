import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/classes/databaseclass.dart';
import 'dart:math' as math;

import 'package:todo_app/components/straightwave.dart';
import 'package:todo_app/classes/tasksclass.dart';
import 'package:todo_app/cubit/app_cubit.dart';

import '../cubit/app_state.dart';

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
            BlocProvider(
              create: (BuildContext context) => AppCubit(),
              child: BlocConsumer<AppCubit, AppState>(
                  listener: (BuildContext context, AppState state) {},
                  builder: (BuildContext context, AppState state) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                        itemCount: t1.length,
                        itemBuilder: (context, index) {
                          return Card(
                          child: Text("$t1"));
                        },
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
