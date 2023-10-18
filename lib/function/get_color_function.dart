import 'package:flutter/material.dart';

Color getColor(String color) {
  switch (color.toLowerCase()) {
    case 'white':
      return Colors.white;
    case 'green':
      return Colors.green;
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    default:
      return Colors.transparent;
  }
}
