import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../app/app_state.dart';
import 'error_actions.dart';

Middleware<AppState> createErrorMiddleware() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {

    if (action is ShowError) {

     Scaffold.of(store.state.errorState.context).showSnackBar(
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
      Scaffold.of(store.state.errorState.context).hideCurrentSnackBar();
    }

    next(action);
  };
}