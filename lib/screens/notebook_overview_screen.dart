import 'package:film_app/widgets/roll_item.dart';
import 'package:flutter/material.dart';

import '../models/roll_data.dart';

class NoteBookOverviewScreen extends StatefulWidget {
  @override
  _NoteBookOverviewScreenState createState() => _NoteBookOverviewScreenState();
}

class _NoteBookOverviewScreenState extends State<NoteBookOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 30, bottom: 80),
      itemBuilder: (ctx, index) {
        return RollItem(dummyRolls[index]);
      },
      itemCount: dummyRolls.length,
    );
  }
}
