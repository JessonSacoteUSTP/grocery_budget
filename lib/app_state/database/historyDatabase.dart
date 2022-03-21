// @dart=2.9
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = "historyData";
final String Column_id = "id";
final String Column_date = "date";
final String Column_time = "time";
final String Column_expense = "expense";

class HistoryModel {
  final String date;
  final String time;
  final String expense;
  int id;

  HistoryModel({ this.date,  this.time,  this.expense,  this.id});
  

  Map<String, dynamic> toMap() {
    //print('asa');
    return {
      Column_date: this.date,
      Column_time: this.time,
      Column_expense: this.expense
    };
  }
}

const oneSecond = Duration(seconds: 1);

class HistoryDatabase {
   Database db;

  HistoryDatabase() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    print('INITIALIZED DATABASE history');
    db = await openDatabase(
      join(await getDatabasesPath(), "historyDatabase.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $tableName($Column_id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_date TEXT, $Column_time TEXT, $Column_expense TEXT)");
    }, 
    version: 1);
  }

  Future<void> insertTask(HistoryModel task) async {
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

  Future<List<HistoryModel>> getAllTask () async {
    print('GET ALL TASK INITIATED');
    final List<Map<String, dynamic>> tasks = await db.query(tableName);
    print('GET ALL TASK INITIATED --- BEFORE RETURN');

    return 
    List.generate(tasks.length, (i) {
      print('INSERT TASK INITIATED -- 1st return');
      return HistoryModel(
          id: tasks[i][Column_id],
          date: tasks[i][Column_date],
          time: tasks[i][Column_time],
          expense: tasks[i][Column_expense]);
    });
  }

  Future<int> delete(int id) async {
    db.delete(tableName, where: '$Column_id = ?', whereArgs: [id]);
  }
}
