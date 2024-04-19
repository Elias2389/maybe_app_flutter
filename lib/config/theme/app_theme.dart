import 'package:flutter/material.dart';

const Color _customColor = Color(0XFFf5f5f5);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.yellow,
  Colors.orange,
];

class AppTheme {

  final int selectedColor;


  AppTheme({
    this.selectedColor = 0
}): assert(selectedColor >= 0 && selectedColor < _colorThemes.length - 1, 'Colors must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      // brightness: Brightness.dark,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
