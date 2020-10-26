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

class CurrentLanguage {
  String language;
  CurrentLanguage({this.language});
}

class IState {
  Index index;
  Other other;
  ThemeColor themeColor;
  CurrentLanguage currentLanguage;
  IState.initState() {
    this.index = Index(count: 0);
    this.other = Other(count: 0);
    this.themeColor = ThemeColor(primarySwatch: Colors.blue);
    this.currentLanguage = CurrentLanguage(language: 'Chinese');
  }
}
