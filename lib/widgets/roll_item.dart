import 'package:flutter/material.dart';

import '../models/roll.dart';

class RollItem extends StatelessWidget {
  final Roll roll;

  RollItem(this.roll);

  void photoCount() {
    if (roll.filmSize == 35) {
      roll.totalImages = 36;
    } else if (roll.filmSize == 120) {
      roll.totalImages = 12;
    } else {
      roll.totalImages = 8;
    }
  }

  @override
  Widget build(BuildContext context) {
    photoCount();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
      child: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              roll.title,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              '${roll.filmStock} ${roll.iso}',
              style: Theme.of(context).textTheme.body1,
            ),
            Text('${roll.filmSize} mm'),
            Text('${roll.totalImages} Photos'),
          ],
        ),
      ),
    );
  }
}
