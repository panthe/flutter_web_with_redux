import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ShowError {
  final BuildContext context;
  final int errorCode;
  final String errorDescription;


  ShowError({
    @required this.context,
    @required this.errorCode,
    @required this.errorDescription,
  });

  @override
  String toString() {
    return 'ShowError{errorCode: $errorCode, errorDescription: $errorDescription}';
  }
}

class DismissError {
  final BuildContext context;

  DismissError({
    @required this.context
  });
}

