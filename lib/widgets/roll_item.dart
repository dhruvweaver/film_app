import 'package:flutter/material.dart';

import '../models/roll.dart';

class RollItem extends StatelessWidget {
  final Roll roll;

  RollItem(this.roll);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              roll.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '${roll.filmStock} ${roll.iso}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text('${roll.filmSize} mm'),
            Text('${roll.totalImages} Photos'),
          ],
        ),
      ),
    );
  }
}
