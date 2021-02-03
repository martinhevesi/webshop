import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Sql {
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await openDatabase(

      join(
        await getDatabasesPath(),
        'webshop.db',
      ),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE profile(
          id INTEGER PRIMARY KEY,
          name TEXT,
          email TEXT,
          phone TEXT
        );
        ''');

        await db.execute('''
        CREATE TABLE addresses(
          id INTEGER PRIMARY KEY,
          city TEXT,
          street TEXT,
          houseNumber TEXT,
          lat REAL,
          lng REAL
        );
        ''');
      },
    );
    return _database;
  }
}
