
import 'package:flutter/material.dart';
// 创建state
class Index {
  int count;
  Index({this.count});

  String toString() {
    return '${this.count}';
  }
}

class Other {
  int count;
  Other({this.count});

  String toString() {
    return '${this.count}';
  }
}

class ThemeColor {
  MaterialColor primarySwatch;
  ThemeColor({this.primarySwatch});
}

class IState {
  Index index;
  Other other;
  ThemeColor themeColor;

  IState.initState() {
    this.index = Index(count: 0);
    this.other = Other(count: 0);
    this.themeColor = ThemeColor(primarySwatch: Colors.blue);
  }
}
