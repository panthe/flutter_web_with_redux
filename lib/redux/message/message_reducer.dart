import 'package:redux/redux.dart';
import './message_state.dart';
import './message_actions.dart';

final messageReducer = combineReducers<MessageState>([
  TypedReducer<MessageState,ShowMessage>(_showing),
  TypedReducer<MessageState,DismissMessage>(_dismiss),
]);

MessageState _showing(MessageState state, ShowMessage action){
  //debugPrint('_showing');
  return state.copyWith(
      context: action.context,
      isShowing: true,
      messageCode: action.messageCode,
      messageDescription: action.messageDescription
  );
}

MessageState _dismiss(MessageState state, DismissMessage action){
  //debugPrint('_dismiss');
  return state.copyWith(
      context: null,
      isShowing: false,
      messageCode: 0,
      messageDescription: ""
  );
}