/**
 * App内语言修改 参考 https://www.jianshu.com/p/8356a3bc8f6c
 * App语言随系统的设置变化而变的 参考 https://www.jianshu.com/p/b3804d44ed3c
 */
import 'package:flutter/material.dart';

class LanguageWrap extends StatefulWidget {
  final Widget child;
  LanguageWrap({Key key, this.child}) : super(key: key);

  @override
  LanguageWrapState createState() => LanguageWrapState();
}

class LanguageWrapState extends State<LanguageWrap> {
  Locale _locale = const Locale('zh', 'CN');
  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      child: widget.child,
      locale: _locale,
    );
  }
}
