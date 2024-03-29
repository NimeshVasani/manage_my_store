import 'package:flutter/cupertino.dart';

class ScreenData {
  final String label;
  final IconData icon;
  final Widget screen;

  ScreenData(
      {required this.label,
        required this.icon,
        this.screen = const SizedBox.shrink()});
}
