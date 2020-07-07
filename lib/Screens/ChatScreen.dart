import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_project/Models/ChatUser.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyMsg.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: index == 0
              ? EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(20.0),
                  ScreenUtil().setHeight(25.0),
                  ScreenUtil().setWidth(20.0),
                  ScreenUtil().setHeight(0.0))
              : EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20.0)),
              height: ScreenUtil().setHeight(120.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                
              ),
        );
      },
    );
  }
}
