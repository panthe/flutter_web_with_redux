import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_with_redux/config/keys.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/user/user_actions.dart';

class TopBarTabs extends StatelessWidget {
  final store = StoreProvider.of<AppState>(Keys.scaffoldKey.currentContext);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 35.0,
                width: 150.0,
                child: FlatButton(
                  onPressed: () => store.dispatch(FetchUser()),
                  color: Colors.deepOrange,
                  child: Text(
                    "FETCH USER",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
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

