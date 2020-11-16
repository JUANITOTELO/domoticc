import 'package:flutter/material.dart';

Padding customTab(List<Widget> tab) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: tab,
    ),
  );
}
