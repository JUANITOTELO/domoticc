import 'package:domoticc/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

Icon icon(Color color, IconData icon, double size) {
  return Icon(
    icon,
    color: color,
    size: size,
  );
}

dynamic animateIcon(
    Color color, String name, double width, double height, bool state) {
  if (state == false) {
    return Container(
      width: width,
      height: height,
      child: FlareActor(
        'animations/Ventilador.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        isPaused: state,
        color: color,
        animation: name,
        shouldClip: false,
      ),
    );
  } else {
    return Container(
        width: width,
        height: height,
        child: Icon(
          MyFlutterApp.ventilador,
          color: color,
          size: width / 2,
        ));
  }
}

class CustomAnimationIcon extends StatelessWidget {
  const CustomAnimationIcon({this.name, this.color, this.state});
  final Color color;
  final bool state;
  final String name;

  @override
  Widget build(BuildContext context) {
    if (state == false) {
      return Container(
        width: (MediaQuery.of(context).size.width / 3),
        height: (MediaQuery.of(context).size.width / 3),
        child: FlareActor(
          'animations/Ventilador.flr',
          alignment: Alignment.center,
          fit: BoxFit.cover,
          isPaused: state,
          color: color,
          animation: name,
          shouldClip: false,
        ),
      );
    } else {
      return Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
          child: Icon(
            MyFlutterApp.ventilador,
            color: color,
            size: MediaQuery.of(context).size.width / 4,
          ));
    }
  }
}

class CustomButtonOff extends StatelessWidget {
  const CustomButtonOff({this.onPressed, this.color, this.icon, this.iconSize});
  final GestureTapCallback onPressed;
  final Color color;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.height * 0.15,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.grey[800],
            boxShadow: [
              BoxShadow(
                color: Colors.grey[900],
                offset: Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.grey[700],
                offset: Offset(-4, -4),
                blurRadius: 8,
                spreadRadius: 1,
              )
            ]),
        child: MaterialButton(
          color: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          disabledColor: Colors.transparent,
          elevation: 0,
          disabledElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          child: Icon(icon,
              color: color, size: MediaQuery.of(context).size.width * 0.2),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class CustomButtonOn extends StatelessWidget {
  const CustomButtonOn({this.onPressed, this.color, this.icon, this.iconSize});
  final GestureTapCallback onPressed;
  final Color color;
  final IconData icon;
  final double iconSize;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.height * 0.15,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.grey[900],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[800],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.grey[900],
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[700],
                  Colors.grey[700],
                  Colors.grey[800],
                  Colors.grey[900],
                ],
                stops: [
                  0.1,
                  0.3,
                  0.8,
                  1
                ])),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: Colors.grey[600],
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[900],
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.grey[700],
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey[900],
                    Colors.grey[800],
                    Colors.grey[700],
                    Colors.grey[700],
                  ],
                  stops: [
                    0,
                    0.1,
                    0.3,
                    1
                  ])),
          child: MaterialButton(
            color: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            disabledColor: Colors.transparent,
            elevation: 0,
            disabledElevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            hoverElevation: 0,
            child: Icon(
              icon,
              color: color,
              size: (MediaQuery.of(context).size.width * 0.2),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
