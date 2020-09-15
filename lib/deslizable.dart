import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Deslizable extends StatefulWidget {
  Deslizable({this.app});
  final FirebaseApp app;
  @override
  _DeslizableState createState() => _DeslizableState();
}

class _DeslizableState extends State<Deslizable> {
  DatabaseReference _led1Ref;

  Color color1 = Colors.grey;
  Color color2 = Colors.cyan;
  bool m = false;

  @override
  void initState() {
    super.initState();
    _led1Ref = FirebaseDatabase.instance.reference().child('led1');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              elevation: 0,
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                  Tab(icon: Icon(Icons.account_circle)),
                ],
              ),
            ),
            body: TabBarView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Container(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                if (m == false) {
                                  color1 = color2;
                                  m = true;
                                  _led1Ref.set(1);
                                } else {
                                  color1 = Colors.grey;
                                  m = false;
                                  _led1Ref.set(0);
                                }
                              });
                            },
                            child: Icon(
                              Icons.directions_car,
                              color: color1,
                              size: 50,
                            ),
                          )
                        ]),
                  ),
                ),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(Icons.account_circle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
