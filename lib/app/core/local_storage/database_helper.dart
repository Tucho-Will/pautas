import 'dart:io';

import 'package:app/app/models/pauta.dart';
import 'package:app/app/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final db_name = "app_db";

  static Database _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    await initDB();
    return _database;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(Usuario.create_table);
    batch.execute(Pauta.create_table);
    List<dynamic> result = await batch.commit();
  }

  static initDB() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, db_name);

    _database = await openDatabase(path,
        version: 1,
        onOpen: (db) async {},
        onCreate: _onCreate,
        onConfigure: _onConfigure);
  }

  static Future<void> deleteDB() async {
    try {
      String _path = await getDatabasesPath() + db_name;
      await deleteDatabase(_path);
    } catch (ex) {
      throw ex;
    }
  }
}
