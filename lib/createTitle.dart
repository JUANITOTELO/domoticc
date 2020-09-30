import 'package:flutter/material.dart';

Flexible title(String title) {
  return Flexible(
    child: Container(
      padding: EdgeInsets.all(20),
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
          ]),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.orange[400],
          fontSize: 25,
        ),
      ),
    ),
  );
}
