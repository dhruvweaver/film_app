import 'package:flutter/material.dart';
import 'dart:io';

import 'package:md2_tab_indicator/md2_tab_indicator.dart';

import './notebook_overview_screen.dart';
import './darkroom_overview_screen.dart';
import './new_roll_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool darkroomToggle = false;
  bool deleteMode = false;

  void setDeleteMode(bool mode) {
    deleteMode = mode;
    print(deleteMode);
  }

  Widget _buildAppBar(TabBar tabs, context) {
    return AppBar(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Film',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
        ),
        actions: Platform.isIOS
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewRollScreen(),
                      ),
                    );
                    setState(() {});
                  },
                )
              ]
            : deleteMode
                ? Platform.isIOS
                    ? <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewRollScreen(),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline_rounded),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewRollScreen(),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                      ]
                    : <Widget>[
                        IconButton(
                          icon: Icon(Icons.delete_outline_rounded),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewRollScreen(),
                              ),
                            );
                            setState(() {});
                          },
                        )
                      ]
                : null,
        bottom: tabs);
  }

  void _isDarkroom(bool dark) {
    darkroomToggle = dark;
    print(darkroomToggle);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(
          TabBar(
            isScrollable: true,
            indicator: MD2Indicator(
                indicatorHeight: 5,
                indicatorColor:
                    Theme.of(context).textSelectionTheme.cursorColor,
                indicatorSize:
                    MD2IndicatorSize.normal //3 different modes tiny-normal-full
                ),
            labelPadding: EdgeInsets.symmetric(horizontal: 30),
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w500,
            ),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.book),
                text: 'Notebook',
              ),
              Tab(
                icon: Icon(Icons.lightbulb_outline),
                text: 'Darkroom',
              ),
            ],
          ),
          context,
        ),
        // drawer: MainDrawer(),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          // controller: _controller,
          children: <Widget>[
            NoteBookOverviewScreen(),
            DarkroomOverviewScreen(_isDarkroom),
          ],
        ),
        floatingActionButton: Platform.isAndroid
            ? FloatingActionButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewRollScreen(),
                    ),
                  );
                  setState(() {});
                },
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(Icons.add),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }

  // : Theme(
  //   data: ThemeData(
  //     primaryColor: Colors.blue,
  //   ),
  //       child: DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       appBar: _buildAppBar(
  //         TabBar(
  //           isScrollable: true,
  //           indicator: MD2Indicator(
  //               indicatorHeight: 5,
  //               indicatorColor: Theme.of(context).cursorColor,
  //               indicatorSize:
  //                   MD2IndicatorSize.normal //3 different modes tiny-normal-full
  //               ),
  //           labelPadding: EdgeInsets.symmetric(horizontal: 30),
  //           labelStyle: TextStyle(
  //             fontSize: 16,
  //             fontFamily: 'Jost',
  //             fontWeight: FontWeight.w500,
  //           ),
  //           tabs: <Widget>[
  //             Tab(
  //               icon: Icon(Icons.book),
  //               text: 'Notebook',
  //             ),
  //             Tab(
  //               icon: Icon(Icons.lightbulb_outline),
  //               text: 'Darkroom',
  //             ),
  //           ],
  //         ),
  //       ),
  //       // drawer: MainDrawer(),
  //       body: TabBarView(
  //         // controller: _controller,
  //         children: <Widget>[
  //           NoteBookOverviewScreen(),
  //           DarkroomOverviewScreen(_isDarkroom),
  //         ],
  //       ),
  //       floatingActionButton: Platform.isAndroid
  //           ? FloatingActionButton(
  //               onPressed: () {},
  //               // backgroundColor: Theme.of(context).accentColor,
  //               // child: Icon(Icons.add),
  //               // splashColor: Colors.deepPurple,
  //             )
  //           : null,
  //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  //     ),
  //   ),
  // );
  // }
}
