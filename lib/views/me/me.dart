import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_widget_use/language/languageLocalizations.dart';
import 'package:flutter_widget_use/redux/states.dart';
import 'package:flutter_widget_use/views/me/login.dart';

class Me extends StatefulWidget {
  Me({Key key}) : super(key: key);

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageLocalizations.of(context).me),
      ),
      body: StoreConnector<IState, IState>(
          converter: (store) => store.state,
          builder: (context, state) {
            return ListView(
              children: [
                Center(
                  child: Text('${state.index.count}'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('点击登录'),
                )
              ],
            );
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
