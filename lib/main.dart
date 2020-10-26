import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_widget_use/redux/states.dart';
import 'package:flutter_widget_use/redux/store.dart';
import 'package:flutter_widget_use/views/home/home.dart';
import 'package:flutter_widget_use/views/langeuageWrap.dart';
import 'package:flutter_widget_use/views/me/me.dart';
import 'package:redux/redux.dart';

import 'language/languageLocalizations.dart';
import 'language/languageLocalizationsDelegate.dart';

Store<IState> store = createStore();
void main() {
  runApp(MyApp(
    store: store,
  ));
}
GlobalKey<LanguageWrapState> languageWrapState = GlobalKey<LanguageWrapState>();
class MyApp extends StatelessWidget {
  final Store<IState> store;
  const MyApp({
    Key key,
    this.store,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<IState, IState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: [
                // 本地化的代理类
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                LanguageLocalizationsDelegate.delegate,
              ],
              supportedLocales: [
                const Locale('en', 'US'), // 美国英语
                const Locale('zh', 'CN'), // 中文简体
                //其它Locales
              ],
              title: 'flutter widget使用',
              theme: ThemeData(
                primarySwatch: state.themeColor.primarySwatch,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: LanguageWrap(
                key: languageWrapState,
                child: MyHomePage(title: ''),
              ),
            );
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [Home(), Me()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _controller.jumpToPage(index);
          },
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                title: Text(LanguageLocalizations.of(context).home)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                activeIcon: Icon(Icons.account_circle),
                title: Text(LanguageLocalizations.of(context).me)),
          ]),
    );
  }
}
