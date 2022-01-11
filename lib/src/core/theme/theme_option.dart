import 'package:flutter/material.dart';

class ThemeOption {
  final String name;
  final ThemeMode themeMode;
  final String activeImage;
  final String inactiveImage;

  ThemeOption({
    required this.name,
    required this.themeMode,
  })  : activeImage = 'assets/images/theme/${name}1.png',
        inactiveImage = 'assets/images/theme/${name}0.png';
}
