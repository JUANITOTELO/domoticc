import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'my_flutter_app_icons.dart';
import 'package:flare_flutter/flare_actor.dart';

class Deslizable extends StatefulWidget {
  Deslizable({this.app});
  final FirebaseApp app;
  @override
  _DeslizableState createState() => _DeslizableState();
}

class _DeslizableState extends State<Deslizable> {
  bool _pauseV = true;
  dynamic _temperatura;
  bool _estadoPersiana;
  bool _estadobom;
  IconData bombilla = MyFlutterApp.bombilla2;

  DatabaseReference _persianaRef;
  DatabaseReference _temRef;
  DatabaseReference _bomRef;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  IconData persiana = MyFlutterApp.icono_persiana_a;
  bool m = false;

  @override
  void initState() {
    super.initState();
    _persianaRef = FirebaseDatabase.instance.reference().child('persiana');
    _temRef = FirebaseDatabase.instance.reference().child('Temperatura');
    _bomRef = FirebaseDatabase.instance.reference().child('bombilla1');
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
          color1 = Colors.cyan;
          _estadoPersiana = true;
        }
      });
    });
    _bomRef.keepSynced(true);
    _bomRef.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color3 = Colors.yellow;
          bombilla = MyFlutterApp.bombilla1;
          _estadobom = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: DefaultTabController(
        length: 8,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[900],
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 3.0,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 50),
                ),
                tabs: [
                  Tab(icon: Icon(Icons.home_filled)),
                  Tab(icon: Icon(Icons.bedtime)),
                  Tab(icon: Icon(Icons.car_rental)),
                  Tab(icon: Icon(Icons.kitchen_rounded)),
                  Tab(icon: Icon(Icons.room_service)),
                  Tab(icon: Icon(Icons.stairs)),
                  Tab(icon: Icon(Icons.alarm)),
                  Tab(icon: Icon(Icons.account_balance_wallet)),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "La temperatura es ${_temperatura.toString()}°"),
                              Icon(Icons.wb_sunny)
                            ],
                          ),
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
                                    if (_estadoPersiana == false) {
                                      _estadoPersiana = true;
                                      _persianaRef.set(1);
                                      color1 = Colors.cyan;
                                    } else {
                                      color1 = Colors.grey;
                                      _estadoPersiana = false;
                                      _persianaRef.set(0);
                                    }
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      persiana,
                                      color: color1,
                                      size: 120,
                                    ),
                                    SizedBox(
                                      width: 23,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
                FlatButton(
                  color: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      if (color2 == Colors.grey) {
                        _pauseV = false;
                        color2 = Colors.lime;
                      } else {
                        _pauseV = true;
                        color2 = Colors.grey;
                      }
                    });
                  },
                  child: Container(
                    width: 300,
                    height: 300,
                    child: FlareActor(
                      'animations/Ventilador.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      isPaused: _pauseV,
                      color: color2,
                      animation: 'ven_on',
                      shouldClip: false,
                    ),
                  ),
                ),
                FlatButton(
                  color: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      if (_estadobom == false) {
                        _estadobom = true;
                        bombilla = MyFlutterApp.bombilla1;
                        _bomRef.set(1);
                        color3 = Colors.yellow;
                      } else {
                        color3 = Colors.grey;
                        _estadobom = false;
                        _bomRef.set(0);
                        bombilla = MyFlutterApp.bombilla2;
                      }
                    });
                  },
                  child: Icon(
                    bombilla,
                    color: color3,
                    size: 120,
                  ),
                ),
                Icon(
                  MyFlutterApp.candado1,
                  color: Colors.grey,
                  size: 120,
                ),
                Icon(
                  MyFlutterApp.candado1,
                  color: Colors.grey,
                  size: 120,
                ),
                Icon(
                  MyFlutterApp.candado1,
                  color: Colors.grey,
                  size: 120,
                ),
                Icon(
                  MyFlutterApp.candado1,
                  color: Colors.grey,
                  size: 120,
                ),
                Icon(
                  MyFlutterApp.candado1,
                  color: Colors.grey,
                  size: 120,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
