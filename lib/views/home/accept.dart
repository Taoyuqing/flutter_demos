import 'package:flutter/material.dart';

class Accept extends StatefulWidget {
  final String pram;
  Accept({Key key, this.pram}) : super(key: key);

  @override
  _AcceptState createState() => _AcceptState();
}

class _AcceptState extends State<Accept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('接受参数值和反向传值'),
      ),
      body: ListView(
        children: [
          Text('接受的参数值是：${widget.pram}'),
          Divider(),
          RaisedButton(
              child: Text('返回上一页的值'),
              onPressed: () {
                Navigator.of(context).pop('hello 这是 accept');
              })
        ],
      ),
    );
  }
}
