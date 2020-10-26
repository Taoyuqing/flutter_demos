import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_widget_use/language/languageLocalizations.dart';
import 'package:flutter_widget_use/redux/states.dart';

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
            return Center(
              child: Text('${state.index.count}'),
            );
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
