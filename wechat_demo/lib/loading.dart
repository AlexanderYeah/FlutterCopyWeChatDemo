import 'package:flutter/material.dart';
// 加载异步
import 'dart:async';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化的时候 加载启动页
    new Future.delayed(Duration(seconds: 3), () {
      print("启动页加载");
      Navigator.of(context).pushNamed("/app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/loading.jpg"),
    );
  }
}
