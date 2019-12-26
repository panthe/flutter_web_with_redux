import 'package:redux/redux.dart';
import './error_state.dart';
import './error_actions.dart';

final errorReducer = combineReducers<ErrorState>([
  TypedReducer<ErrorState,ShowError>(_showing),
  TypedReducer<ErrorState,DismissError>(_dismiss),
]);

ErrorState _showing(ErrorState state, ShowError action){
  return state.copyWith(
      context: action.context,
      isShowing: true,
      errorCode: action.errorCode,
      errorDescription: action.errorDescription
  );
}

ErrorState _dismiss(ErrorState state, DismissError action){
  return state.copyWith(
      context: null,
      isShowing: false,
      errorCode: 0,
      errorDescription: null
  );
}