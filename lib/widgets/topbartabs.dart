import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/user/user_actions.dart';

class TopBarTabs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50.0,
                width: constraints.maxWidth/2,
                child: Text(''),
              ),
              Container(
                height: 50.0,
                width: constraints.maxWidth/2,
                child: FlatButton(
                  onPressed: () => StoreProvider.of<AppState>(context).dispatch(FetchUser(context: context)),
                  color: Colors.deepOrange,
                  child: Text(
                    "FETCH USER",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.normal
                    ),
                    textAlign: TextAlign.start,
                  ),
                )
              ),
            ],
          );
        }
    );
  }
}

