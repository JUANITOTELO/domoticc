import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

Icon icon(Color color, IconData icon, double size) {
  return Icon(
    icon,
    color: color,
    size: size,
  );
}

Container animateIcon(
    Color color, String name, double width, double height, bool state) {
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
}

class CustomButtonOff extends StatelessWidget {
  const CustomButtonOff({this.onPressed, this.color, this.icon, this.iconSize});
  final GestureTapCallback onPressed;
  final Color color;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
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
            size: MediaQuery.of(context).size.width * 0.2,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
