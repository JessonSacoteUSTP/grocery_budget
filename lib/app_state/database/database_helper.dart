// @dart=2.9
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'GroceryDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';

  static final columnId = '_id';
  static final columnDate = 'date';
  static final columnTime = 'time';
  static final columnExpense = 'expense';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database; // not yet initiated

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path =
        join(directory.path, _dbName); // path sa directory + name sa db
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute('''
        CREATE TABLE $_tableName(
          $columnId INTEGER PRIMARY KEY,
        $columnDate TEXT NOT NULL)
        $columnTime TEXT NOT NULL)
        $columnExpense TEXT NOT NULL)
        ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print('DATA INSERTED');
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db
        .update(_tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
