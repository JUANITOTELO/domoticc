import 'package:flutter/material.dart';

Flexible title(String title, [double fsize = 25, Color color = Colors.white]) {
  return Flexible(
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.grey[800],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[800],
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ]),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: fsize,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
