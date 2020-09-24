import 'package:flutter/material.dart';
import 'my_flutter_app_icons.dart';
import 'package:flare_flutter/flare_actor.dart';

class DWeb extends StatefulWidget {
  const DWeb({Key key}) : super(key: key);
  @override
  _DWebState createState() => _DWebState();
}

class _DWebState extends State<DWeb> {
  //IconData persiana = MyFlutterApp.icono_persiana_a;
  bool _pauseV = true;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
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
                Icon(
                  MyFlutterApp.bombilla1,
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
