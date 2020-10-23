import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_widget_use/redux/reducer.dart';
import 'package:flutter_widget_use/redux/states.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<IState, IState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('首页 ${state.other.count}'),
            ),
            drawer: Drawer(
                child: ListView(
              children: [
                DrawerHeader(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/header.jpg'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('设置'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    _bottomModalSheet(context: context);
                  },
                ),
                Divider()
              ],
            )),
            body: Column(
              children: [
                Flexible(
                  child: ListView(
                    children: [
                      ListTile(
                        title:
                            Text('当前的主题颜色是 ${state.themeColor.primarySwatch}'),
                      ),
                      Divider(),
                      ListTile(
                        title:
                            Text('store里的index的count值是：${state.index.count}'),
                      ),
                      Divider(),
                      ListTile(
                        title:
                            Text('store里的other的count值是：${state.other.count}'),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Flexible(
                  child: ListView(
                    children: [
                      RaisedButton(
                        child: Text('点击弹出drawer'),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                      StoreConnector<IState, VoidCallback>(
                        builder: (context, callback) {
                          return RaisedButton(
                            onPressed: callback,
                            child: Text('添加store 的index 的count'),
                          );
                        },
                        converter: (store) {
                          return () => store
                              .dispatch({'type': Types.action1, 'payload': 1});
                        },
                      ),
                      StoreConnector<IState, VoidCallback>(
                        builder: (context, callback) {
                          return RaisedButton(
                            onPressed: callback,
                            child: Text('添加store other 的count'),
                          );
                        },
                        converter: (store) {
                          return () => store.dispatch({'type': Types.action2});
                        },
                      ),
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          );
        });
  }

  _bottomModalSheet({@required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return ListView(
            children: [
              StoreConnector<IState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(
                        {'type': Types.changeTheme, 'payload': Colors.red});
                  },
                  builder: (context, callback) => ListTile(
                        title: Text('更换主题'),
                        onTap: callback,
                      )),
              Divider(),
              StoreConnector<IState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch({'type': Types.action2});
                  },
                  builder: (context, callback) => ListTile(
                        title: Text('other数字增加'),
                        onTap: callback,
                      )),
            ],
          );
        },
      ),
    );
  }
}
