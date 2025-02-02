import 'package:flutter/material.dart';

class AppStyle {
  static boldText() {
    return const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black);
  }

  static lightText() {
    return const TextStyle(fontWeight: FontWeight.normal, fontSize: 17);
  }

  static boldTextPrice() {
    return const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red);
  }
}
