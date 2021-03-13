import 'dart:developer';

import 'package:film_app/widgets/roll_item.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../models/roll.dart';

class NoteBookOverviewScreen extends StatefulWidget {
  final Future<Database> database;
  NoteBookOverviewScreen(this.database);

  @override
  _NoteBookOverviewScreenState createState() => _NoteBookOverviewScreenState();
}

class _NoteBookOverviewScreenState extends State<NoteBookOverviewScreen> {
  // A method that retrieves all the dogs from the dogs table.
  Future<List<Roll>> getRolls() async {
    // Get a reference to the database.
    final Database db = await widget.database;

    // Query the table for all The Dogs.
    List<Map<String, dynamic>> maps = await db.query('rolls');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Roll(
        title: maps[i]['title'],
        stock: maps[i]['stock'],
        iso: maps[i]['iso'],
        filmSize: maps[i]['filmSize'],
        totalImages: maps[i]['totalImages'],
      );
    }) as Future<List<Roll>>;

    // await setRolls();
  }

  // setRolls() async {
  //   getRolls();
  //   print('Map: ');
  //   print(maps);
  //   rolls = await rollsF;
  // }

  @override
  Widget build(BuildContext context) {
    Future<List<Roll>> rollsF;
    List<Roll> rolls = [];
    return FutureBuilder(
        future: getRolls(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          print(snapshot.data);
          rolls = snapshot.data;
          if (rolls.isNotEmpty) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 30, bottom: 80),
              itemBuilder: (ctx, index) {
                return RollItem(rolls[index]);
              },
              itemCount: rolls.length,
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add a roll to get started!'),
                SizedBox(
                  height: 200,
                ),
              ],
            );
          }
        });
    // : Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text('Add a roll to get started!'),
    //       SizedBox(
    //         height: 200,
    //       ),
    //     ],
    //   );
  }
}
