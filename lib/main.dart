import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      darkTheme: ThemeData(
        primaryColor: Color.fromRGBO(60, 129, 108, 1),
        canvasColor: Colors.grey.shade900,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        accentColor: Colors.deepPurpleAccent.shade100,
        cardColor: Color.fromRGBO(51, 51, 51, 1),
        fontFamily: 'Jost',
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 26,
          ),
          bodyText2: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 20,
          ),
        ),
      ),
      home: TabsScreen(),
    );
  }
}
