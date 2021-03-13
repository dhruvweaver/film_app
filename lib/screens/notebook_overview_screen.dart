import 'dart:developer';

import 'package:film_app/widgets/roll_item.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../models/roll.dart';
import '../models/db_helper.dart';

class NoteBookOverviewScreen extends StatefulWidget {
  @override
  _NoteBookOverviewScreenState createState() => _NoteBookOverviewScreenState();
}

class _NoteBookOverviewScreenState extends State<NoteBookOverviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Roll>> fetchRollsFromDatabase() async {
    var dbHelper = DBHelper();

    Future<List<Roll>> rolls = dbHelper.getRolls();
    return rolls;
  }

  @override
  Widget build(BuildContext context) {
    // Future<List<Roll>> rollsF = _appData.then((value) => value.rolls);
    List<Roll> rolls;
    return FutureBuilder(
        // future: Future.wait([rollsF]),
        future: fetchRollsFromDatabase(),
        builder: (context, snapshot) {
          print(snapshot);
          rolls = snapshot.data;
          if (snapshot.hasData) {
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
    //
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
