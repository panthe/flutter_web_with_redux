import 'package:flutter_web_with_redux/redux/message/message_state.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/message/message_actions.dart';
import 'package:redux/redux.dart';

class MessageViewModel {
  final Function dismissMessage;
  final MessageState messageState;

  MessageViewModel({this.dismissMessage, this.messageState});

  static MessageViewModel fromStore(Store<AppState> store) {
    return MessageViewModel(
        dismissMessage: () => store.dispatch(DismissMessage()),
        messageState: store.state.messageState);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageViewModel &&
          runtimeType == other.runtimeType &&
          messageState == other.messageState;

  @override
  int get hashCode => dismissMessage.hashCode ^ messageState.hashCode;
}
