import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("111"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            new BottomNavigationBarItem(
                label: '微信',
                icon: _currentIndex != 0
                    ? Image.asset("images/weixin_normal.png",
                        width: 32, height: 28)
                    : Image.asset("images/weixin_pressed.png",
                        width: 32, height: 28)),
            new BottomNavigationBarItem(
                label: '通讯录',
                icon: _currentIndex != 1
                    ? Image.asset("images/contact_list_normal.png",
                        width: 32, height: 28)
                    : Image.asset("images/contact_list_pressed.png",
                        width: 32, height: 28)),
            new BottomNavigationBarItem(
                label: '发现',
                icon: _currentIndex != 2
                    ? Image.asset("images/find_normal.png",
                        width: 32, height: 28)
                    : Image.asset("images/find_pressed.png",
                        width: 32, height: 28)),
            new BottomNavigationBarItem(
                label: '我',
                icon: _currentIndex != 3
                    ? Image.asset("images/profile_normal.png",
                        width: 32, height: 28)
                    : Image.asset("images/profile_pressed.png",
                        width: 32, height: 28))
          ]),
    );
  }
}
