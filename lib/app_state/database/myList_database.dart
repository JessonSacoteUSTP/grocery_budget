// @dart=2.9
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = "myListData";
final String Column_id = "id";
final String Column_name = "item";
final String Column_qty = "qty";

class MyListModel {
  final String name;
  final String qty;
  int id;

  MyListModel({ this.name,  this.qty,  this.id});

  Map<String, dynamic> toMap() {
    //print('asa');
    return {
      Column_name: this.name,
      Column_qty: this.qty,
    };
  }
}

class MyListDatabase {
   Database db;

  MyListDatabase() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    print('INITIALIZED DATABASE mylist');
    db = await openDatabase(
      join(await getDatabasesPath(), "MyListDatabase.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $tableName($Column_id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_name TEXT, $Column_qty TEXT)");
    }, version: 1);
  }

  Future<void> insertTask(MyListModel task) async {
    print('INSERT TASK INITIATED');
    try {
      print('INSERT TASK INITIATED -- TRY');
      db.insert(tableName, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print('INSERT TASK INITIATED -- CATCH');
      print(_);
    }
  }

  Future<List<MyListModel>> getAllTask() async {
    print('GET ALL TASK INITIATED');
    final List<Map<String, dynamic>> tasks = await db.query(tableName);
    print('GET ALL TASK INITIATED --- BEFORE RETURN');

    return List.generate(tasks.length, (i) {
      print('GET ALL TASK INITIATED -- return LIST');
      return MyListModel(
        id: tasks[i][Column_id],
        name: tasks[i][Column_name],
        qty: tasks[i][Column_qty],
      );
    });
  }

  Future<int> delete(int id) async {
    db.delete(tableName, where: '$Column_id = ?', whereArgs: [id]);
  }
}
