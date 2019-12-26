import 'package:meta/meta.dart';
import '../error/error_state.dart';
import '../message/message_state.dart';
import '../user/user_state.dart';

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
}