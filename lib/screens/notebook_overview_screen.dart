import 'package:film_app/widgets/roll_item.dart';
import 'package:flutter/material.dart';

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
    List<Roll> rolls;

    return FutureBuilder(
        future: fetchRollsFromDatabase(),
        builder: (context, snapshot) {
          rolls = snapshot.data;
          if (snapshot.hasData) {
            rolls = new List.from(rolls.reversed);
            if (rolls.length == 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Add a roll to get started!'),
                  SizedBox(
                    height: 200,
                  ),
                ],
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 30, bottom: 80),
                itemBuilder: (ctx, index) {
                  return RollItem(rolls[index]);
                },
                itemCount: rolls.length,
              );
            }
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
