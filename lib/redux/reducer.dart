import 'package:flutter/material.dart';
import 'package:flutter_widget_use/redux/states.dart';

// 创建reducer
enum Types { action1, action2, changeTheme, changeLanguage }
IState rootReducer(IState state, dynamic action) {
  if (action['type'] == Types.action1) {
    state.index.count += action['payload'];
  }
  if (action['type'] == Types.action2) {
    state.other.count += 2;
  }
  if (action['type'] == Types.changeTheme) {
    if (action['payload'] is MaterialColor) {
      state.themeColor.primarySwatch = action['payload'];
    }
  }
  if (action['type'] == Types.changeLanguage) {
    if (action['payload']) {}
  }
  return state;
}
