import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_with_redux/config/keys.dart';
import 'package:flutter_web_with_redux/redux/app/app_state.dart';
import 'package:flutter_web_with_redux/redux/error/error_vm.dart';

class ErrorNotifier extends StatelessWidget {
  final Widget child;

  ErrorNotifier({this.child});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ErrorViewModel>(
      distinct: true,
      converter: (store) => ErrorViewModel.fromStore(store),
      builder: (context, vm) => child,
      onWillChange: (vmOld, vm) {
        if (vm.errorState.isShowing) {
          Keys.scaffoldKey.currentState.showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 30),
              content: Text("${vm.errorState.errorCode} - ${vm.errorState.errorDescription}"),
              action: SnackBarAction(
                textColor: Colors.black,
                label: "OK",
                onPressed: () => {},
              )
            )
          ).closed.then((value) => vm.dismissError());
        }
      },
    );
  }
}
