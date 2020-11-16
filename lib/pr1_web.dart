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
                  Tab(icon: Icon(MyFlutterApp.bed)),
                  Tab(icon: Icon(MyFlutterApp.garaje_privado)),
                  Tab(icon: Icon(MyFlutterApp.chef_toque_and_mustache)),
                  Tab(icon: Icon(MyFlutterApp.sala)),
                  Tab(icon: Icon(MyFlutterApp.stairs_with_handrail)),
                  Tab(icon: Icon(MyFlutterApp.bath)),
                  Tab(icon: Icon(MyFlutterApp.candado1)),
                  Tab(icon: Icon(Icons.home_filled)),
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
                  MyFlutterApp.cuenco_de_comida_para_perros,
                  color: Colors.grey,
                  size: 120,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            icon(color4, bombillas[2], bombSize2),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            icon: MyFlutterApp.bombilla2,
                            state: buttonPressed1,
                            color: Colors.yellow,
                            onPressed: () {
                              setState(() {
                                if (buttonPressed1) {
                                  color3 = Colors.grey;
                                  bombillas[1] = MyFlutterApp.bombilla2;
                                } else {
                                  color3 = Colors.yellow;
                                  bombillas[1] = MyFlutterApp.bombilla1;
                                }
                                buttonPressed1 = !buttonPressed1;
                              });
                            },
                          ),
                          CustomButton(
                            icon: MyFlutterApp.bombilla2,
                            state: buttonPressed2,
                            color: Colors.cyan,
                            onPressed: () {
                              setState(() {
                                if (buttonPressed2) {
                                  color4 = Colors.grey;
                                  buttonPressed2 = false;
                                  bombillas[2] = MyFlutterApp.bombilla2;
                                } else {
                                  color4 = Colors.cyan;
                                  buttonPressed2 = true;
                                  bombillas[2] = MyFlutterApp.bombilla1;
                                }
                              });
                            },
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
