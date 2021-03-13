import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import './roll.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'roll_database.db');
    // Open the database and store the reference.
    var database = await openDatabase(
      path,
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.

      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE rolls (id INT, title TEXT, stock TEXT, iso INT, filmSize TEXT, totalImages INT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }

  Future<List<Roll>> getRolls() async {
    // Get a reference to the database.
    Database dbClient = await db;

    // Query the table for all the rolls.
    List<Map<String, dynamic>> maps = await dbClient.query('rolls');

    List<Roll> rolls = [];
    for (int i = 0; i < maps.length; i++) {
      Roll r = Roll(
        id: maps[i]['id'],
        title: maps[i]['title'],
        stock: maps[i]['stock'],
        iso: maps[i]['iso'],
        filmSize: maps[i]['filmSize'],
        totalImages: maps[i]['totalImages'],
      );
      // print(r.id);
      rolls.add(r);
    }

    return rolls;
  }

  Future<void> insertRoll(Roll r) async {
    Database dbClient = await db;

    await dbClient.insert(
      'rolls',
      r.toMap(),
    );
  }
}
