import 'package:meta/meta.dart';
import 'package:flutter_web_with_redux/models/user.dart';

@immutable
class UserState {
  final bool isFetching;
  final bool isSaving;
  final User user;

  UserState({
    this.isFetching,
    this.isSaving,
    this.user
  });

  UserState copyWith({
    bool isFetching,
    bool isSaving,
    User user
  }){
   return new UserState(
     isFetching: isFetching ?? this.isFetching,
     isSaving: isSaving ?? this.isSaving,
     user: user ?? this.user
   );
  }

  factory UserState.initial(){
    return new UserState(
      isFetching: false,
      isSaving: false,
      user: null
    );
  }
}