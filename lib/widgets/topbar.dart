import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {

  TopBar({Key key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50.0,
              width: 150.0,
              child: Text(''),
            ),
            Expanded(
              child: Text(''),
            ),
            Container(
              height: 50.0,
              width: 150.0,
              child: Text(''),
            ),
          ],
        ),
      ],
    );
  }
}