import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/classes/taskimage.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/app_state.dart';

import '../classes/databaseclass.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  Database? database;

  List<Map> tt = [];

  Future<void> createDb() async {
    database = await openDatabase('todo_app2', version: 1,
        onCreate: (Database db, int version) async {
      print('database created');
      await db
          .execute(
              'CREATE TABLE ToDoTasks (id INTEGER PRIMARY KEY, task TEXT, time TEXT, date TEXT, status TEXT, priority TEXT)')
          .catchError((error) => print("error${error.toString()}"));
    }, onOpen: (database) {
      // getDb(database,'High').then((value) => value = t1);
    });
  }

  void getDb(database) {
    // String? priority;
    database.rawQuery(
        'SELECT * FROM ToDoTasks').then((value) {
      value.forEach((element) {
        // if (element['priority'] == 'High') {
          tt.add(element);
        // } else if (element['priority'] == 'Low') {
        //   tt.add(element);
        // } else if (element['priority'] == 'Medium') {
        //   tt.add(element);
        // }
      });
      emit(AppGetDBState());
    });
  }
}
