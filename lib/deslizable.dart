import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'my_flutter_app_icons.dart';

class Deslizable extends StatefulWidget {
  Deslizable({this.app});
  final FirebaseApp app;
  @override
  _DeslizableState createState() => _DeslizableState();
}

class _DeslizableState extends State<Deslizable> {
  dynamic _temperatura;
  bool _estadoPersiana;
  DatabaseReference _persianaRef;
  DatabaseReference _temRef;
  Color color1 = Colors.grey;
  Color color2 = Colors.cyan;
  IconData persiana = MyFlutterApp.icono_persiana_a;
  bool m = false;

  @override
  void initState() {
    super.initState();
    _persianaRef = FirebaseDatabase.instance.reference().child('persiana');
    _temRef = FirebaseDatabase.instance.reference().child('Temperatura');
    _temRef.keepSynced(true);
    _temRef.onValue.listen((Event event) {
      setState(() {
        _temperatura = event.snapshot.value;
      });
    });
    _persianaRef.keepSynced(true);
    _persianaRef.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color1 = color2;
        }
      });
    });
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
                  Tab(icon: Icon(Icons.add)),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("La temperatura es ${_temperatura.toString()}°"),
                          SizedBox(
                            height: 20,
                          ),
                          Flexible(
                            child: Center(
                              child: FlatButton(
                                color: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    if (m == false) {
                                      _persianaRef.set(1);
                                      color1 = color2;
                                      m = true;
                                    } else {
                                      color1 = Colors.grey;
                                      m = false;
                                      _persianaRef.set(0);
                                    }
                                  });
                                },
                                child: Icon(
                                  persiana,
                                  color: color1,
                                  size: 50,
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
                Icon(MyFlutterApp.ventilador),
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
