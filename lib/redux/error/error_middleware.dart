import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../app/app_state.dart';
import 'error_actions.dart';

Middleware<AppState> createErrorMiddleware() {
  //debugPrint('createErrorMiddleware');
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    // //debugPrint("Action " + action.toString());

    if (action is ShowError) {
      //debugPrint('ShowError');

     Scaffold.of(action.context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content:new Text(action.errorDescription),
            duration: Duration(minutes: 1),
            action: new SnackBarAction(
              textColor: Colors.black,
              label: "OK",
              onPressed: () => store.dispatch(DismissError()),
            ),
          )
      );
    }

    if (action is DismissError){
      Scaffold.of(action.context).hideCurrentSnackBar();
    }

    next(action);
  };
}