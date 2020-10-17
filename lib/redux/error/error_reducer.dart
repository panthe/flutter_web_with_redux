import 'package:redux/redux.dart';
import 'package:flutter_web_with_redux/redux/error/error_state.dart';
import 'package:flutter_web_with_redux/redux/error/error_actions.dart';

final errorReducer = combineReducers<ErrorState>([
  TypedReducer<ErrorState,SetError>(_setting),
  TypedReducer<ErrorState,DismissError>(_dismiss),
]);

ErrorState _setting(ErrorState state, SetError action){
  return state.copyWith(
      isShowing: action.isShowing,
      errorCode: action.errorCode,
      errorDescription: action.errorDescription
  );
}

ErrorState _dismiss(ErrorState state, DismissError action){
  return ErrorState.initial();
}