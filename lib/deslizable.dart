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
          persiana = icon(color1, MyFlutterApp.icono_persiana_a, 120);
          _estadoPersiana = true;
        } else {
          persiana = icon(Colors.grey, MyFlutterApp.icono_persiana_a, 120);
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
        }
      });
    });

    _bom2Ref.keepSynced(true);
    _bom2Ref.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color4 = Colors.red[700];

          buttonPressed2 = true;
        } else {
          buttonPressed2 = false;
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
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              title(
                                  "La temperatura es ${_temperatura.toString()}°")
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
                                    } else {
                                      _estadoPersiana = false;
                                      _persianaRef.set(0);
                                    }
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    persiana,
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
                Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    child: FlatButton(
                        color: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          setState(() {
                            if (_pauseV == false) {
                              _pauseV = true;
                              _ventRef.set(0);
                              ventilador = animateIcon(
                                  Colors.grey, 'ven_on', 300, 300, _pauseV);
                            } else {
                              _pauseV = false;
                              _ventRef.set(1);
                            }
                          });
                        },
                        child: ventilador),
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
                              icon(color3, bombillas[1], bombSize),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 1,
                          ),
                          buttonPressed1
                              ? CustomButtonOn(
                                  onPressed: () {
                                    setState(() {
                                      if (buttonPressed1 == false) {
                                        bombSize = 140;
                                        color3 = Colors.yellow;
                                        bombillas[1] = MyFlutterApp.bombilla1;
                                        _bom1Ref.set(1);
                                      } else {
                                        bombSize = 100;
                                        color3 = Colors.grey;
                                        bombillas[1] = MyFlutterApp.bombilla2;
                                        _bom1Ref.set(0);
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
                                      if (buttonPressed1 == false) {
                                        bombSize = 140;
                                        color3 = Colors.yellow;
                                        bombillas[1] = MyFlutterApp.bombilla1;
                                        _bom1Ref.set(1);
                                      } else {
                                        bombSize = 100;
                                        color3 = Colors.grey;
                                        bombillas[1] = MyFlutterApp.bombilla2;
                                        _bom1Ref.set(0);
                                      }

                                      buttonPressed1 = !buttonPressed1;
                                    });
                                  },
                                  color: Colors.yellow,
                                  icon: bombillas[0],
                                  iconSize: 60,
                                )
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
