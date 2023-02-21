import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // 右上角的菜单
  _popMenuItem(String title,
      {String imagePath = "", IconData icon = Icons.email}) {
    return PopupMenuItem(
        child: Row(
      children: <Widget>[
        // 图片
        imagePath != ""
            ? Image.asset(imagePath, width: 32, height: 32)
            : Icon(icon, color: Colors.white),
        // 文字
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("聊天"),
        // 右边的按钮
        actions: [
          // 搜索按钮 并且用 手势识别组件包裹
          GestureDetector(
            onTap: () {
              print("点击事件");
            },
            child: Icon(Icons.search),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                  onTap: () {
                    // 弹出选择菜单
                    showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(500, 76, 10, 10),
                        items: <PopupMenuEntry>[
                          _popMenuItem("发起群聊",
                              imagePath: "images/icon_menu_group.png"),
                          _popMenuItem("添加朋友",
                              imagePath: "images/icon_menu_addfriend.png"),
                          _popMenuItem("扫一扫",
                              imagePath: "images/icon_menu_scan.png"),
                          _popMenuItem("首付款", icon: Icons.crop_free),
                          _popMenuItem("帮助与反馈", icon: Icons.email),
                        ]);
                    print("点击事件");
                  },
                  child: Icon(Icons.add)))
        ],
      ),
    );
  }
}
