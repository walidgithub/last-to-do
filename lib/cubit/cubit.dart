import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../classes/tasksjson.dart';
import 'state.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'AllMyTasks.db');
    emit(OpenDatabase());
    return await openDatabase(
      path,
      version: 1,
    );
  }

  Future<List<Tasks>> getTasks(String priority, String status) async {
    Database db = await database;
    var tasks = await db.query('mytasks',where: "status = '$status' and priority = '$priority'", orderBy: 'date');
    List<Tasks> tasksList = tasks.isNotEmpty ? tasks.map((c) => Tasks.fromMap(c)).toList() : [];
    emit(GetDatabase());
    return tasksList;
  }

  Future<int> remove(int id) async {
    Database db= await database;
    emit(DeleteFromDatabase());
    return await db.delete('mytasks',where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Tasks tasks) async {
    Database db= await database;
    emit(UpdateInDatabase());
    return await db.update('mytasks', tasks.toMap(), where: 'id = ?', whereArgs: [tasks.id]);
  }
}