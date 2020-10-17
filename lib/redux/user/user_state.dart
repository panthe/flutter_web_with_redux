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

  static UserState fromJson(Map<String, dynamic> json) {
    User user = (json==null) ? null : User.fromJson(json['user']);

    return UserState(
      isFetching: json['isFetching'] == null ? false : json['isFetching'],
      isSaving: json['isSaving'] == null ? false : json['isSaving'],
      user: user,
    );
  }

  Map<String, dynamic> toJson() => {
    'isFetching': isFetching,
    'isSaving': isSaving,
    'user': user.toJson(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          isFetching == other.isFetching &&
          isSaving == other.isSaving &&
          user == other.user;

  @override
  int get hashCode => isFetching.hashCode ^ isSaving.hashCode ^ user.hashCode;
}