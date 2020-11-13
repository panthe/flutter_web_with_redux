import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/error/error_reducer.dart';
import 'package:flutter_web_with_redux/redux/message/message_reducer.dart';
import 'package:flutter_web_with_redux/redux/user/user_reducer.dart';

AppState appReducer(state, action) {
  return AppState(
    errorState: errorReducer(state.errorState,action),
    messageState: messageReducer(state.messageState,action),
    userState: userReducer(state.userState,action)
  );
}