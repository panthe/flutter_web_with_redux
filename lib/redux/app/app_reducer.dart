import './app_state.dart';
import '../error/error_reducer.dart';
import '../message/message_reducer.dart';
import '../user/user_reducer.dart';

AppState appReducer(state, action) {
  return new AppState(
    errorState: errorReducer(state.errorState,action),
    messageState: messageReducer(state.messageState,action),
    userState: userReducer(state.userState,action)
  );
}