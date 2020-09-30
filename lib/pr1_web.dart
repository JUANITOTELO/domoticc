import 'package:flutter/material.dart';
import 'my_flutter_app_icons.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'createTitle.dart';
import 'createButton.dart';

class DWeb extends StatefulWidget {
  const DWeb({Key key}) : super(key: key);
  @override
  _DWebState createState() => _DWebState();
}

class _DWebState extends State<DWeb> {
  List<IconData> bombillas = [
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2
  ];
  bool buttonPressed1 = false;
  bool buttonPressed2 = false;
  double bombSize = 100;
  double bombSize2 = 100;
  bool _pauseV = true;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: DefaultTabController(
        length: 8,
        child: SafeArea(
          child: Scaffold(
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
                Icon(
                  Icons.home_filled,
                  color: Colors.grey,
                  size: 120,
                ),
                Icon(
                  MyFlutterApp.icono_persiana_a,
                  color: Colors.grey,
                  size: 120,
                ),
                FlatButton(
                  color: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  disabledColor: Colors.transparent,
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      title("Escaleras"),
                      Flexible(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              icon(color3, bombillas[1], bombSize),
                              icon(color4, bombillas[2], bombSize2),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buttonPressed1
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      if (color3 == Colors.grey) {
                                        bombSize = 140;
                                        color3 = Colors.yellow;
                                        bombillas[1] = MyFlutterApp.bombilla1;
                                      } else {
                                        bombSize = 100;
                                        color3 = Colors.grey;
                                        bombillas[1] = MyFlutterApp.bombilla2;
                                      }
                                      buttonPressed1 = !buttonPressed1;
                                    });
                                  },
                                  color: Colors.yellow,
                                  icon: bombillas[0],
                                  iconSize: 60,
                                )
                              : CustomButtonOff(
                                  onPressed: () {
                                    setState(() {
                                      if (color3 == Colors.grey) {
                                        bombSize = 140;
                                        color3 = Colors.yellow;
                                        bombillas[1] = MyFlutterApp.bombilla1;
                                      } else {
                                        bombSize = 100;
                                        color3 = Colors.grey;
                                        bombillas[1] = MyFlutterApp.bombilla2;
                                      }
                                      buttonPressed1 = !buttonPressed1;
                                    });
                                  },
                                  color: Colors.yellow,
                                  icon: bombillas[0],
                                  iconSize: 60,
                                ),
                          buttonPressed2
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      if (color4 == Colors.grey) {
                                        bombSize2 = 140;
                                        color4 = Colors.red[700];
                                        bombillas[2] = MyFlutterApp.bombilla1;
                                      } else {
                                        bombSize2 = 100;
                                        color4 = Colors.grey;
                                        bombillas[2] = MyFlutterApp.bombilla2;
                                      }
                                      buttonPressed2 = !buttonPressed2;
                                    });
                                  },
                                  color: Colors.red[700],
                                  icon: bombillas[0],
                                  iconSize: 60,
                                )
                              : CustomButtonOff(
                                  onPressed: () {
                                    setState(() {
                                      if (color4 == Colors.grey) {
                                        bombSize2 = 140;
                                        color4 = Colors.red[700];
                                        bombillas[2] = MyFlutterApp.bombilla1;
                                      } else {
                                        bombSize2 = 100;
                                        color4 = Colors.grey;
                                        bombillas[2] = MyFlutterApp.bombilla2;
                                      }
                                      buttonPressed2 = !buttonPressed2;
                                    });
                                  },
                                  color: Colors.red[700],
                                  icon: bombillas[0],
                                  iconSize: 60,
                                ),
                        ],
                      ),
                    ],
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
