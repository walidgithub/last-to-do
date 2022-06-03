import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:todo_app/components/straightwave.dart';

class AddTaskImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Stack(
        children: [
          Image.asset('assets/images/task.png'),
          Positioned(
              top: 120,
              left: 20,
              child: Transform.rotate(
                angle: math.pi / -50,
                child: Text(
                  'Add Task',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ))
        ],
      ),
      clipper: BottomWaveClipper(),
    );
  }
}


