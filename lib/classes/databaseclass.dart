import 'package:sqflite/sqflite.dart';

List<Map> t1 = [];

class DatabaseF {
  static Database? database;

  static Future<void> createDb() async {
    database = await openDatabase(
      'todo_app2',
      version: 1,
      onCreate: (Database db, int version) async {
        print('database created');
        await db
            .execute(
            'CREATE TABLE ToDoTasks (id INTEGER PRIMARY KEY, task TEXT, time TEXT, date TEXT, status TEXT, priority TEXT)')
            .catchError((error) => print("error${error.toString()}"));
      },onOpen: (database) {
      getDb(database).then((value) => value = t1);
    }
    );
  }

  static Future insertDb(
      {required String task,
        required String time,
        required String date,
        required String status,
        required String priority,}) async {
    return await database?.transaction((txn) async {
      txn
          .rawInsert(
          'INSERT INTO ToDoTasks(task, time, date, status, priority) VALUES("${task}", "${time}", "${date}", "${status}", "${priority}")')
          .then((value) => print('insert successfuly'));
      getDb(database)
          .then((value) => value = t1)
          .catchError((error) => print("error${error.toString()}"));
    });
  }

  static void gatAllData({
    required String status,
  }) async {
    database?.rawUpdate('SELECT * FROM ToDoTasks where status= ?',['Task']);
  }

  static Future<List<Map>> getDb(database) async {
    return await database.rawQuery('SELECT * FROM ToDoTasks');
  }

  void updateData({
    required String status,
    required int id,
  }) async {
    database?.rawUpdate('update ToDoTasks set status=? where id=?',
        ['$status', id]).then((value) => getDb(database));
  }
}