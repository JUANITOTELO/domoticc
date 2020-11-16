import 'references.dart';
import 'createTitle.dart';
import 'createButton.dart';
import 'createCTab.dart';
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
  //Lista con los iconos de las bombillas
  List<IconData> bombillas = [
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2,
    MyFlutterApp.bombilla2
  ];

  bool _estadoPersiana;
  bool _pauseV = true;
  bool _estadoPuGaraje;
  bool _estadoDispensador;
  bool _estadoPuSala;
  bool _estadoAlarma;

  IconData puertaG = MyFlutterApp.garage_down;
  IconData puertaG2 = MyFlutterApp.garage_down;
  IconData puertaS = MyFlutterApp.candado2;
  IconData seguridad = MyFlutterApp.candado2;
  Container ventilador = animateIcon(Colors.grey, 'ven_on', 400, 400, true);
  dynamic _temperatura = 0;
  //Lista con los estados de los botones de las bombillas
  List<bool> buttonPressedL = [false, false, false, false, false];

  //Lista con los colores de las bombillas
  List<Color> colors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];

  //Colores de todos los botones
  Color colorD = Colors.grey;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color colorPS = Colors.grey;
  Color colorPG = Colors.grey;
  bool m = false;

  //Referencias de la base de datos
  DatabaseReference _persianaRef = createReference('persiana');
  DatabaseReference _ventRef = createReference("ventilador1");
  DatabaseReference _temRef = createReference('Temperatura');
  DatabaseReference _alarRef = createReference('alarma');
  DatabaseReference _garajePuRef = createReference('p_garaje');
  DatabaseReference _salaPuRef = createReference('p_sala');
  DatabaseReference _dispRef = createReference('comida_m');
  //Lista con las referencias de los bombillos de la base de datos
  List<DatabaseReference> _bomRef = [
    createReference("bombilla1"),
    createReference("bombilla2"),
    createReference("bombilla3"),
    createReference("bombilla4"),
    createReference("bombilla5")
  ];

  @override
  void initState() {
    super.initState();
    //Leer temperatura actual
    _temRef.keepSynced(true);
    _temRef.onValue.listen((Event event) {
      setState(() {
        _temperatura = event.snapshot.value;
      });
    });

    //Leer y escribir el estado de la alarma
    _alarRef.keepSynced(true);
    _alarRef.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          _estadoAlarma = true;
          color3 = Colors.red[900];
          seguridad = MyFlutterApp.candado1;
        } else {
          _estadoAlarma = false;
          color3 = Colors.grey;
          seguridad = MyFlutterApp.candado2;
        }
      });
    });

    //Leer y escribir el estado de la puerta del garaje
    _garajePuRef.keepSynced(true);
    _garajePuRef.onValue.listen((Event event) {
      setState(
        () {
          if (event.snapshot.value == 1) {
            _estadoPuGaraje = true;
            colorPG = Colors.pink;
            puertaG = MyFlutterApp.garage_up;
            puertaG2 = MyFlutterApp.garage_down;
          } else {
            _estadoPuGaraje = false;
            colorPG = Colors.grey;
            puertaG = MyFlutterApp.garage_down;
            puertaG2 = MyFlutterApp.garage_up;
          }
        },
      );
    });

    //Leer y escribir el estado de la puerta de la sala
    _salaPuRef.keepSynced(true);
    _salaPuRef.onValue.listen((Event event) {
      setState(
        () {
          if (event.snapshot.value == 1) {
            _estadoPuSala = true;
            colorPS = Colors.deepOrange;
            puertaS = MyFlutterApp.candado2;
          } else {
            _estadoPuSala = false;
            colorPS = Colors.grey;
            puertaS = MyFlutterApp.candado1;
          }
        },
      );
    });

    //Leer y escribir el estado del dispensador para la mascota
    _dispRef.keepSynced(true);
    _dispRef.onValue.listen((Event event) {
      setState(
        () {
          if (event.snapshot.value == 1) {
            _estadoDispensador = true;
            colorD = Colors.red[700];
          } else {
            _estadoDispensador = false;
            colorD = Colors.grey;
          }
        },
      );
    });

    //Leer y escibir el estado de las persianas
    _persianaRef.keepSynced(true);
    _persianaRef.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color1 = Colors.cyan;
          _estadoPersiana = true;
        } else {
          _estadoPersiana = false;
          color1 = Colors.grey;
        }
      });
    });
    //Leer y escibir el estado de las bombillas
    //        LED Escaleras
    _bomRef[0].keepSynced(true);
    _bomRef[0].onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          colors[1] = Colors.yellow;
          buttonPressedL[1] = true;
          bombillas[1] = MyFlutterApp.bombilla1;
        } else {
          buttonPressedL[1] = false;
          bombillas[1] = MyFlutterApp.bombilla2;
        }
      });
    });

    //LED Habitación
    _bomRef[1].keepSynced(true);
    _bomRef[1].onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          colors[0] = Colors.red[700];
          buttonPressedL[0] = true;
          bombillas[2] = MyFlutterApp.bombilla1;
        } else {
          buttonPressedL[0] = false;
          bombillas[2] = MyFlutterApp.bombilla2;
        }
      });
    });

    //LED Cocina
    _bomRef[2].keepSynced(true);
    _bomRef[2].onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          colors[2] = Colors.blue[700];
          buttonPressedL[2] = true;
          bombillas[3] = MyFlutterApp.bombilla1;
        } else {
          buttonPressedL[2] = false;
          bombillas[3] = MyFlutterApp.bombilla2;
        }
      });
    });

    //LED garaje
    _bomRef[3].keepSynced(true);
    _bomRef[3].onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          colors[3] = Colors.deepOrange[500];
          buttonPressedL[3] = true;
          bombillas[4] = MyFlutterApp.bombilla1;
        } else {
          buttonPressedL[3] = false;
          bombillas[4] = MyFlutterApp.bombilla2;
        }
      });
    });

    //LED sala
    _bomRef[4].keepSynced(true);
    _bomRef[4].onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          colors[4] = Colors.deepPurple[500];
          buttonPressedL[4] = true;
          bombillas[5] = MyFlutterApp.bombilla1;
        } else {
          buttonPressedL[4] = false;
          bombillas[5] = MyFlutterApp.bombilla2;
        }
      });
    });

    //Leer y escibir el estado del ventilador
    _ventRef.keepSynced(true);
    _ventRef.onValue.listen((Event event) {
      setState(() {
        if (event.snapshot.value == 1) {
          color2 = Colors.lime;
          _pauseV = false;
          ventilador = animateIcon(color2, 'ven_on', 400, 400, _pauseV);
        } else {
          color2 = Colors.grey;
          _pauseV = true;
          ventilador = animateIcon(Colors.grey, 'ven_on', 400, 400, _pauseV);
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
        length: 7,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[900],
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              child: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: Colors.grey,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      color: Colors.white, width: 2.0, style: BorderStyle.none),
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      MyFlutterApp.bed,
                    ),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(MyFlutterApp.garaje_privado),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(MyFlutterApp.chef_toque_and_mustache),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(MyFlutterApp.sala),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(MyFlutterApp.stairs_with_handrail),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(
                      seguridad,
                      color: _estadoAlarma ? color3 : Colors.white,
                    ),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  Tab(
                    icon: Icon(MyFlutterApp.bath),
                    iconMargin: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                customTab(
                  [
                    title("Habitación\n${_temperatura.toString()}°"),
                    Padding(
                      padding: const EdgeInsets.only(right: 48.0, left: 48.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          icon(colors[0], bombillas[2], 80),
                          icon(color1, MyFlutterApp.smart_curtain, 100),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            onPressed: () {
                              setState(() {
                                if (buttonPressedL[0]) {
                                  colors[0] = Colors.grey;
                                  bombillas[2] = MyFlutterApp.bombilla2;
                                  _bomRef[1].set(0);
                                } else {
                                  colors[0] = Colors.red[700];
                                  bombillas[2] = MyFlutterApp.bombilla1;
                                  _bomRef[1].set(1);
                                }
                                buttonPressedL[0] = !buttonPressedL[0];
                              });
                            },
                            color: Colors.red[700],
                            icon: bombillas[0],
                            iconSize: 60,
                            state: buttonPressedL[0],
                          ),
                          CustomButton(
                            icon: MyFlutterApp.smart_curtain,
                            iconSize: 60,
                            color: Colors.cyan,
                            state: _estadoPersiana,
                            onPressed: () {
                              setState(() {
                                if (_estadoPersiana == true) {
                                  color1 = Colors.grey;
                                  _persianaRef.set(0);
                                  _estadoPersiana = false;
                                } else {
                                  color1 = Colors.cyan;
                                  _persianaRef.set(1);
                                  _estadoPersiana = true;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                customTab([
                  title("Garaje"),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        icon(colors[3], bombillas[4], 100),
                        icon(colorPG, puertaG, 100)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: () {
                          setState(() {
                            if (buttonPressedL[3]) {
                              colors[3] = Colors.grey;
                              bombillas[4] = MyFlutterApp.bombilla2;
                              _bomRef[3].set(0);
                            } else {
                              colors[3] = Colors.deepOrange[500];
                              bombillas[4] = MyFlutterApp.bombilla1;
                              _bomRef[3].set(1);
                            }
                            buttonPressedL[3] = !buttonPressedL[3];
                          });
                        },
                        color: Colors.deepOrange[500],
                        icon: bombillas[0],
                        iconSize: 60,
                        state: buttonPressedL[3],
                      ),
                      CustomButton(
                        onPressed: () {
                          setState(() {
                            if (_estadoPuGaraje) {
                              colorPG = Colors.grey;
                              puertaG = MyFlutterApp.garage_down;
                              puertaG2 = MyFlutterApp.garage_up;
                              _garajePuRef.set(0);
                            } else {
                              colorPG = Colors.pink;
                              puertaG = MyFlutterApp.garage_up;
                              puertaG2 = MyFlutterApp.garage_down;
                              _garajePuRef.set(1);
                            }
                            _estadoPuGaraje = !_estadoPuGaraje;
                          });
                        },
                        color: Colors.pink,
                        icon: puertaG2,
                        iconSize: 60,
                        state: _estadoPuGaraje,
                      )
                    ],
                  )
                ]),
                customTab(
                  [
                    title("Cocina"),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          icon(colors[2], bombillas[3], 100),
                          icon(colorD,
                              MyFlutterApp.cuenco_de_comida_para_perros, 100)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if (buttonPressedL[2]) {
                                colors[2] = Colors.grey;
                                bombillas[3] = MyFlutterApp.bombilla2;
                                _bomRef[2].set(0);
                              } else {
                                colors[2] = Colors.blue[700];
                                bombillas[3] = MyFlutterApp.bombilla1;
                                _bomRef[2].set(1);
                              }
                              buttonPressedL[2] = !buttonPressedL[2];
                            });
                          },
                          color: Colors.blue[700],
                          icon: bombillas[0],
                          iconSize: 60,
                          state: buttonPressedL[2],
                        ),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if (_estadoDispensador) {
                                _dispRef.set(0);
                                colorD = Colors.grey;
                              } else {
                                _dispRef.set(1);
                                colorD = Colors.red[700];
                              }
                              _estadoDispensador = !_estadoDispensador;
                            });
                          },
                          color: Colors.red[700],
                          icon: MyFlutterApp.cuenco_de_comida_para_perros,
                          iconSize: 60,
                          state: _estadoDispensador,
                        )
                      ],
                    )
                  ],
                ),
                customTab(
                  [
                    title("Sala"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        icon(colors[4], bombillas[5], 100),
                        CustomAnimationIcon(
                          name: 'ven_on',
                          color: color2,
                          state: _pauseV,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [icon(colorPS, puertaS, 100)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if (buttonPressedL[4]) {
                                colors[4] = Colors.grey;
                                bombillas[5] = MyFlutterApp.bombilla2;
                                _bomRef[4].set(0);
                              } else {
                                colors[4] = Colors.deepPurple[500];
                                bombillas[5] = MyFlutterApp.bombilla1;
                                _bomRef[4].set(1);
                              }
                              buttonPressedL[4] = !buttonPressedL[4];
                            });
                          },
                          color: Colors.deepPurple[500],
                          icon: bombillas[5],
                          iconSize: 60,
                          state: buttonPressedL[4],
                        ),
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if (!_pauseV) {
                                color2 = Colors.grey;
                                _ventRef.set(0);
                                _pauseV = true;
                              } else {
                                color2 = Colors.lime;
                                _ventRef.set(1);
                                _pauseV = false;
                              }
                            });
                          },
                          color: Colors.lime,
                          icon: MyFlutterApp.ventilador,
                          iconSize: 60,
                          state: !_pauseV,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if (_estadoPuSala) {
                                colorPS = Colors.grey;
                                puertaS = MyFlutterApp.candado2;
                                _salaPuRef.set(0);
                              } else {
                                colorPS = Colors.deepOrange;
                                puertaS = MyFlutterApp.candado1;
                                _salaPuRef.set(1);
                              }
                              _estadoPuSala = !_estadoPuSala;
                            });
                          },
                          color: Colors.deepOrange,
                          icon: MyFlutterApp.candado1,
                          iconSize: 60,
                          state: _estadoPuSala,
                        )
                      ],
                    )
                  ],
                ),
                customTab(
                  [
                    title("Escaleras"),
                    Flexible(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            icon(colors[1], bombillas[1], 120),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if (buttonPressedL[1]) {
                                colors[1] = Colors.grey;
                                bombillas[1] = MyFlutterApp.bombilla2;
                                _bomRef[0].set(0);
                              } else {
                                colors[1] = Colors.yellow;
                                bombillas[1] = MyFlutterApp.bombilla1;
                                _bomRef[0].set(1);
                              }
                              buttonPressedL[1] = !buttonPressedL[1];
                            });
                          },
                          color: Colors.yellow,
                          icon: bombillas[0],
                          iconSize: 60,
                          state: buttonPressedL[1],
                        ),
                      ],
                    ),
                  ],
                ),
                customTab(
                  [
                    title("Seguridad"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [icon(color3, MyFlutterApp.siren, 120)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              if (_estadoAlarma) {
                                color3 = Colors.grey;
                                _alarRef.set(0);
                              } else {
                                color3 = Colors.red[900];
                                _alarRef.set(1);
                              }
                              _estadoAlarma = !_estadoAlarma;
                            });
                          },
                          color: Colors.red[900],
                          icon: MyFlutterApp.siren,
                          iconSize: 60,
                          state: _estadoAlarma,
                        )
                      ],
                    )
                  ],
                ),
                customTab([
                  title("Iconos"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
