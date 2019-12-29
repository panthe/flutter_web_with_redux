import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../app/app_state.dart';
import 'message_actions.dart';


Middleware<AppState> createMessageMiddleware() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {

    if (action is ShowMessage) {

      Scaffold.of(store.state.messageState.context).showSnackBar(
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
      Scaffold.of(store.state.messageState.context).hideCurrentSnackBar();
    }

    next(action);
  };
}