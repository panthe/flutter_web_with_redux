import 'package:redux/redux.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/app/app_reducer.dart';
import 'package:flutter_web_with_redux/redux/error/error_middleware.dart';
import 'package:flutter_web_with_redux/redux/message/message_middleware.dart';
import 'package:flutter_web_with_redux/redux/user/user_middleware.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
      ..add(createErrorMiddleware())
      ..add(createMessageMiddleware())
      ..add(createUserMiddleware())
  );
}