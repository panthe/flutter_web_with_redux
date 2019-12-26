import 'package:redux/redux.dart';
import 'user_actions.dart';
import 'user_state.dart';

final userReducer = combineReducers<UserState>([
    TypedReducer<UserState, FetchingUser>(_fetching),
    TypedReducer<UserState, SetUser>(_setting),
    TypedReducer<UserState, SavingUser>(_saving),
]);

UserState _fetching(UserState state, FetchingUser action){
  return state.copyWith(
      isFetching: action.isFetching,
      isSaving: false,
      user: null
  );
}

UserState _setting(UserState state, SetUser action){
  return state.copyWith(
      isFetching: false,
      isSaving: false,
      user: action.user
  );
}

UserState _saving(UserState state, SavingUser action){
  return state.copyWith(
      isFetching: false,
      isSaving: action.isSaving,
  );
}