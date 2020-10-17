import 'package:flutter/material.dart';

class SetError {
  final bool isShowing;
  final String errorCode;
  final String errorDescription;


  SetError({
    @required this.isShowing,
    @required this.errorCode,
    @required this.errorDescription,
  });

  toJson() {
    return {
      'isShowing': isShowing,
      'errorCode': errorCode,
      'errorDescription': errorDescription
    };
  }
}

class DismissError {}

