import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_widget_use/language/languageLocalizations.dart';
import 'package:flutter_widget_use/main.dart';
import 'package:flutter_widget_use/redux/reducer.dart';
import 'package:flutter_widget_use/redux/states.dart';

import 'accept.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _acceptPram;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<IState, IState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(title: Text(LanguageLocalizations.of(context).home)),
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
                  onTap: () {},
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
                      RaisedButton(
                        child:
                            Text(LanguageLocalizations.of(context).changeTheme),
                        onPressed: () {
                          _showThemeColor.call(context);
                        },
                      ),
                      RaisedButton(
                        child: Text(
                            LanguageLocalizations.of(context).changeLanguage),
                        onPressed: () {
                          _showLanguageBottomModalSheet(context);
                        },
                      ),
                      RaisedButton(
                          child:
                              Text('页面传值并且接受下一个页面返回的值是： ${_acceptPram ?? ''}'),
                          onPressed: () async {
                            String res = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Accept(
                                  pram: 'hello 这是home',
                                ),
                              ),
                            );
                            setState(() {
                              _acceptPram = res;
                            });
                          })
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          );
        });
  }

  _showThemeColor(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => ListView(
              children: [
                StoreConnector<IState, VoidCallback>(
                  converter: (store) => () {
                    Navigator.pop(context);
                    return store.dispatch(
                        {'type': Types.changeTheme, 'payload': Colors.red});
                  },
                  builder: (context, callback) => FlatButton(
                    onPressed: callback,
                    child: Text(
                      '红色',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                ),
                StoreConnector<IState, VoidCallback>(
                  converter: (store) => () {
                    Navigator.pop(context);
                    return store.dispatch(
                        {'type': Types.changeTheme, 'payload': Colors.blue});
                  },
                  builder: (context, callback) => FlatButton(
                    onPressed: callback,
                    child: Text(
                      '蓝色',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ));
  }

  // 语言切换
  _showLanguageBottomModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        children: [
          FlatButton(
              onPressed: () {
                languageWrapState.currentState.changeLocale(
                  const Locale('zh', 'CN'),
                );
              },
              child: Text('中文')),
          Divider(
            height: 0,
          ),
          FlatButton(
              onPressed: () {
                languageWrapState.currentState.changeLocale(
                  const Locale('en', 'US'),
                );
              },
              child: Text('English')),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
