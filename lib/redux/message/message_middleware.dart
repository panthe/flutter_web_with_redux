import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../app/app_state.dart';
import 'message_actions.dart';


Middleware<AppState> createMessageMiddleware() {
  //debugPrint('createMessageMiddleware');
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    // //debugPrint("Action " + action.toString());

    if (action is ShowMessage) {
      //debugPrint('ShowMessage');

      Scaffold.of(action.context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content:new Text(action.messageDescription),
            duration: Duration(minutes: 1),
            action: new SnackBarAction(
              textColor: Colors.black,
              label: "OK",
              onPressed: () => store.dispatch(DismissMessage()),
            ),
          )
      );
    }

    if (action is DismissMessage){
      Scaffold.of(action.context).hideCurrentSnackBar();
    }

    next(action);
  };
}