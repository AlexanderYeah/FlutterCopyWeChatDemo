import 'package:flutter/material.dart';
import 'found/found.dart';
import 'contacts/contact.dart';
import 'personal/personal.dart';
import 'chat/chat.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  // 定义各个页面
  _currentPage() {
    switch (_currentIndex) {
      case 0:
        ChatPage chat = new ChatPage();
        return chat;

      case 1:
        ContactsPage contact = ContactsPage();
        return contact;

      case 2:
        FoundPage found = FoundPage();
        return found;

      case 3:
        ProfilePage profile = ProfilePage();
        return profile;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
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
