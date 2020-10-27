import 'package:flutter/material.dart';
import 'my_flutter_app_icons.dart';
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
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2
  ];
  bool buttonPressed1 = false;
  bool buttonPressed2 = false;
  bool buttonPressed3 = false;
  double bombSize = 100;
  double bombSize2 = 100;
  double bombSize3 = 100;
  bool _pauseV = true;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;
  Color color5 = Colors.grey;

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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomAnimationIcon(
                            name: 'ven_on',
                            color: color2,
                            state: _pauseV,
                          ),
                        ],
                      ),
                      _pauseV
                          ? CustomButtonOn(
                              onPressed: () {
                                setState(() {
                                  if (_pauseV == true) {
                                    color2 = Colors.lime;
                                    _pauseV = false;
                                  } else {
                                    color2 = Colors.grey;
                                    _pauseV = true;
                                  }
                                });
                              },
                              color: Colors.lime,
                              icon: MyFlutterApp.ventilador,
                              iconSize: 60,
                            )
                          : CustomButtonOff(
                              onPressed: () {
                                setState(() {
                                  if (_pauseV == true) {
                                    color2 = Colors.lime;
                                    _pauseV = false;
                                  } else {
                                    color2 = Colors.grey;
                                    _pauseV = true;
                                  }
                                });
                              },
                              color: Colors.lime,
                              icon: MyFlutterApp.ventilador,
                              iconSize: 60,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      title("Escaleras"),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            icon(color3, bombillas[1], bombSize),
                            icon(color5, bombillas[3], bombSize3),
                            icon(color4, bombillas[2], bombSize2),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buttonPressed1
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      if (color3 == Colors.grey) {
                                        bombSize = 100;
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
                                        bombSize = 100;
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
                          SizedBox(
                            width: 100,
                          ),
                          buttonPressed3
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      if (color5 == Colors.grey) {
                                        bombSize3 = 100;
                                        color5 = Colors.pink;
                                        bombillas[3] = MyFlutterApp.bombilla1;
                                      } else {
                                        bombSize3 = 100;
                                        color5 = Colors.grey;
                                        bombillas[3] = MyFlutterApp.bombilla2;
                                      }
                                      buttonPressed3 = !buttonPressed3;
                                    });
                                  },
                                  color: Colors.pink,
                                  icon: bombillas[0],
                                  iconSize: 60,
                                )
                              : CustomButtonOff(
                                  onPressed: () {
                                    setState(() {
                                      if (color5 == Colors.grey) {
                                        bombSize3 = 140;
                                        color5 = Colors.pink;
                                        bombillas[3] = MyFlutterApp.bombilla1;
                                      } else {
                                        bombSize3 = 100;
                                        color3 = Colors.grey;
                                        bombillas[3] = MyFlutterApp.bombilla2;
                                      }
                                      buttonPressed3 = !buttonPressed3;
                                    });
                                  },
                                  color: Colors.pink,
                                  icon: bombillas[0],
                                  iconSize: 60,
                                ),
                          buttonPressed2
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      if (color4 == Colors.grey) {
                                        bombSize2 = 100;
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
                                        bombSize2 = 100;
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
