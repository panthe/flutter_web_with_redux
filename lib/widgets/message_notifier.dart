import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_with_redux/config/keys.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/message/message_vm.dart';

class MessageNotifier extends StatelessWidget {
  final Widget child;

  MessageNotifier({this.child});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MessageViewModel>(
      distinct: true,
      converter: (store) => MessageViewModel.fromStore(store),
      builder: (context, vm) => child,
      onWillChange: (s1,s2) {
        if (s2.messageState.isShowing) {
          Keys.scaffoldKey.currentState.showSnackBar(
              SnackBar(
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 30),
                  content: Text("${s2.messageState.messageCode} - ${s2.messageState.messageDescription}"),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: "OK",
                    onPressed: () => {},
                  )
              )
          ).closed.then((value) => s2.dismissMessage());
        }
      },
    );
  }
}
