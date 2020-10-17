import 'package:redux/redux.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';

Middleware<AppState> createMessageMiddleware() {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
  };
}