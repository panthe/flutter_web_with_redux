import 'package:redux/redux.dart';
import './message_state.dart';
import './message_actions.dart';

final messageReducer = combineReducers<MessageState>([
  TypedReducer<MessageState,SetMessageContext>(_setting),
  TypedReducer<MessageState,ShowMessage>(_showing),
  TypedReducer<MessageState,DismissMessage>(_dismiss),
]);

MessageState _setting(MessageState state, SetMessageContext action){
  return state.copyWith(
      context: action.context
  );
}

MessageState _showing(MessageState state, ShowMessage action){
  return state.copyWith(
      isShowing: true,
      messageCode: action.messageCode,
      messageDescription: action.messageDescription
  );
}

MessageState _dismiss(MessageState state, DismissMessage action){
  return state.copyWith(
      isShowing: false,
      messageCode: 0,
      messageDescription: ""
  );
}