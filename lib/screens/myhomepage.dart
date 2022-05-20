import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/waveheaderimage.dart';
import 'package:todo_app/screens/taskshome.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
                        Text(
                          '50%',
                          style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange.withOpacity(0.7)),
                        ),
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
                                    builder: (_) => TaskHome()));
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
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white38)
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {},
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
                                  )
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white38)
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {},
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
                                  )
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white38)
                          ),
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
