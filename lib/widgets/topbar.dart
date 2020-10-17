import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50.0,
              margin: EdgeInsets.all(10.0),
              child: Text(
                'Flutter Web with Redux',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(''),
            ),
            Flexible(
              child: Container(
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                child: Text(
                  'A simply application that shows a boilerplate in Redux',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
