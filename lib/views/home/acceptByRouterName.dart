import 'package:flutter/material.dart';

class AcceptByRouterName extends StatefulWidget {
  
  AcceptByRouterName({Key key}) : super(key: key);

  @override
  _AcceptByRouterNameState createState() => _AcceptByRouterNameState();
}

class _AcceptByRouterNameState extends State<AcceptByRouterName> {
  dynamic arg;
  @override
  void initState() { 
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    dynamic args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('接受参数值和反向传值'),
      ),
      body: ListView(
        children: [
          Text('接受的参数值是：${args['h']}'),
          Divider(),
          RaisedButton(
              child: Text('返回上一页的值'),
              onPressed: () {
                Navigator.of(context).pop('hello 这是 AcceptByRouterName');
              })
        ],
      ),
    );
  }
}
