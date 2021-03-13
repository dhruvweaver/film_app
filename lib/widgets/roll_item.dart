import 'package:flutter/material.dart';

import '../models/roll.dart';
import '../screens/tabs_screen.dart';

class RollItem extends StatefulWidget {
  final Roll roll;

  RollItem(this.roll);

  @override
  _RollItemState createState() => _RollItemState();
}

class _RollItemState extends State<RollItem> {
  void _delete() {
    setState(() {});
    print('long pressed');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _delete();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                widget.roll.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '${widget.roll.stock} ${widget.roll.iso}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text('${widget.roll.filmSize}'),
              Text('${widget.roll.totalImages} Photos'),
            ],
          ),
        ),
      ),
    );
  }
}
