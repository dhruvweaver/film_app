import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import './screens/tabs_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Database database;

  // void openDBFunction() async {
  //   var databasesPath = await getDatabasesPath();
  //   String path = join(databasesPath, 'roll_database.db');

  //   // open the database
  //   database = (await openDatabase(
  //     path,
  //     version: 1,
  //     onCreate: (Database db, int version) async {
  //       // When creating the db, create the table
  //       await db.execute(
  //           'CREATE TABLE rolls (title TEXT, stock TEXT, iso INT, filmSize TEXT, totalImages INT)');
  //     },
  //   ));
  // }

  WidgetsFlutterBinding.ensureInitialized();
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'roll_database.db');
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    path,
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.

    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE rolls (title TEXT, stock TEXT, iso INT, filmSize TEXT, totalImages INT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  runApp(MyApp(database));
}

class MyApp extends StatefulWidget {
  Future<Database> db;
  MyApp(this.db);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromRGBO(63, 213, 167, 1),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
          ),
          accentColor: Colors.deepPurple.shade200,
          disabledColor: Colors.black,
          fontFamily: 'Jost',
          textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 26,
              ),
              bodyText2: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade800,
              ))),
      // darkTheme: ThemeData(
      //   primaryColor: Color.fromRGBO(60, 129, 108, 1),
      //   canvasColor: Colors.grey.shade900,
      //   textSelectionTheme: TextSelectionThemeData(
      //     cursorColor: Colors.white,
      //   ),
      //   accentColor: Colors.deepPurpleAccent.shade100,
      //   cardColor: Color.fromRGBO(51, 51, 51, 1),
      //   fontFamily: 'Jost',
      //   textTheme: TextTheme(
      //     headline6: TextStyle(
      //       color: Colors.grey.shade200,
      //       fontSize: 26,
      //     ),
      //     bodyText2: TextStyle(
      //       color: Colors.grey.shade400,
      //       fontSize: 20,
      //     ),
      //   ),
      // ),
      home: TabsScreen(widget.db),
    );
  }
}
