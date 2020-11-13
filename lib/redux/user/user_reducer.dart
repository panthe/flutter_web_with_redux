import 'package:redux/redux.dart';
import 'package:flutter_web_with_redux/redux/user/user_actions.dart';
import 'package:flutter_web_with_redux/redux/user/user_state.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, FetchingUser>(_fetching),
  TypedReducer<UserState, SetUser>(_setting),
  TypedReducer<UserState, SavingUser>(_saving),
]);

UserState _fetching(UserState state, FetchingUser action) {
  return state.copyWith(
    isFetching: action.isFetching,
  );
}

UserState _setting(UserState state, SetUser action) {
  return state.copyWith(user: action.user);
}

UserState _saving(UserState state, SavingUser action) {
  return state.copyWith(
    isSaving: action.isSaving,
  );
}
