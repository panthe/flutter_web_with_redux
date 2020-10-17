import 'package:redux/redux.dart';
import 'package:flutter_web_with_redux/redux/message/message_state.dart';
import 'package:flutter_web_with_redux/redux/message/message_actions.dart';

final messageReducer = combineReducers<MessageState>([
  TypedReducer<MessageState,SetMessage>(_setting),
  TypedReducer<MessageState,DismissMessage>(_dismiss),
]);

MessageState _setting(MessageState state, SetMessage action){
  return state.copyWith(
      isShowing: action.isShowing,
      messageCode: action.messageCode,
      messageDescription: action.messageDescription);
}

MessageState _dismiss(MessageState state, DismissMessage action){
  return MessageState.initial();
}