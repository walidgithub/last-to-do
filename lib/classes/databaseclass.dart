import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/classes/tasksjson.dart';

class DatabaseHelper{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'AllMyTasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE mytasks(
        id INTEGER PRIMARY KEY,
        task TEXT,
        time TEXT,
        date TEXT,
        status TEXT,
        priority TEXT)
        ''');
  }

  // Future<List<Tasks>> getTasks(String priority, String status) async {
  //   Database db = await instance.database;
  //   var tasks = await db.query('mytasks',where: "status = '$status' and priority = '$priority'", orderBy: 'date');
  //   List<Tasks> tasksList = tasks.isNotEmpty ? tasks.map((c) => Tasks.fromMap(c)).toList() : [];
  //   return tasksList;
  // }

  Future<String> getPercentTasks() async {
    Database db = await instance.database;
    var task = await db.query('mytasks');
    int counttask = task.length;
    var done = await db.query('mytasks',where: "status = 'Done'");
    int countdone = done.length;
    double c = (countdone / counttask) * 100;

    String percent = (c.round()).toString() + '%';
    return percent;
  }

  Future <int> add(Tasks tasks) async {
    Database db = await instance.database;
    return await db.insert('mytasks', tasks.toMap());
  }

  // Future<int> remove(int id) async {
  //   Database db= await instance.database;
  //   return await db.delete('mytasks',where: 'id = ?', whereArgs: [id]);
  // }
  //
  // Future<int> update(Tasks tasks) async {
  //   Database db= await instance.database;
  //   return await db.update('mytasks', tasks.toMap(), where: 'id = ?', whereArgs: [tasks.id]);
  // }
}