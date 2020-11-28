import 'package:flutter/material.dart';

Padding customTab(List<Widget> tab) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: tab,
    ),
  );
}

Column persona(var nombre, var ubicacion) {
  return Column(
    children: [
      Container(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(ubicacion),
          radius: 40,
        ),
      ),
      Container(
        padding: EdgeInsets.all(14.0),
        child: Text(
          nombre,
          style: TextStyle(fontFamily: 'Handlee', fontSize: 20),
        ),
      ),
    ],
  );
}
