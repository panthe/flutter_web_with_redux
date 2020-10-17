import 'package:meta/meta.dart';
import 'package:flutter_web_with_redux/redux/error/error_state.dart';
import 'package:flutter_web_with_redux/redux/message/message_state.dart';
import 'package:flutter_web_with_redux/redux/user/user_state.dart';

@immutable
class AppState {
  final ErrorState errorState;
  final MessageState messageState;
  final UserState userState;

  AppState({
    this.errorState,
    this.messageState,
    this.userState
  });

  factory AppState.initial() {
    return AppState(
      errorState: ErrorState.initial(),
      messageState: MessageState.initial(),
      userState: UserState.initial(),
    );
  }

  AppState copyWith({
    ErrorState errorState,
    MessageState messageState,
    UserState userState,
  }) {
    return AppState(
      errorState: errorState ?? this.errorState,
      messageState: messageState ?? this.messageState,
      userState: userState ?? this.userState,
    );
  }

  static AppState fromJson(Map<String, dynamic> json) {
    ErrorState errorState = (json==null) ? null : ErrorState.fromJson(json['errorState']);
    MessageState messageState = (json==null) ? null : MessageState.fromJson(json['messageState']);
    UserState userState = (json==null) ? null : UserState.fromJson(json['userState']);

    return AppState(
      errorState: errorState,
      messageState: messageState,
      userState: userState,
    );
  }

  Map<String, dynamic> toJson() => {
    'errorState': errorState.toJson(),
    'messageState': messageState.toJson(),
    'userState': userState.toJson(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          errorState == other.errorState &&
          messageState == other.messageState &&
          userState == other.userState;

  @override
  int get hashCode =>
      errorState.hashCode ^ messageState.hashCode ^ userState.hashCode;
}