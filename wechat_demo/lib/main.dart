import 'package:flutter/material.dart';
import 'app.dart';
import 'loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MaterialApp(
      title: "wechat",
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      routes: <String, WidgetBuilder>{
        "/app": (context) => App(),
      },
      home: new LoadingPage(),
    ));

final ThemeData myTheme = new ThemeData(
  primaryColor: Color(0xff303030),
  scaffoldBackgroundColor: Color(0xFFEBEBEB),
  cardColor: Color(0xff393a3f),
);
