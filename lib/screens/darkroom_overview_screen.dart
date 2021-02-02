import 'package:flutter/material.dart';

class DarkroomOverviewScreen extends StatelessWidget {
  final Function toggle;

  DarkroomOverviewScreen(this.toggle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Text('Toggle darkroom mode'),
              Switch.adaptive(value: false, onChanged: toggle)
            ],
          ),
        ),
      ),
    );
  }
}
