import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';

abstract class SavePreferences extends StatefulWidget {
  Future<dynamic> getPreferences(dynamic name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(name);
  }

  void setPreferences(dynamic name, dynamic value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (ValueKey is String) {
      preferences.setString(name, value);
    } else if (value is int) {
      preferences.setInt(name, value);
    } else if (value is double) {
      preferences.setDouble(name, value);
    } else if (value is bool) {
      preferences.setBool(name, value);
    }
  }
}
