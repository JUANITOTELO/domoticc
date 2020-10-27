import 'references.dart';
import 'createTitle.dart';
import 'createButton.dart';
import 'my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Deslizable extends StatefulWidget {
  Deslizable({this.app});
  final FirebaseApp app;
  @override
  _DeslizableState createState() => _DeslizableState();
}

class _DeslizableState extends State<Deslizable> {
  List<IconData> bombillas = [
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2
  ];
  bool buttonPressed = false;
  bool buttonPressed1 = false;
  bool buttonPressed2 = false;

  double bombSize = 100;
  double bombSize2 = 100;
  Icon persiana;
  Container ventilador;
  bool _pauseV = true;
  dynamic _temperatura;
  bool _estadoPersiana;

  String passWord =
      "queriwW201*/+-'¿/()('645'046e69abbbc435647ed070fb26b7e6256c6da35a9c95bd37b49020587a0aba21a";
  DatabaseReference _persianaRef;
  DatabaseReference _ventRef;
  DatabaseReference _temRef;
  DatabaseReference _bom1Ref;
  DatabaseReference _bom2Ref;
  DatabaseReference _auth;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;
  bool m = false;
  @override
  void initState() {
    super.initState();
    _auth = createReference('Autenticacion');
    _auth.set(passWord);

    _ventRef = createReference("ventilador1");
    _persianaRef = createReference('persiana');
    _temRef = createReference('Temperatura');
    _bom1Ref = createReference('bombilla1');
    _bom2Ref = createReference('bombilla2');
    //Leer temperatura actual
    _temRef.keepSynced(true);
    _temRef.onValue.listen((Event event) {
      setState(() {
        _temperatura = event.snapshot.value;
      });
    });
    //Leer y escibir el estado de las persianas
    _persianaRef.keepSynced(true);
    _persianaRef.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color1 = Colors.cyan;
          persiana = icon(color1, Icons.bluetooth_audio_rounded, 100);
          _estadoPersiana = true;
        } else {
          persiana = icon(Colors.grey, Icons.bluetooth_audio_rounded, 100);
          _estadoPersiana = false;
        }
      });
    });
    //Leer y escibir el estado de las bombillas
    _bom1Ref.keepSynced(true);
    _bom1Ref.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color3 = Colors.yellow;
          buttonPressed1 = true;
          bombillas[1] = MyFlutterApp.bombilla1;
        } else {
          buttonPressed1 = false;
          bombillas[1] = MyFlutterApp.bombilla2;
        }
      });
    });

    _bom2Ref.keepSynced(true);
    _bom2Ref.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color4 = Colors.red[700];
          buttonPressed2 = true;
          bombillas[2] = MyFlutterApp.bombilla1;
        } else {
          buttonPressed2 = false;
          bombillas[2] = MyFlutterApp.bombilla2;
        }
      });
    });
    //Leer y escibir el estado de los ventiladores
    _ventRef.keepSynced(true);
    _ventRef.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color2 = Colors.lime;
          _pauseV = false;
          ventilador = animateIcon(color2, 'ven_on', 300, 300, _pauseV);
        } else {
          _pauseV = true;
          ventilador = animateIcon(Colors.grey, 'ven_on', 300, 300, _pauseV);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
                      color: Colors.white, width: 2.0, style: BorderStyle.none),
                ),
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_filled),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(Icons.bedtime),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(Icons.car_rental),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(Icons.kitchen_rounded),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(Icons.room_service),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(Icons.stairs),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(Icons.alarm),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(Icons.account_balance_wallet),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        title("La temperatura es ${_temperatura.toString()}°"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            persiana,
                          ],
                        ),
                        _estadoPersiana
                            ? CustomButtonOn(
                                onPressed: () {
                                  setState(() {
                                    if (_estadoPersiana == true) {
                                      color1 = Colors.cyan;
                                      _persianaRef.set(0);
                                      _estadoPersiana = false;
                                    } else {
                                      color2 = Colors.grey;
                                      _persianaRef.set(1);
                                      _estadoPersiana = true;
                                    }
                                  });
                                },
                                color: Colors.cyan,
                                icon: Icons.bluetooth_audio_rounded,
                                iconSize: 60,
                              )
                            : CustomButtonOff(
                                onPressed: () {
                                  setState(() {
                                    if (_estadoPersiana == true) {
                                      color1 = Colors.cyan;
                                      _persianaRef.set(0);
                                      _estadoPersiana = false;
                                    } else {
                                      color1 = Colors.grey;
                                      _persianaRef.set(1);
                                      _estadoPersiana = true;
                                    }
                                  });
                                },
                                color: Colors.cyan,
                                icon: Icons.bluetooth_audio_rounded,
                                iconSize: 30,
                              ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      title("Habitación"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomAnimationIcon(
                            name: 'ven_on',
                            color: color2,
                            state: _pauseV,
                          ),
                          icon(color4, bombillas[2], bombSize2 - 20),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          persiana,
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          !_pauseV
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      color2 = Colors.grey;
                                      _ventRef.set(0);
                                      _pauseV = true;
                                    });
                                  },
                                  color: Colors.lime,
                                  icon: MyFlutterApp.ventilador,
                                  iconSize: 60,
                                )
                              : CustomButtonOff(
                                  onPressed: () {
                                    setState(() {
                                      color2 = Colors.lime;
                                      _ventRef.set(1);
                                      _pauseV = false;
                                    });
                                  },
                                  color: Colors.lime,
                                  icon: MyFlutterApp.ventilador,
                                  iconSize: 60,
                                ),
                          buttonPressed2
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      bombSize2 = 100;
                                      color4 = Colors.grey;
                                      bombillas[2] = MyFlutterApp.bombilla2;
                                      _bom1Ref.set(0);
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
                                      bombSize2 = 100;
                                      color4 = Colors.red[700];
                                      bombillas[2] = MyFlutterApp.bombilla1;
                                      _bom2Ref.set(1);
                                      buttonPressed2 = !buttonPressed2;
                                    });
                                  },
                                  color: Colors.red[700],
                                  icon: bombillas[0],
                                  iconSize: 60,
                                ),
                        ],
                      ),
                      _estadoPersiana
                          ? CustomButtonOn(
                              onPressed: () {
                                setState(() {
                                  if (_estadoPersiana == true) {
                                    color1 = Colors.cyan;
                                    _persianaRef.set(0);
                                    _estadoPersiana = false;
                                  } else {
                                    color2 = Colors.grey;
                                    _persianaRef.set(1);
                                    _estadoPersiana = true;
                                  }
                                });
                              },
                              color: Colors.cyan,
                              icon: Icons.bluetooth_audio_rounded,
                              iconSize: 60,
                            )
                          : CustomButtonOff(
                              onPressed: () {
                                setState(() {
                                  if (_estadoPersiana == true) {
                                    color1 = Colors.cyan;
                                    _persianaRef.set(0);
                                    _estadoPersiana = false;
                                  } else {
                                    color1 = Colors.grey;
                                    _persianaRef.set(1);
                                    _estadoPersiana = true;
                                  }
                                });
                              },
                              color: Colors.cyan,
                              icon: Icons.bluetooth_audio_rounded,
                              iconSize: 30,
                            ),
                    ],
                  ),
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
                              icon(color3, bombillas[1], bombSize + 20),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buttonPressed1
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      bombSize = 100;
                                      color3 = Colors.grey;
                                      bombillas[1] = MyFlutterApp.bombilla2;
                                      _bom1Ref.set(0);
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
                                      bombSize = 100;
                                      color3 = Colors.yellow;
                                      bombillas[1] = MyFlutterApp.bombilla1;
                                      _bom1Ref.set(1);
                                      buttonPressed1 = !buttonPressed1;
                                    });
                                  },
                                  color: Colors.yellow,
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
