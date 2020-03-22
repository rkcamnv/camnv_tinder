import 'package:camnv_tinder/src/utils/color.dart';
import 'package:flutter/material.dart';

class TabInfo extends StatefulWidget {
  String title;
  String content;

  TabInfo(this.title, this.content);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(color: HexColor("#a3a3a3")),
        ),
        subtitle: Text(
          widget.content,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
    );
  }
}
