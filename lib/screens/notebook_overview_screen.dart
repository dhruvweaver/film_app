import 'package:film_app/widgets/roll_item.dart';
import 'package:flutter/material.dart';

import '../roll_data.dart';

class NoteBookOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 30),
      itemBuilder: (ctx, index) {
        return RollItem(dummyRolls[index]);
      },
      itemCount: dummyRolls.length,
    );
  }
}