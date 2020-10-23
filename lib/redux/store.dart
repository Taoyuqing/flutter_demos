import 'package:flutter_widget_use/redux/reducer.dart';
import 'package:flutter_widget_use/redux/states.dart';
import 'package:redux/redux.dart';

// 创建store
logger(Store<IState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');
  next(action);
}

Store<IState> createStore() {
  Store<IState> store = Store<IState>(rootReducer,
      initialState: IState.initState(),
      middleware: [logger]);
  return store;
}
