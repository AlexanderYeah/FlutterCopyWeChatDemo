import 'package:flutter/material.dart';
import 'dart:async';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

enum Option { A, B }

enum AlertOption { Ok, Cancel }

class _ChatPageState extends State<ChatPage> {
  // 这个key值必须赋给Scafford 中的key 字段，否则下面会报错
  final _bottomSheetScaffordKey = GlobalKey<ScaffoldState>();

  _openModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            height: 250,
            child: Column(
              children: [
                ListTile(
                  title: Text("Sentence A"),
                  subtitle: Text(
                      "Sorry to be so direct,but how much did you pay for this ?"),
                ),
                ListTile(
                  title: Text("Sentence B"),
                  subtitle: Text(
                      "this medicine,properly used,will do you a lot of good "),
                ),
                ListTile(
                  title: Text("Sentence C"),
                  subtitle: Text(
                      "just as food feeds the body,so reading feeds the mind"),
                ),
              ],
            ),
          );
        });
  }

  _openBottomSheet() {
    _bottomSheetScaffordKey.currentState!
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          child: Center(
            child: Text(
                "In the absence of better idea i had to choose this method"),
          ),
          height: 300,
          width: double.infinity,
        ),
      );
    });
  }

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

  _openAlertDialog() async {
    final alertOption = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // 标题
            title: Text(
              "This is Alert",
              style: TextStyle(color: Colors.red),
            ),
            // 内容
            content: Text(
                "It will not make much difference whether you go today or tomorrow,do you want cancel your plan?"),
            // 动作
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(AlertOption.Cancel);
                  },
                  child: Text("Close")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(AlertOption.Ok);
                  },
                  child: Text("Ok"))
            ],
          );
        });
    print(alertOption);
  }

  // 异步的回调
  Future _openOneDialog() async {
    //
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          // 选择对话框的样式
          return SimpleDialog(
            title: Text(
              "this is simple",
              style: TextStyle(color: Colors.red),
            ),
            // 可以定义很多选项
            children: [
              SimpleDialogOption(
                child: Text('OptionA'),
                // 点击关闭对话框
                onPressed: () {
                  // 这里把选择的值传递过去
                  Navigator.of(context).pop(Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                // 点击关闭对话框
                onPressed: () {
                  // 这里把选择的值传递过去
                  Navigator.of(context).pop(Option.B);
                },
              )
            ],
          );
        });
    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffordKey,
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
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("对话框"),
            onPressed: () {
              // 显示对话框
              _openModalBottomSheet();
            },
          ),
        ),
      ),
    );
  }
}
